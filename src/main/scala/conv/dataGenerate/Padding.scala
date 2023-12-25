package conv.dataGenerate
import com.google.gson.JsonParser
import spinal.core.{Area, Bits, Bool, Bundle, ClockDomainConfig, Component, False, HIGH, IntToBuilder, Reg, RegInit, RegNext, SYNC, SpinalConfig, SpinalEnum, True, UInt, binaryOneHot, in, is, log2Up, out, switch, when}
import spinal.lib.{Counter, master, slave}
import wa.{WaCounter, WaStreamFifo}
import spinal.core.sim._

import scala.io.Source

/**
 *
 * @param DATA_WIDTH                数据位宽，8bit
 * @param CHANNEL_WIDTH             通道位宽，8, <256
 * @param COMPUTE_CHANNEL_NUM       一次可计算的卷积核数量 8
 * @param FEATURE_WIDTH             图片位宽，log2(640) = 10
 * @param ZERO_NUM                  补零展一，扩位，1
 */
// 8 12 8 10 1
case class PaddingConfig(DATA_WIDTH: Int, CHANNEL_WIDTH: Int, COMPUTE_CHANNEL_NUM: Int, FEATURE_WIDTH: Int, ZERO_NUM: Int) {
    val PICTURE_NUM = 1             // 图片数量
    val STREAM_DATA_WIDTH = DATA_WIDTH * PICTURE_NUM * COMPUTE_CHANNEL_NUM  // 一次传输量，8 * 1 * 8
    val ZERO_NUM_WIDTH = ZERO_NUM.toBinaryString.length             // 1
}

/**
 * 补零状态
 * IDLE->INIT
 * 左上上上上上右
 * 左中中中中中右
 * 左中中中中中右
 * 左下下下下下右
 * END
 */
object PaddingEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
    val IDLE, INIT, UPDOWN, LEFT, CENTER, RIGHT, END = newElement
    //IDLE:01
    //init:02
    //LEFT:08
    //UPDOWN:04
    //CENTER:10
}


case class PaddingFsm(start: Bool) extends Area {

    val initEnd = Bool()
    val leftEnd = Bool()
    val rightEnd = Bool()
    val upDownEnd = Bool()
    val centerEnd = Bool()
    val endEnd = Reg(False)
    val enPadding = Bool()
    val enUpDown = Bool()
    val currentState = Reg(PaddingEnum()) init PaddingEnum.IDLE
    val nextState = PaddingEnum()
    currentState := nextState
    switch(currentState) {
        is(PaddingEnum.IDLE) {
            when(start) {
                nextState := PaddingEnum.INIT
            } otherwise {
                nextState := PaddingEnum.IDLE
            }
        }
        is(PaddingEnum.INIT) {
            when(initEnd) {
                when(enPadding) {
                    nextState := PaddingEnum.LEFT
                } otherwise {
                    nextState := PaddingEnum.CENTER
                }
            } otherwise {
                nextState := PaddingEnum.INIT
            }
        }
        is(PaddingEnum.UPDOWN) {
            when(upDownEnd) {
                nextState := PaddingEnum.RIGHT
            } otherwise {
                nextState := PaddingEnum.UPDOWN
            }
        }
        is(PaddingEnum.LEFT) {
            when(leftEnd) {
                when(enUpDown) {
                    nextState := PaddingEnum.UPDOWN
                } otherwise {
                    nextState := PaddingEnum.CENTER
                }

            } otherwise {
                nextState := PaddingEnum.LEFT
            }
        }
        is(PaddingEnum.CENTER) {
            when(centerEnd) {
                when(enPadding) {
                    nextState := PaddingEnum.RIGHT
                } otherwise {
                    nextState := PaddingEnum.END
                }
            } otherwise {
                nextState := PaddingEnum.CENTER
            }

        }
        is(PaddingEnum.RIGHT) {
            when(rightEnd) {
                nextState := PaddingEnum.END
            } otherwise {
                nextState := PaddingEnum.RIGHT
            }
        }
        is(PaddingEnum.END) {
            when(endEnd) {
                nextState := PaddingEnum.IDLE
            } elsewhen (enPadding) {
                nextState := PaddingEnum.LEFT
            } otherwise {
                nextState := PaddingEnum.CENTER
            }
        }
    }
}

