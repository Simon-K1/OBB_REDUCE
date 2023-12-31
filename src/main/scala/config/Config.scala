package config

import spinal.core._

object Config {
    val filePath = "./verilog"
    val DDRSize = 4 GiB
    val registerAddrSize = 1 MiB
    val burstSize = 32

    val dsp2x = false

    case class ImageType() {
        val rgb = "RGB"
        val gray = "GRAY"
        val dataType = gray
    }

    val imageType = ImageType()

    val enFocus = false

    val useXilinxDma = true

    val useUram = true

    val DEBUG_MODULE = true

    val MAX_FANOUT = true
    def addDebug[a <: Data](temp: a) = if (DEBUG_MODULE) temp.addAttribute("mark_debug", "true")

    def addMaxfanout[a <: Data](temp: a) = if(MAX_FANOUT)  temp.addAttribute("MAX_FANOUT", "16")
}
