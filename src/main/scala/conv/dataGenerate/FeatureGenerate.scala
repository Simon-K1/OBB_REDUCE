package conv.dataGenerate

import spinal.core.{Area, Bits, Bool, Bundle, Component, Device, False, IntToBuilder, Mem, Reg, RegInit, RegNext, SpinalEnum, SpinalVerilog, True, UInt, Vec, binaryOneHot, default, in, is, log2Up, out, switch, when}
import spinal.lib.{Delay, Flow, IMasterSlave, StreamFifo, flowBitsPimped, master, slave}
import wa.{WaCounter, WaStreamFifo}

/**
 *
 * @param DATA_WIDTH                数据位宽，8bit
 * @param CHANNEL_WIDTH             通道位宽，8, <256
 * @param COMPUTE_CHANNEL_NUM       一次可计算的卷积核数量 8
 * @param FEATURE_WIDTH             图片位宽，log2(640) = 10
 * @param KERNEL_NUM                3*3的卷积核，9个数
 * @param FEATURE_RAM_DEPTH         FIFO深度，2048
 *
 * new FeatureGenerate(FeatureGenerateConfig(8, 8, 8, 10, 9, 2048))
 */

case class FeatureGenerateConfig(DATA_WIDTH: Int, CHANNEL_WIDTH: Int, COMPUTE_CHANNEL_NUM: Int, FEATURE_WIDTH: Int, KERNEL_NUM: Int, FEATURE_RAM_DEPTH: Int) {
    val PICTURE_NUM = 1         // 图片数量
    val STREAM_DATA_WIDTH = DATA_WIDTH * PICTURE_NUM * COMPUTE_CHANNEL_NUM     // 一次传输量，64bits
}

/**
 *数据生成状态
 * IDLE->INIT->WAIT->END->WAIT->END->FIFO_READY->WR //准备两行数据，开始卷积
 * WR->END->FIFO_READY->WR->END->FIFO_READY->WR->END    // 卷积过程
 * END->IDLE        //一张图计算完成
 */
object FeatureGenerateEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
    val IDLE, INIT, WAIT, FIFO_READY, WR, END = newElement
}

case class FeatureGenerateFsm(start: Bool) extends Area {

    val initEnd = Bool()
    val waitEnd = Bool()
    val wrEnd = Bool()
    val endEnd = Bool()
    val wait2 = Bool()

    val fifoReady = Bool()

    val currentState = Reg(FeatureGenerateEnum()) init FeatureGenerateEnum.IDLE
    val nextState = FeatureGenerateEnum()
    currentState := nextState

    switch(currentState) {
        is(FeatureGenerateEnum.IDLE) {
            when(start) {
                nextState := FeatureGenerateEnum.INIT
            } otherwise {
                nextState := FeatureGenerateEnum.IDLE
            }
        }
        is(FeatureGenerateEnum.INIT) {
            when(initEnd) {
                nextState := FeatureGenerateEnum.WAIT
            } otherwise {
                nextState := FeatureGenerateEnum.INIT
            }
        }
        is(FeatureGenerateEnum.WAIT) {
            when(waitEnd) {
                nextState := FeatureGenerateEnum.END
            } otherwise {
                nextState := FeatureGenerateEnum.WAIT
            }
        }
        is(FeatureGenerateEnum.FIFO_READY) {
            when(fifoReady) {
                nextState := FeatureGenerateEnum.WR
            } otherwise {
                nextState := FeatureGenerateEnum.FIFO_READY
            }
        }
        is(FeatureGenerateEnum.WR) {
            when(wrEnd) {
                nextState := FeatureGenerateEnum.END
            } otherwise {
                nextState := FeatureGenerateEnum.WR
            }
        }
        is(FeatureGenerateEnum.END) {
            when(wait2) {
                nextState := FeatureGenerateEnum.WAIT
            } elsewhen (endEnd) {
                nextState := FeatureGenerateEnum.IDLE
            } otherwise {
                nextState := FeatureGenerateEnum.FIFO_READY
            }
        }
    }


}

case class GenerateMatrixPort(dataWidth: Int, kernelNum: Int) extends Bundle {
    val mData = Vec(master Flow UInt(dataWidth bits), kernelNum)
    val ready = in Bool()
}