class Padding(paddingConfig: PaddingConfig) extends Component {
    val io = new Bundle {
        val sData = slave Stream (UInt(paddingConfig.STREAM_DATA_WIDTH bits))   //64bit
        val mData = master Stream (UInt(paddingConfig.STREAM_DATA_WIDTH bits))  simPublic()
        val enPadding = in Bool()                                               //1,使能
        val channelIn = in UInt (paddingConfig.CHANNEL_WIDTH bits)              //输入通道32
        val start = in Bool()                                                   //开始信号，IDLE->INIT
        val rowNumIn = in UInt (paddingConfig.FEATURE_WIDTH bits)               //640,10bit 输入图片行数
        val rowNumOut = out UInt (paddingConfig.FEATURE_WIDTH bits)             //642,10bit 输出图片行数
        val colNumIn = in UInt (paddingConfig.FEATURE_WIDTH bits)               //640,10bit 输入图片列数
        val colNumOut = out UInt (paddingConfig.FEATURE_WIDTH bits)             //642,10bit 输出图片列数
        val zeroDara = in Bits (paddingConfig.DATA_WIDTH bits)                  //0,1bit
        val zeroNum = in UInt (paddingConfig.ZERO_NUM_WIDTH bits)               //1         每个方向补0的数量
        val last = out Bool()
    }
    noIoPrefix()
    when(io.enPadding) {
        io.rowNumOut := (io.zeroNum << 1) + io.rowNumIn
        io.colNumOut := (io.zeroNum << 1) + io.colNumIn
    } otherwise {
        io.rowNumOut := io.rowNumIn
        io.colNumOut := io.colNumIn
    }

    val channelTimes: UInt = RegNext(io.channelIn >> log2Up(paddingConfig.COMPUTE_CHANNEL_NUM), 0)
    //  总通道数 / 一次计算的通道数 = 要计算的次数，根据要计算次数创建通道计数器

    val fifo = WaStreamFifo(UInt(paddingConfig.STREAM_DATA_WIDTH bits), 5)
    // 设置一个Fifo作为缓存
    // pop：FIFO的出栈； 将FIFO里存的图片数据输出到mData当中
    fifo.io.pop <> io.mData

    val fsm = PaddingFsm(io.start)
    fsm.enPadding := io.enPadding
    // push: 入栈；当ready信号拉高，说明FIFO没满，可以入栈；当fsm处于CENTER并FIFO没满时，此时图片数据输入
    io.sData.ready <> (fifo.io.push.ready && fsm.currentState === PaddingEnum.CENTER)


    /**
     * 将src按照dataWidth循环存入dst
     * @param dst           destnation
     * @param src
     * @param dataWidth
     */
    private def assign(dst: UInt, src: UInt, dataWidth: Int): Unit = {
        if (dst.getWidth == dataWidth) dst := src
        else {
            assign(dst(dataWidth - 1 downto 0), src, dataWidth)
            assign(dst(dst.getWidth - 1 downto dataWidth), src, dataWidth)
        }
    }

    private def selfClear(in: Bool, en: Bool): Unit = {
        when(en) {
            in := True
        } otherwise {
            in := False
        }
    }

    val initEn = RegInit(False) setWhen (fsm.currentState === PaddingEnum.INIT) clearWhen (fsm.nextState =/= PaddingEnum.INIT)

    // init状态时，计数八个周期
    val initCount = WaCounter(initEn, 5, 8)
    when(fsm.currentState === PaddingEnum.IDLE) {
        initCount.clear         //重新开始计数  initCount.valid = true时归零
    }
    fsm.initEnd := initCount.valid

    // 填充0的有效信号
    val zeroValid = Bool()
    when(fsm.currentState === PaddingEnum.CENTER) {
        // 当fsm为CENTER时，图片数据要输入到FIFO里
        fifo.io.push.valid := io.sData.valid
        fifo.io.push.payload := io.sData.payload
    } otherwise {
    //为其他状态时，将payload全置零
    fifo.io.push.valid := zeroValid

    assign(fifo.io.push.payload, io.zeroDara.asUInt, paddingConfig.DATA_WIDTH)      //(64 bits,8 bits,8 bits)
        //将zeroDara数据流入fifo
}

    val channelCnt = WaCounter(fifo.io.push.fire, paddingConfig.CHANNEL_WIDTH, channelTimes - 1)
    //通道计数器，当完成一次数据传输后+1,其代表:当消息在总线上完成了传递或者说握手完成(valid && ready)则返回true


    when(fsm.currentState === PaddingEnum.IDLE) {
        channelCnt.clear//清空通道计数器
    }

