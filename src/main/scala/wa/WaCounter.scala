package wa

import spinal.core.{Area, Bool, False, IntToBuilder, Reg, True, UInt, when}

object WaCounter {
    def apply(en: Bool, width: Int, end: UInt) = new WaCounter(en, width, end)
}

class WaCounter(en: Bool, width: Int, cnt: UInt) extends Area {
    val count = Reg(UInt(width bits)) init 0
    val valid = Bool()          //当计数器满时valid才为true
    when(count === cnt) {
        valid := True
    } otherwise {
        valid := False
    }
    when(en) {          //当en条件为真时，计数器才会在每个时钟周期上升沿开始增长
        count := count + 1
        when(valid) {
            count := 0
        }
    }
    //重新开始计数
    def clear = {
        count := 0
        valid := False
    }

    def clear(cen : Bool): Unit = {
        count := 0
        valid := False
    }
    
    def last_valid = en && valid
}