class FeatureGenerate(featureGenerateConfig: FeatureGenerateConfig) extends Component {
    val io = new Bundle {
        val sData = slave Stream UInt(featureGenerateConfig.STREAM_DATA_WIDTH bits)  // 64 bits
        val mData = GenerateMatrixPort(featureGenerateConfig.STREAM_DATA_WIDTH, featureGenerateConfig.KERNEL_NUM)   // vec(64 bits , 9)
        val rowNumIn = in UInt (featureGenerateConfig.FEATURE_WIDTH bits)   // 642,10bits
        val colNumIn = in UInt (featureGenerateConfig.FEATURE_WIDTH bits)   // 642,10bits
        val start = in Bool()
        val channelIn = in UInt (featureGenerateConfig.CHANNEL_WIDTH bits)  //32, 8 bits
        //        val last = out Bool()
    }
    noIoPrefix()

    val channelTimes: UInt = RegNext(io.channelIn >> log2Up(featureGenerateConfig.COMPUTE_CHANNEL_NUM), 0)      //  输入通道数 / 一次能计算的通道数 = 一个像素需要几个周期
    val totalCnt = RegNext(channelTimes * io.colNumIn)      // 4 * 640，读取一行所消耗的次数（周期）
    val fsm = FeatureGenerateFsm(io.start)                  // IDLE->INIT

    fsm.fifoReady := io.mData.ready                         // 下层传来ready，输出数据


    val rdAddr = Reg(UInt(log2Up(featureGenerateConfig.FEATURE_RAM_DEPTH) bits)) init 0     //log2(2048)=11
    val wrData = Vec(UInt(featureGenerateConfig.STREAM_DATA_WIDTH bits), 2)           //Vec(64bit,2)
    val rdData = Vec(UInt(featureGenerateConfig.STREAM_DATA_WIDTH bits), 2)

    val wrAddr = RegNext(rdAddr)            //写地址延迟读地址一拍，所以当前地址先读后写，其导致当前rdData 读到的总是为上一行的数据

    when(io.sData.fire) {                   //padding数据到来
        when(rdAddr === totalCnt - 1) {
            rdAddr := 0
        } otherwise {
            rdAddr := rdAddr + 1
        }
    }
    wrData(0) := RegNext(io.sData.payload)      //接收padding数据
    wrData(1) := rdData(0)                      // 由上得知，rdData(0)总为wrData(0)上一行的数据，存入wrData(1)后，同理rdData(0)也为wrData(1)上一行的数据。以此一次缓存三行数据
    /**
     * 数据流动
     *                   sData.payload    ---> 第三行输出
     * wrData(0) ----------->   mem0
     *                           |
     *                           |
     * wrData(1) <----------   rdData(0) ---> 第二行输出
     *   |
     *   |
     * wrData(1) ----------->   mem1
     *                           |
     *                           |
     *                         rdData(1) ---> 第一行输出
     */
    val mem = Array.tabulate(2)(i => {      // 生成两个gen()
        def gen(): Mem[UInt] = {
            // mem(64 bit,2048)
            val mem = Mem(UInt(featureGenerateConfig.STREAM_DATA_WIDTH bits), wordCount = featureGenerateConfig.FEATURE_RAM_DEPTH).addAttribute("ram_style = \"block\"")
            mem.write(wrAddr, wrData(i), RegNext(io.sData.fire))        //将sData.payload数据延迟一个周期后写入mem
            rdData(i) := mem.readSync(rdAddr)
            mem
        }
        gen()
    })
    val initCount = WaCounter(fsm.currentState === FeatureGenerateEnum.INIT, 3, 5)
    fsm.initEnd := initCount.valid

    val channelCnt = WaCounter(io.sData.fire, featureGenerateConfig.CHANNEL_WIDTH, channelTimes - 1)
    // 通道计数0 ~ channelTimes-1

    val columnCnt = WaCounter(channelCnt.valid && io.sData.fire, featureGenerateConfig.FEATURE_WIDTH, io.colNumIn - 1)
    // 列计数，入完一个点的所有通道，+1，计算sData.payload的列数

    val rowCnt = WaCounter(fsm.currentState === FeatureGenerateEnum.END, featureGenerateConfig.FEATURE_WIDTH, io.rowNumIn - 1)


