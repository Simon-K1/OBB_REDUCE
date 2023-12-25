package shape

import spinal.core._


object State {
    val IDLE = 0
    val MAX_POOLING = 1
   // val SPLIT = 2
    val UP_SAMPLING = 2
    val CONCAT = 3
    //val ADD = 5
    val IRQ = 15
}

object Control {
    val IDLE = 0
    val MAX_POOLING = 1
    //val SPLIT = 2
    val UP_SAMPLING = 2
    val CONCAT = 3
    //val ADD = 5
    val IRQ = 15
}

//object Complete {
//    val IDLE = 0
//    val MAX_POOLING = 1
//    val SPLIT = 2
//    val UP_SAMPLING = 3
//    val CONCAT = 4
//}

object ShapeStateEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
    val IDLE, MAX_POOLING, UP_SAMPLING, CONCAT, IRQ = newElement
}

case class ShapeStateFsm(control: Bits, complete: Bool) extends Area {
    val currentState = Reg(ShapeStateEnum()) init ShapeStateEnum.IDLE
    val nextState = ShapeStateEnum()
    currentState := nextState
    switch(currentState) {
        is(ShapeStateEnum.IDLE) {
            switch(control) {
                is(Control.MAX_POOLING) {
                    nextState := ShapeStateEnum.MAX_POOLING
                }
                is(Control.UP_SAMPLING) {
                    nextState := ShapeStateEnum.UP_SAMPLING
                }
                is(Control.CONCAT) {
                    nextState := ShapeStateEnum.CONCAT
                }
                default {
                    nextState := ShapeStateEnum.IDLE
                }
            }
        }
        is(ShapeStateEnum.MAX_POOLING) {
            when(complete) {
                nextState := ShapeStateEnum.IRQ
            } otherwise {
                nextState := ShapeStateEnum.MAX_POOLING
            }

        }
        is(ShapeStateEnum.UP_SAMPLING) {
            when(complete) {
                nextState := ShapeStateEnum.IRQ
            } otherwise {
                nextState := ShapeStateEnum.UP_SAMPLING
            }
        }
        is(ShapeStateEnum.CONCAT) {
            when(complete) {
                nextState := ShapeStateEnum.IRQ
            } otherwise {
                nextState := ShapeStateEnum.CONCAT
            }
        }
        is(ShapeStateEnum.IRQ) {
            when(control === Control.IRQ) {
                nextState := ShapeStateEnum.IDLE
            } otherwise {
                nextState := ShapeStateEnum.IRQ
            }
        }
    }
}

object Start {
    val MAX_POOLING = 0
    //val SPLIT = 1
    val UP_SAMPLING = 1
    val CONCAT = 2
    //val ADD = 4
}

//Shape指令col和channel更改
object Instruction {
    def ROW_NUM_IN = 10 downto 0

    def COL_NUM_IN = 21 downto 11

    def CHANNEL_IN = 53 downto 43

    def CHANNEL_IN1 = 42 downto 32

    def SCALE = 95 downto 64

    def SCALE1 = 127 downto 96

    def ZERO = 159 downto 128

    def ZERO1 = 191 downto 160

    val Reg0 = ("ROW_NUM_IN", ROW_NUM_IN.length, "COL_NUM_IN", COL_NUM_IN.length)
    val Reg1 = ("CHANNEL_IN1", CHANNEL_IN1.length, "CHANNEL_IN", CHANNEL_IN.length)
    val Reg2 = ("SCALE", SCALE.length)
    val Reg3 = ("SCALE1", SCALE1.length)
    val Reg4 = ("ZERO", ZERO.length)
    val Reg5 = ("ZERO1", ZERO1.length)
    val Reg = Seq(("Reg0", Reg0), ("Reg1", Reg1), ("Reg2", Reg2), ("Reg3", Reg3), ("Reg4", Reg4), ("Reg5", Reg5))
}

class ShapeState extends Component {
    val io = new Bundle {
        val control = in Bits (4 bits)
        val complete = in Bool()
        val state = out(Reg(Bits(4 bits)))
        val start = out(Vec(Reg(Bool()), 3))
        val dmaReadValid = out(Vec(Bool(), 2))
        val dmaWriteValid = out(Bool())
    }
    noIoPrefix()

    val fsm = ShapeStateFsm(io.control, io.complete)

    val dmaReadValid = Vec(Vec(Reg(Bool()) init False, 2), 3)
    val dmaWriteValid = Vec(Reg(Bool()) init False, 3)

    //    io.dmaReadValid := Vec(dmaReadValid.foreach(i=>i(0)))
    io.dmaReadValid(0) := dmaReadValid(0)(0) ^ dmaReadValid(1)(0) ^ dmaReadValid(2)(0)
    io.dmaReadValid(1) := dmaReadValid(0)(1) ^ dmaReadValid(1)(1) ^ dmaReadValid(2)(1)
    //    io.dmaReadValid(1) := dmaReadValid(1).reduce(_ ^ _)
    io.dmaWriteValid := dmaWriteValid.reduce(_ ^ _)

    def setStart(en: Bool, index: Int, isConcat: Boolean = false): Unit = {
        when(en) {
            io.start(index) := True
            if (isConcat) {
                dmaReadValid(index) := Vec(True, True)
            } else {
                dmaReadValid(index) := Vec(True, False)
            }
            dmaWriteValid(index) := True

        } otherwise {
            io.start(index) := False
            dmaReadValid(index).map(_ := False)
            dmaWriteValid(index) := False
        }
    }

    setStart(fsm.currentState === ShapeStateEnum.IDLE && fsm.nextState === ShapeStateEnum.MAX_POOLING, Start.MAX_POOLING)
    setStart(fsm.currentState === ShapeStateEnum.IDLE && fsm.nextState === ShapeStateEnum.UP_SAMPLING, Start.UP_SAMPLING)
    setStart(fsm.currentState === ShapeStateEnum.IDLE && fsm.nextState === ShapeStateEnum.CONCAT, Start.CONCAT, true)
    switch(fsm.currentState) {
        is(ShapeStateEnum.CONCAT) {
            io.state := State.CONCAT
        }
        is(ShapeStateEnum.MAX_POOLING) {
            io.state := State.MAX_POOLING
        }
        is(ShapeStateEnum.UP_SAMPLING) {
            io.state := State.UP_SAMPLING
        }
        is(ShapeStateEnum.IRQ) {
            io.state := State.IRQ
        }
        default {
            io.state := State.IDLE
        }
    }

}

object ShapeState extends App {
    SpinalVerilog(new ShapeState)
}
