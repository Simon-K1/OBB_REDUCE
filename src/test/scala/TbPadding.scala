import spinal.core._
import spinal.lib._
import spinal.core.sim._
import conv.dataGenerate._
class TbPadding extends  Padding(PaddingConfig(8,8,8,8,1)){

  def init = {
    io.sData.valid #= false
    io.sData.payload #= 0
    io.mData.ready #= true
    io.start #= false

    io.zeroNum #= 1
    io.enPadding #= true
    io.channelIn #= 8
    io.rowNumIn #= 8
    io.colNumIn #= 8
    io.zeroDara #= 0
    io.zeroNum #= 1
    clockDomain.waitSampling(10)
    SimTimeout(10 * 1000)
  }
  def in :Unit ={
    for(i <- 0 to 64){
      io.sData.payload #= BigInt("1010101010101010",16)+i   //输入图片数据
      io.sData.valid #= true
      clockDomain.waitActiveEdgeWhere(io.sData.ready.toBoolean)
    }
  }
  def out: Unit={

  }
}
object TbPadding extends App{

  val spinalConfig = SpinalConfig(defaultClockDomainFrequency = FixedFrequency(10 MHz))
    SimConfig.withConfig(spinalConfig).withWave.compile(new TbPadding).doSim { dut =>
      dut.clockDomain.forkStimulus(10)
      dut.init
      dut.io.start #= true
      dut.in
    }
}