    /**
     *   (第一行入)       (第二行入)      (第三行入)
     *  WAIT -> END -> WAIT -> END -> WAIT -> END -> FIFO_READY
     */

    //一行入完， WAIT->END
    fsm.waitEnd := channelCnt.valid && columnCnt.valid

    //数据少于两行，END->WAIT
    fsm.wait2 := rowCnt.count < 1

    //一行入完，WR->END
    fsm.wrEnd := channelCnt.valid && columnCnt.valid

    //END->IDLE
    fsm.endEnd := rowCnt.valid

    // 处于WAIT或者WR时，让padding层数据流入
    when(fsm.currentState === FeatureGenerateEnum.WAIT || fsm.currentState === FeatureGenerateEnum.WR) {
        io.sData.ready := True
    } otherwise {
        io.sData.ready := False
    }
    val valid = Vec(Reg(Bool()) init False, featureGenerateConfig.KERNEL_NUM)



    when(fsm.currentState === FeatureGenerateEnum.WR) {     //当三行数据准备好，并且下层准备好接受数据后
        when(columnCnt.count < io.colNumIn - 2) {       //  0 ~ 9
            //第一列数据
            //当第一列valid有效时，sData.payload数据已经提前一个时钟周期到达，此后mData(6).payload相对于sData.payload延迟了4个周期数据才有效，所以mData(6).valid 需要相对于valid(6)延迟 4 - 1 = 3个时钟周期
            valid(0) := True
            valid(3) := True
            valid(6) := True
        } otherwise {
            valid(0) := False
            valid(3) := False
            valid(6) := False
        }
        when(columnCnt.count > 0 && columnCnt.count < io.colNumIn - 1) {        // 1 ~ 10
            //第二列数据
            valid(1) := True
            valid(4) := True
            valid(7) := True
        } otherwise {
            valid(1) := False
            valid(4) := False
            valid(7) := False
        }
        when(columnCnt.count > 1 && columnCnt.count < io.colNumIn) {        // 2 ~ 11
            //第三列数据
            valid(2) := True
            valid(5) := True
            valid(8) := True
        } otherwise {
            valid(2) := False
            valid(5) := False
            valid(8) := False
        }
    } otherwise {
        valid.map(_ := False)
    }

    // valid延迟拉高，延迟的时钟数由下面payload获取实际数据所用时钟数决定
    io.mData.mData(0).valid := Delay(valid(0), 3)       //Return para1 delayed by para2 cycles
    io.mData.mData(3).valid := Delay(valid(3), 3)
    io.mData.mData(6).valid := Delay(valid(6), 3)
    io.mData.mData(1).valid := Delay(valid(1), 2)
    io.mData.mData(4).valid := Delay(valid(4), 2)
    io.mData.mData(7).valid := Delay(valid(7), 2)
    io.mData.mData(2).valid := Delay(valid(2), 1)
    io.mData.mData(5).valid := Delay(valid(5), 1)
    io.mData.mData(8).valid := Delay(valid(8), 1)

    io.mData.mData(0).payload := RegNext(io.mData.mData(1).payload) //同下，延迟3个时钟周期
    io.mData.mData(1).payload := RegNext(io.mData.mData(2).payload) //同下，延迟2个时钟周期
    io.mData.mData(2).payload := RegNext(rdData(1))     //io.mData.mData(2).payload 延迟1个时钟周期获得rdData(1)实际图片数据，所以valid需要延迟1个时钟周期

    io.mData.mData(3).payload := RegNext(io.mData.mData(4).payload) //同上，延迟3个时钟周期
    io.mData.mData(4).payload := RegNext(io.mData.mData(5).payload)
    io.mData.mData(5).payload := RegNext(rdData(0))

    io.mData.mData(6).payload := RegNext(io.mData.mData(7).payload)
    io.mData.mData(7).payload := RegNext(io.mData.mData(8).payload)
    io.mData.mData(8).payload := RegNext(RegNext(io.sData.payload))     //延迟了两个时钟周期，消除错位，见波形

}

//object FeatureGenerateConfig {
//    def main(args: Array[String]): Unit = {
//        SpinalVerilog(new FeatureGenerate(FeatureGenerateConfig(8, 10, 8, 8, 9, 10)))
//    }
//}