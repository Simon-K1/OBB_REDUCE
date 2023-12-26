package conv.compute

import config.Config._
import spinal.core._
import spinal.lib._
import wa.WaCounter
import wa.xip.memory.xpm.{CLOCK_MODE, MEM_TYPE, sdpram}

object DataArrangeEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
  val IDLE, INIT, DATA_READY, ARRANGE = newElement
}

case class DataArrangeFsm() extends Area {
  val start = Bool()
  val initEnd = Bool()
  val dataReady = Bool()
  val arrangeEnd = Bool()

  val currentState = Reg(DataArrangeEnum()) init DataArrangeEnum.IDLE
  val nextState = DataArrangeEnum()
  currentState := nextState
  switch(currentState) {
    is(DataArrangeEnum.IDLE) {
      when(start) {
        nextState := DataArrangeEnum.INIT
      } otherwise {
        nextState := DataArrangeEnum.IDLE
      }
    }
    is(DataArrangeEnum.INIT) {
      when(initEnd) {
        nextState := DataArrangeEnum.DATA_READY
      } otherwise {
        nextState := DataArrangeEnum.INIT
      }
    }
    is(DataArrangeEnum.DATA_READY) {
      when(dataReady) {
        nextState := DataArrangeEnum.ARRANGE
      } otherwise {
        nextState := DataArrangeEnum.DATA_READY
      }
    }
    is(DataArrangeEnum.ARRANGE) {
      when(arrangeEnd) {
        nextState := DataArrangeEnum.IDLE
      } otherwise {
        nextState := DataArrangeEnum.ARRANGE
      }
    }
  }
}


class DataArrange(convConfig: ConvConfig) extends Component {
  val io = new Bundle {
    val sData = slave Stream UInt(convConfig.FEATURE_M_DATA_WIDTH bits)
    val mData = master Stream UInt(convConfig.FEATURE_M_DATA_WIDTH bits)
    val complete = out Bool()
    val start = in Bool()
    val enArrange = in Bool()
    val rowNumIn = in UInt (convConfig.FEATURE_WIDTH bits)
    val colNumIn = in UInt (convConfig.FEATURE_WIDTH bits)
    val channelOut = in UInt (convConfig.CHANNEL_WIDTH bits)
    val last = out Bool()
  }

  noIoPrefix()

  // 使能重排信号
  val dataArrangeFsm = DataArrangeFsm()
  dataArrangeFsm.start := io.enArrange && io.start

  val initCnt = WaCounter(dataArrangeFsm.currentState === DataArrangeEnum.INIT, 3, 7)
  dataArrangeFsm.initEnd := initCnt.valid

  val channelTimes = RegNextWhen(io.channelOut >> log2Up(convConfig.COMPUTE_CHANNEL_OUT_NUM), dataArrangeFsm.currentState === DataArrangeEnum.INIT)
  val colTimes = RegNextWhen(io.colNumIn, dataArrangeFsm.currentState === DataArrangeEnum.INIT)
  val rowTimes = RegNextWhen(io.rowNumIn, dataArrangeFsm.currentState === DataArrangeEnum.INIT)

  val channelCnt = WaCounter(dataArrangeFsm.currentState === DataArrangeEnum.DATA_READY && io.sData.fire, channelTimes.getWidth, channelTimes - 1)
  val colCnt = WaCounter(channelCnt.valid && io.sData.fire, colTimes.getWidth, colTimes - 1)
  val rowCnt = WaCounter(channelCnt.valid && colCnt.valid && io.sData.fire, rowTimes.getWidth, rowTimes - 1)

  val w_cnt = WaCounter(channelCnt.valid && io.sData.fire, log2Up(convConfig.COMPUTE_CHANNEL_OUT_NUM), convConfig.COMPUTE_CHANNEL_OUT_NUM- 1)

  when(dataArrangeFsm.currentState === DataArrangeEnum.DATA_READY) {
    io.sData.ready := True
  } otherwise {
    io.sData.ready := False
  }

  // 数据入完
  dataArrangeFsm.dataReady := rowCnt.valid && colCnt.valid && channelCnt.valid && io.sData.fire

  // 写使能
  val weav = Vec(Bool(), convConfig.COMPUTE_CHANNEL_OUT_NUM)

  // 写使能按列写入
  when(io.sData.fire && dataArrangeFsm.currentState === DataArrangeEnum.DATA_READY) {
    (0 until convConfig.COMPUTE_CHANNEL_OUT_NUM).foreach(i => {
      when(w_cnt.count === i) {
        weav(i).set()
      } otherwise {
        weav(i).clear()
      }
    })
  } otherwise {
    weav.map(w => w := False)
  }

