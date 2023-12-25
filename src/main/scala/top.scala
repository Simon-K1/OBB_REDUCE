import config.Config
import conv.compute._
import shape._
import spinal.core.SpinalConfig
import misc.TotalTcl
import java.io.File

object top extends App {
    SpinalConfig(removePruned = true, targetDirectory = Config.filePath).generateVerilog(new Conv(ConvConfig(8, 16, 16, 12, 8192, 256, 640, 8192, 1)))
    TotalTcl(Config.filePath + File.separator + "tcl", Config.filePath).genTotalTcl
}
