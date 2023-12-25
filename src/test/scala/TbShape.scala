import spinal.core.sim._
import spinal.core._
import shape._
import TbCfg.Rom

import scala.collection.mutable.ArrayBuffer
class TbShape extends Component{
    val addr1 = UInt(log2Up(102400) bits)
    val data1 = UInt(64 bits)

    val addr2 = UInt(log2Up(102400) bits)
    val data2 = UInt(64 bits)

    val rom1 = new Rom(64,102400,"C:/Users/MrQi_/Desktop/44_block/input1.coe")
    val rom2 = new Rom(64,102400,"C:/Users/MrQi_/Desktop/44_block/input2.coe")

    rom1.io.addr := addr1
    rom1.io.data <> data1

    rom2.io.addr := addr2
    rom2.io.data <> data2
}


object TbShape extends App {
    val aaa = SimConfig.withXSimSourcesPaths(ArrayBuffer("C:/Users/MrQi_/Desktop/laboratory_projects/first_project/SpinalHDL_CNN_Accelerator_yolo/src/vu9p"), ArrayBuffer("")).withXilinxDevice("xcvu9p-fsgd2104-2LV-e")
    aaa.withXSim.withWave.compile(new Shape(ShapeConfig(8,8,416,10,1024))).doSim{
        dut=>
            dut.clockDomain.forkStimulus(5)
            dut.clockDomain.waitSampling(10)
            dut.io.instruction(0) #= 2147565608L
            dut.io.instruction(1) #= 512
            dut.io.instruction(2) #= 65536
            dut.io.instruction(3) #= 65536
            dut.io.instruction(4) #= 0
            dut.io.instruction(5) #= 0
            dut.io.sData(0).payload #= 0
            dut.io.sData(0).valid #= false
            dut.io.sData(1).payload #= 0
            dut.io.sData(1).valid #= false
            dut.io.mData.ready #= false
            dut.io.control #= 0
            dut.clockDomain.waitSampling(10)
            dut.io.mData.ready #= true
            dut.io.control #= 1
            dut.clockDomain.waitSampling()
            dut.io.control #= 0
            for (i <- 0 until 409600) {
                dut.io.sData(0).valid #= true
                dut.io.sData(0).payload #= i
                dut.clockDomain.waitSamplingWhere(dut.io.sData(0).valid.toBoolean && dut.io.sData(0).ready.toBoolean)
//                if(i == 5){
//                    dut.io.mData.ready #= false
//                    dut.clockDomain.waitSampling(10)
//                    dut.io.mData.ready #= true
//                }
                println(i)

            }
            dut.io.sData(0).valid #= false
            dut.clockDomain.waitSampling(10)
    }
    SpinalVerilog(new TbShape)
}