  val w_addr = Vec(Reg(UInt(log2Up(convConfig.dataArrangeDepth) bits)) init 0, convConfig.COMPUTE_CHANNEL_OUT_NUM)
  (0 until convConfig.COMPUTE_CHANNEL_OUT_NUM).foreach(i => {
    when(weav(i)) {
      when(w_addr(i) === (colTimes * rowTimes * channelTimes >> log2Up(convConfig.COMPUTE_CHANNEL_OUT_NUM)) - 1) {
        w_addr(i) := 0
      } otherwise {
        w_addr(i) := w_addr(i) + 1
      }
    }
  })

  val r_addr = Reg(UInt(log2Up(convConfig.dataArrangeDepth * convConfig.COMPUTE_CHANNEL_OUT_NUM) bits)) init 0

  val res_fifo = StreamFifo(UInt(convConfig.FEATURE_M_DATA_WIDTH bits), 10)
  res_fifo.io.pop <> io.mData

  val r_en = dataArrangeFsm.currentState === DataArrangeEnum.ARRANGE && res_fifo.io.availability > 4

  res_fifo.io.push.valid := Delay(r_en, 2)

  val channel_cnt = WaCounter(r_en, convConfig.FEATURE_WIDTH * 2 - 4, (io.rowNumIn * io.colNumIn >> log2Up(convConfig.COMPUTE_CHANNEL_OUT_NUM)) - 1)
  val channel_offset_cnt = WaCounter(channel_cnt.valid && r_en, io.channelOut.getWidth, io.channelOut - 1)

  when(channel_cnt.valid && channel_offset_cnt.valid) {
    r_addr.clearAll()
  } elsewhen (channel_cnt.valid && r_en) {
    r_addr := (channel_offset_cnt.count + 1).resized
  } elsewhen (r_en) {
    r_addr := r_addr + io.channelOut
  } otherwise ({
    r_addr := r_addr
  })

  val dataRam = Array.tabulate(convConfig.COMPUTE_CHANNEL_OUT_NUM) { i =>
    def gen = {
      val temp = new sdpram(convConfig.FEATURE_M_DATA_WIDTH, convConfig.dataArrangeDepth, convConfig.DATA_WIDTH, convConfig.dataArrangeDepth * convConfig.COMPUTE_CHANNEL_OUT_NUM, MEM_TYPE.block, 2, CLOCK_MODE.common_clock, this.clockDomain, this.clockDomain)
      temp.io.wea   <> weav(i).asBits
      temp.io.ena   := True
      temp.io.addra := w_addr(i).asBits.resized
      temp.io.dina  <> io.sData.payload.asBits
      temp.io.enb   := True
      temp.io.addrb := r_addr.asBits.resized
      temp.io.doutb.asUInt  <> res_fifo.io.push.payload(i * 8 until (i + 1) * 8)
      temp
    }
    gen
  }


  val channelOutCnt = WaCounter(io.mData.fire, channelTimes.getWidth, channelTimes - 1)
  val colOutCnt = WaCounter(channelOutCnt.valid && io.mData.fire, colTimes.getWidth, colTimes - 1)
  val rowOutCnt = WaCounter(channelOutCnt.valid && colOutCnt.valid && io.mData.fire, rowTimes.getWidth, rowTimes - 1)

  io.last := channelOutCnt.valid && colOutCnt.valid && rowOutCnt.valid
  dataArrangeFsm.arrangeEnd := channel_cnt.valid && channel_offset_cnt.valid
  io.complete := channelOutCnt.valid && colOutCnt.valid && rowOutCnt.valid

  when(dataArrangeFsm.currentState === DataArrangeEnum.IDLE) {
    initCnt.clear
    channelCnt.clear
    colCnt.clear
    rowCnt.clear
    channel_cnt.clear
    w_cnt.clear
    channel_offset_cnt.clear
  }

}

object DataArrange extends App {
  val clkCfg = ClockDomainConfig(resetKind = SYNC, resetActiveLevel = LOW) // 同步低电平复位
  SpinalConfig(
    headerWithDate = true,
    oneFilePerComponent = false,
    targetDirectory = filePath, // 文件生成路径
    defaultConfigForClockDomains = clkCfg
  ).generateVerilog(new DataArrange(ConvConfig(8, 16, 16, 12, 8192, 512, 416, 2048, 1)))
}