    val colCnt = WaCounter(channelCnt.valid && (fifo.io.push.fire), paddingConfig.FEATURE_WIDTH, io.colNumOut - 1)
    //列计数器。由于列扫描，当一列所有通道计算完后，即channelCnt.valid为true时，计数器+1

    when(fsm.currentState === PaddingEnum.IDLE) {
        colCnt.clear    //清空列计数器
    }

    val rowCnt = WaCounter(fsm.nextState === PaddingEnum.END, paddingConfig.FEATURE_WIDTH, io.rowNumOut - 1)
    //行计数器，当状态从left->updown->right->end进行一轮后，行计数器+1

    when(fsm.currentState === PaddingEnum.IDLE) {
        rowCnt.clear
    }


    selfClear(zeroValid, fsm.currentState === PaddingEnum.LEFT || fsm.currentState === PaddingEnum.RIGHT || fsm.currentState === PaddingEnum.UPDOWN)
    //zeroValid只有当前状态为上下左右时才为true
    selfClear(fsm.leftEnd, colCnt.count === io.zeroNum - 1 && channelCnt.valid && fifo.io.push.fire)
    //colCnt.count == io.zeroNum - 1 补图片最左边io.zeroNum个数列的0。即下图中的l
    //channelCnt.valid      补完所有通道之后为true
    /** (l:left,u:up,r:right,d:down)padding状态
     * luuur
     * lcccr
     * lcccr
     * lcccr
     * ldddr
     */
    //leftEnd为左补0结束标志，当列计数器
    selfClear(fsm.rightEnd, colCnt.count === io.colNumOut - 1 && channelCnt.valid && fifo.io.push.fire)
    //colCnt.count === io.colNumOut - 1   是否计算到了最后一列


    selfClear(fsm.endEnd, rowCnt.count === io.rowNumOut - 1)
    //整个padding结束标志

    selfClear(fsm.upDownEnd, colCnt.count === io.colNumOut - io.zeroNum - 1 && channelCnt.valid && fifo.io.push.fire)
    //当colCnt为最后一列时为true,(即将转入right状态) (-1是因为计数器下标从0开始)

    selfClear(fsm.centerEnd, colCnt.count === io.colNumOut - io.zeroNum - 1 && channelCnt.valid && fifo.io.push.fire)
    //同上

    selfClear(fsm.enUpDown, rowCnt.count < io.zeroNum || rowCnt.count > io.rowNumOut - io.zeroNum - 1)
    //如果zeroNum=1,当在第一行以及最后一行时为true
    selfClear(io.last, fsm.currentState === PaddingEnum.END && fsm.nextState === PaddingEnum.IDLE)
    //padding 结束

    def >>(featureGenerate: FeatureGenerate): Unit = {
        io.rowNumOut <> featureGenerate.io.rowNumIn
        io.colNumOut <> featureGenerate.io.colNumIn
        featureGenerate.io.channelIn := io.channelIn
        io.mData <> featureGenerate.io.sData
        featureGenerate.io.start := io.start
    }
}

object Padding {
    def main(args: Array[String]): Unit = {
        //
        //        val json = Source.fromFile("G:/spinal_cnn_accelerator/simData/config.json").mkString
        //        val jsonP = new JsonParser().parse(json)
        //        val zeroNum = jsonP.getAsJsonObject.get("paddingSim").getAsJsonObject.get("zeroNum").getAsInt
        //        val COMPUTE_CHANNEL_NUM = jsonP.getAsJsonObject.get("total").getAsJsonObject.get("COMPUTE_CHANNEL_NUM").getAsInt
        //        val DATA_WIDTH = jsonP.getAsJsonObject.get("total").getAsJsonObject.get("DATA_WIDTH").getAsInt
        //        val CHANNEL_WIDTH = jsonP.getAsJsonObject.get("total").getAsJsonObject.get("CHANNEL_WIDTH").getAsInt
        //        val FEATURE_WIDTH = jsonP.getAsJsonObject.get("total").getAsJsonObject.get("FEATURE_WIDTH").getAsInt

        val paddingConfig = PaddingConfig(8, 12, 8, 10, 1)
        SpinalConfig(
            genVhdlPkg = false,
            enumPrefixEnable = false,
            defaultConfigForClockDomains = ClockDomainConfig(resetActiveLevel = HIGH, resetKind = SYNC)
        ).withoutEnumString().generateVerilog(new Padding(paddingConfig)).printPruned()
    }
}
