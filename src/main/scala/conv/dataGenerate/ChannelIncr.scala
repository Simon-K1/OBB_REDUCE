package conv.dataGenerate

import spinal.core._
import spinal.lib._
import conv._
import conv.dataGenerate._
import conv.compute._
import config.Config._

class ChannelIncr(convConfig: ConvConfig) extends Component {

    val sDataWidth = if (enFocus) {
        4 * convConfig.DATA_WIDTH * (if (imageType.dataType == imageType.rgb) 3 else if (imageType.dataType == imageType.gray) 1 else {
            assert(false, "imageType不正确");
            0
        })
    } else {
        if (imageType.dataType == imageType.rgb) {
            4 * convConfig.DATA_WIDTH
        } else if (imageType.dataType == imageType.gray) {
            1 * convConfig.DATA_WIDTH           //8 bits
        } else {
            assert(false, "imageType不正确");
            0
        }
    }

    val io = new Bundle {
        val sData = slave Stream (UInt(sDataWidth bits))        // 8 bits
        val mData = master Stream (UInt(convConfig.FEATURE_S_DATA_WIDTH bits))      // FEATURE_S_DATA_WIDTH = DATA_WIDTH * COMPUTE_CHANNEL_IN_NUM * PICTURE_NUM
        //输入：数据位宽，输出：数据位宽 * 通道数 * 图片数
    }
    noIoPrefix()
//    StreamWidthAdapter(io.sData,io.mData,padding=true)
    io.mData.ready <> io.sData.ready
    io.mData.valid <> io.sData.valid
    io.mData.payload := io.sData.payload.resized            // channelIncr !!
}

object ChannelIncr extends App {
    SpinalVerilog(new ChannelIncr(ConvConfig(8, 8, 8, 12, 8192, 512, 416, 2048, 1)))
}
