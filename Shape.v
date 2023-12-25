// Generator : SpinalHDL v1.7.3    git head : ed8004c489ee8a38c2cab309d0447b543fe9d5b8
// Component : Shape

`timescale 1ns/1ps

module Shape (
  input               sData_0_valid,
  output              sData_0_ready,
  input      [63:0]   sData_0_payload,
  input               sData_1_valid,
  output              sData_1_ready,
  input      [63:0]   sData_1_payload,
  output              mData_valid,
  input               mData_ready,
  output     [63:0]   mData_payload,
  output              dmaReadValid_0,
  output              dmaReadValid_1,
  output              dmaWriteValid,
  input      [3:0]    control,
  output     [3:0]    state,
  input               introut,
  input      [31:0]   instruction_0,
  input      [31:0]   instruction_1,
  input      [31:0]   instruction_2,
  input      [31:0]   instruction_3,
  input      [31:0]   instruction_4,
  input      [31:0]   instruction_5,
  output              last,
  input               clk,
  input               reset
);

  wire       [8:0]    concat_1_dataPort_rowNumIn;
  wire       [8:0]    concat_1_dataPort_colNumIn;
  wire       [9:0]    concat_1_dataPort_channelIn;
  wire       [31:0]   concat_1_zero;
  wire       [31:0]   concat_1_zero1;
  wire       [31:0]   concat_1_scale;
  wire       [31:0]   concat_1_scale1;
  wire       [9:0]    concat_1_channelIn1;
  wire       [8:0]    add_1_dataPort_rowNumIn;
  wire       [8:0]    add_1_dataPort_colNumIn;
  wire       [9:0]    add_1_dataPort_channelIn;
  wire       [31:0]   add_1_zero;
  wire       [31:0]   add_1_zero1;
  wire       [31:0]   add_1_scale;
  wire       [31:0]   add_1_scale1;
  wire       [9:0]    add_1_channelIn1;
  wire       [8:0]    maxPooling_1_rowNumIn;
  wire       [8:0]    maxPooling_1_colNumIn;
  wire       [9:0]    maxPooling_1_channelIn;
  wire       [8:0]    split_1_rowNumIn;
  wire       [8:0]    split_1_colNumIn;
  wire       [9:0]    split_1_channelIn;
  wire       [8:0]    upSampling_1_rowNumIn;
  wire       [8:0]    upSampling_1_colNumIn;
  wire       [9:0]    upSampling_1_channelIn;
  wire       [7:0]    mulDataCount1_A;
  wire       [9:0]    mulDataCount1_B;
  wire       [3:0]    shapeState_1_state;
  wire                shapeState_1_start_0;
  wire                shapeState_1_start_1;
  wire                shapeState_1_start_2;
  wire                shapeState_1_start_3;
  wire                shapeState_1_start_4;
  wire                shapeState_1_dmaReadValid_0;
  wire                shapeState_1_dmaReadValid_1;
  wire                shapeState_1_dmaWriteValid;
  wire                concat_1_dataPort_sData_ready;
  wire                concat_1_dataPort_mData_valid;
  wire       [63:0]   concat_1_dataPort_mData_payload;
  wire                concat_1_sData1_ready;
  wire                add_1_dataPort_sData_ready;
  wire                add_1_dataPort_mData_valid;
  wire       [63:0]   add_1_dataPort_mData_payload;
  wire                add_1_sData1_ready;
  wire                maxPooling_1_sData_ready;
  wire                maxPooling_1_mData_valid;
  wire       [63:0]   maxPooling_1_mData_payload;
  wire                split_1_sData_ready;
  wire                split_1_mData_valid;
  wire       [63:0]   split_1_mData_payload;
  wire                upSampling_1_sData_ready;
  wire                upSampling_1_mData_valid;
  wire       [63:0]   upSampling_1_mData_payload;
  wire       [17:0]   mulDataCount1_P;
  wire                fifo_push_ready;
  wire                fifo_pop_valid;
  wire       [63:0]   fifo_pop_payload;
  wire       [12:0]   fifo_occupancy;
  wire       [12:0]   fifo_availability;
  wire                waStreamDemux_2_io_input_ready;
  wire                waStreamDemux_2_io_outputs_0_valid;
  wire       [63:0]   waStreamDemux_2_io_outputs_0_payload;
  wire                waStreamDemux_2_io_outputs_1_valid;
  wire       [63:0]   waStreamDemux_2_io_outputs_1_payload;
  wire                waStreamDemux_2_io_outputs_2_valid;
  wire       [63:0]   waStreamDemux_2_io_outputs_2_payload;
  wire                waStreamDemux_2_io_outputs_3_valid;
  wire       [63:0]   waStreamDemux_2_io_outputs_3_payload;
  wire                waStreamDemux_2_io_outputs_4_valid;
  wire       [63:0]   waStreamDemux_2_io_outputs_4_payload;
  wire                waStreamDemux_3_io_input_ready;
  wire                waStreamDemux_3_io_outputs_0_valid;
  wire       [63:0]   waStreamDemux_3_io_outputs_0_payload;
  wire                waStreamDemux_3_io_outputs_1_valid;
  wire       [63:0]   waStreamDemux_3_io_outputs_1_payload;
  wire                waStreamDemux_3_io_outputs_2_valid;
  wire       [63:0]   waStreamDemux_3_io_outputs_2_payload;
  wire                waStreamDemux_3_io_outputs_3_valid;
  wire       [63:0]   waStreamDemux_3_io_outputs_3_payload;
  wire                waStreamDemux_3_io_outputs_4_valid;
  wire       [63:0]   waStreamDemux_3_io_outputs_4_payload;
  wire                waStreamMux_1_io_inputs_0_ready;
  wire                waStreamMux_1_io_inputs_1_ready;
  wire                waStreamMux_1_io_inputs_2_ready;
  wire                waStreamMux_1_io_inputs_3_ready;
  wire                waStreamMux_1_io_inputs_4_ready;
  wire                waStreamMux_1_io_output_valid;
  wire       [63:0]   waStreamMux_1_io_output_payload;
  wire       [9:0]    _zz_dataPort_colNumIn;
  wire       [10:0]   _zz_dataPort_rowNumIn;
  wire       [10:0]   _zz_dataPort_channelIn;
  wire       [9:0]    _zz_dataPort_colNumIn_1;
  wire       [10:0]   _zz_dataPort_rowNumIn_1;
  wire       [10:0]   _zz_dataPort_channelIn_1;
  wire       [9:0]    _zz_colNumIn;
  wire       [10:0]   _zz_rowNumIn;
  wire       [10:0]   _zz_channelIn;
  wire       [9:0]    _zz_colNumIn_1;
  wire       [10:0]   _zz_rowNumIn_1;
  wire       [10:0]   _zz_channelIn_1;
  wire       [9:0]    _zz_colNumIn_2;
  wire       [10:0]   _zz_rowNumIn_2;
  wire       [10:0]   _zz_channelIn_2;
  wire       [7:0]    _zz_A;
  wire       [7:0]    _zz_channelTimes0;
  wire       [7:0]    _zz_channelTimes0_1;
  wire       [6:0]    _zz_channelTimes1;
  wire       [6:0]    _zz_channelTimes1_1;
  wire       [7:0]    _zz_channelOutTimes_5;
  wire       [8:0]    _zz_colOutTimes_5;
  wire       [9:0]    _zz_rowOutTimes_5;
  wire       [7:0]    _zz_channelOutTimes_6;
  wire       [10:0]   _zz_colOutTimes_6;
  wire       [11:0]   _zz_rowOutTimes_6;
  wire       [7:0]    _zz_channelOutTimes_7;
  wire       [6:0]    _zz_channelOutTimes_8;
  wire       [10:0]   _zz_when_WaCounter_l12;
  wire       [9:0]    _zz_when_WaCounter_l12_1;
  wire       [10:0]   _zz_when_WaCounter_l12_2;
  wire       [17:0]   _zz_when_Shape_l160;
  reg                 shapeState_1_start_0_regNext;
  reg                 shapeState_1_start_1_regNext;
  reg                 shapeState_1_start_2_regNext;
  reg                 shapeState_1_start_3_regNext;
  reg                 shapeState_1_start_4_regNext;
  wire                start;
  wire       [191:0]  instruction;
  reg        [191:0]  instructionReg;
  reg                 fifoReady;
  reg                 shapeState_1_start_3_delay_1;
  reg                 shapeState_1_start_3_delay_2;
  reg                 shapeState_1_start_3_delay_3;
  reg                 shapeState_1_start_3_delay_4;
  reg                 shapeState_1_start_3_delay_5;
  reg                 shapeState_1_start_3_delay_6;
  reg                 shapeState_1_start_3_delay_7;
  reg                 shapeState_1_start_3_delay_8;
  reg                 shapeState_1_start_4_delay_1;
  reg                 shapeState_1_start_4_delay_2;
  reg                 shapeState_1_start_4_delay_3;
  reg                 shapeState_1_start_4_delay_4;
  reg                 shapeState_1_start_4_delay_5;
  reg                 shapeState_1_start_4_delay_6;
  reg                 shapeState_1_start_4_delay_7;
  reg                 shapeState_1_start_4_delay_8;
  reg                 shapeState_1_start_0_delay_1;
  reg                 shapeState_1_start_0_delay_2;
  reg                 shapeState_1_start_0_delay_3;
  reg                 shapeState_1_start_0_delay_4;
  reg                 shapeState_1_start_0_delay_5;
  reg                 shapeState_1_start_0_delay_6;
  reg                 shapeState_1_start_0_delay_7;
  reg                 shapeState_1_start_0_delay_8;
  reg                 shapeState_1_start_1_delay_1;
  reg                 shapeState_1_start_1_delay_2;
  reg                 shapeState_1_start_1_delay_3;
  reg                 shapeState_1_start_1_delay_4;
  reg                 shapeState_1_start_1_delay_5;
  reg                 shapeState_1_start_1_delay_6;
  reg                 shapeState_1_start_1_delay_7;
  reg                 shapeState_1_start_1_delay_8;
  reg                 shapeState_1_start_2_delay_1;
  reg                 shapeState_1_start_2_delay_2;
  reg                 shapeState_1_start_2_delay_3;
  reg                 shapeState_1_start_2_delay_4;
  reg                 shapeState_1_start_2_delay_5;
  reg                 shapeState_1_start_2_delay_6;
  reg                 shapeState_1_start_2_delay_7;
  reg                 shapeState_1_start_2_delay_8;
  wire       [17:0]   dataCount1;
  reg        [17:0]   dataCount2;
  reg        [17:0]   dataCount;
  reg        [10:0]   channelOutTimes;
  reg        [9:0]    colOutTimes;
  reg        [10:0]   rowOutTimes;
  wire       [10:0]   channelTimes0;
  wire       [10:0]   channelTimes1;
  reg        [17:0]   dataCount2_regNext;
  reg        [9:0]    _zz_colOutTimes;
  reg        [10:0]   _zz_rowOutTimes;
  reg        [10:0]   _zz_channelOutTimes;
  reg        [17:0]   dataCount2_regNext_1;
  reg        [9:0]    _zz_colOutTimes_1;
  reg        [10:0]   _zz_rowOutTimes_1;
  reg        [7:0]    _zz_channelOutTimes_1;
  reg        [17:0]   _zz_dataCount;
  reg        [8:0]    _zz_colOutTimes_2;
  reg        [9:0]    _zz_rowOutTimes_2;
  reg        [7:0]    _zz_channelOutTimes_2;
  reg        [17:0]   dataCount2_regNext_2;
  reg        [10:0]   _zz_colOutTimes_3;
  reg        [11:0]   _zz_rowOutTimes_3;
  reg        [7:0]    _zz_channelOutTimes_3;
  reg        [17:0]   _zz_dataCount_1;
  reg        [9:0]    _zz_colOutTimes_4;
  reg        [10:0]   _zz_rowOutTimes_4;
  reg        [6:0]    _zz_channelOutTimes_4;
  wire                mData_fire;
  reg        [10:0]   channelOutCnt_count;
  reg                 channelOutCnt_valid;
  wire                when_WaCounter_l12;
  wire                mData_fire_1;
  wire                when_WaCounter_l17;
  reg        [9:0]    colOutCnt_count;
  reg                 colOutCnt_valid;
  wire                when_WaCounter_l12_1;
  wire                mData_fire_2;
  wire                when_WaCounter_l17_1;
  reg        [10:0]   rowOutCnt_count;
  reg                 rowOutCnt_valid;
  wire                when_WaCounter_l12_2;
  wire                when_Shape_l160;
  wire                s_0_valid;
  wire                s_0_ready;
  wire       [63:0]   s_0_payload;
  wire                s_1_valid;
  wire                s_1_ready;
  wire       [63:0]   s_1_payload;
  wire                s_2_valid;
  wire                s_2_ready;
  wire       [63:0]   s_2_payload;

  assign _zz_dataPort_colNumIn = instructionReg[20 : 11];
  assign _zz_dataPort_rowNumIn = instructionReg[10 : 0];
  assign _zz_dataPort_channelIn = instructionReg[31 : 21];
  assign _zz_dataPort_colNumIn_1 = instructionReg[20 : 11];
  assign _zz_dataPort_rowNumIn_1 = instructionReg[10 : 0];
  assign _zz_dataPort_channelIn_1 = instructionReg[31 : 21];
  assign _zz_colNumIn = instructionReg[20 : 11];
  assign _zz_rowNumIn = instructionReg[10 : 0];
  assign _zz_channelIn = instructionReg[31 : 21];
  assign _zz_colNumIn_1 = instructionReg[20 : 11];
  assign _zz_rowNumIn_1 = instructionReg[10 : 0];
  assign _zz_channelIn_1 = instructionReg[31 : 21];
  assign _zz_colNumIn_2 = instructionReg[20 : 11];
  assign _zz_rowNumIn_2 = instructionReg[10 : 0];
  assign _zz_channelIn_2 = instructionReg[31 : 21];
  assign _zz_A = (instructionReg[31 : 21] >>> 3);
  assign _zz_channelTimes0 = _zz_channelTimes0_1;
  assign _zz_channelTimes0_1 = (instructionReg[31 : 21] >>> 3);
  assign _zz_channelTimes1 = _zz_channelTimes1_1;
  assign _zz_channelTimes1_1 = (instructionReg[41 : 32] >>> 3);
  assign _zz_channelOutTimes_5 = _zz_channelOutTimes_1;
  assign _zz_colOutTimes_5 = _zz_colOutTimes_2;
  assign _zz_rowOutTimes_5 = _zz_rowOutTimes_2;
  assign _zz_channelOutTimes_6 = _zz_channelOutTimes_2;
  assign _zz_colOutTimes_6 = _zz_colOutTimes_3;
  assign _zz_rowOutTimes_6 = _zz_rowOutTimes_3;
  assign _zz_channelOutTimes_7 = _zz_channelOutTimes_3;
  assign _zz_channelOutTimes_8 = _zz_channelOutTimes_4;
  assign _zz_when_WaCounter_l12 = (channelOutTimes - 11'h001);
  assign _zz_when_WaCounter_l12_1 = (colOutTimes - 10'h001);
  assign _zz_when_WaCounter_l12_2 = (rowOutTimes - 11'h001);
  assign _zz_when_Shape_l160 = {5'd0, fifo_availability};
  ShapeState shapeState_1 (
    .control        (control[3:0]               ), //i
    .complete       (introut                    ), //i
    .state          (shapeState_1_state[3:0]    ), //o
    .start_0        (shapeState_1_start_0       ), //o
    .start_1        (shapeState_1_start_1       ), //o
    .start_2        (shapeState_1_start_2       ), //o
    .start_3        (shapeState_1_start_3       ), //o
    .start_4        (shapeState_1_start_4       ), //o
    .dmaReadValid_0 (shapeState_1_dmaReadValid_0), //o
    .dmaReadValid_1 (shapeState_1_dmaReadValid_1), //o
    .dmaWriteValid  (shapeState_1_dmaWriteValid ), //o
    .clk            (clk                        ), //i
    .reset          (reset                      )  //i
  );
  Concat concat_1 (
    .dataPort_start         (shapeState_1_start_3_delay_8              ), //i
    .dataPort_fifoReady     (fifoReady                                 ), //i
    .dataPort_sData_valid   (waStreamDemux_2_io_outputs_0_valid        ), //i
    .dataPort_sData_ready   (concat_1_dataPort_sData_ready             ), //o
    .dataPort_sData_payload (waStreamDemux_2_io_outputs_0_payload[63:0]), //i
    .dataPort_mData_valid   (concat_1_dataPort_mData_valid             ), //o
    .dataPort_mData_ready   (waStreamMux_1_io_inputs_0_ready           ), //i
    .dataPort_mData_payload (concat_1_dataPort_mData_payload[63:0]     ), //o
    .dataPort_rowNumIn      (concat_1_dataPort_rowNumIn[8:0]           ), //i
    .dataPort_colNumIn      (concat_1_dataPort_colNumIn[8:0]           ), //i
    .dataPort_channelIn     (concat_1_dataPort_channelIn[9:0]          ), //i
    .zero                   (concat_1_zero[31:0]                       ), //i
    .zero1                  (concat_1_zero1[31:0]                      ), //i
    .scale                  (concat_1_scale[31:0]                      ), //i
    .scale1                 (concat_1_scale1[31:0]                     ), //i
    .sData1_valid           (waStreamDemux_3_io_outputs_0_valid        ), //i
    .sData1_ready           (concat_1_sData1_ready                     ), //o
    .sData1_payload         (waStreamDemux_3_io_outputs_0_payload[63:0]), //i
    .channelIn1             (concat_1_channelIn1[9:0]                  ), //i
    .clk                    (clk                                       ), //i
    .reset                  (reset                                     )  //i
  );
  Add add_1 (
    .dataPort_start         (shapeState_1_start_4_delay_8              ), //i
    .dataPort_fifoReady     (fifoReady                                 ), //i
    .dataPort_sData_valid   (waStreamDemux_2_io_outputs_1_valid        ), //i
    .dataPort_sData_ready   (add_1_dataPort_sData_ready                ), //o
    .dataPort_sData_payload (waStreamDemux_2_io_outputs_1_payload[63:0]), //i
    .dataPort_mData_valid   (add_1_dataPort_mData_valid                ), //o
    .dataPort_mData_ready   (waStreamMux_1_io_inputs_1_ready           ), //i
    .dataPort_mData_payload (add_1_dataPort_mData_payload[63:0]        ), //o
    .dataPort_rowNumIn      (add_1_dataPort_rowNumIn[8:0]              ), //i
    .dataPort_colNumIn      (add_1_dataPort_colNumIn[8:0]              ), //i
    .dataPort_channelIn     (add_1_dataPort_channelIn[9:0]             ), //i
    .zero                   (add_1_zero[31:0]                          ), //i
    .zero1                  (add_1_zero1[31:0]                         ), //i
    .scale                  (add_1_scale[31:0]                         ), //i
    .scale1                 (add_1_scale1[31:0]                        ), //i
    .sData1_valid           (waStreamDemux_3_io_outputs_1_valid        ), //i
    .sData1_ready           (add_1_sData1_ready                        ), //o
    .sData1_payload         (waStreamDemux_3_io_outputs_1_payload[63:0]), //i
    .channelIn1             (add_1_channelIn1[9:0]                     ), //i
    .clk                    (clk                                       ), //i
    .reset                  (reset                                     )  //i
  );
  MaxPooling maxPooling_1 (
    .start         (shapeState_1_start_0_delay_8              ), //i
    .fifoReady     (fifoReady                                 ), //i
    .sData_valid   (waStreamDemux_2_io_outputs_2_valid        ), //i
    .sData_ready   (maxPooling_1_sData_ready                  ), //o
    .sData_payload (waStreamDemux_2_io_outputs_2_payload[63:0]), //i
    .mData_valid   (maxPooling_1_mData_valid                  ), //o
    .mData_ready   (waStreamMux_1_io_inputs_2_ready           ), //i
    .mData_payload (maxPooling_1_mData_payload[63:0]          ), //o
    .rowNumIn      (maxPooling_1_rowNumIn[8:0]                ), //i
    .colNumIn      (maxPooling_1_colNumIn[8:0]                ), //i
    .channelIn     (maxPooling_1_channelIn[9:0]               ), //i
    .clk           (clk                                       ), //i
    .reset         (reset                                     )  //i
  );
  Split split_1 (
    .start         (shapeState_1_start_1_delay_8              ), //i
    .fifoReady     (fifoReady                                 ), //i
    .sData_valid   (waStreamDemux_2_io_outputs_4_valid        ), //i
    .sData_ready   (split_1_sData_ready                       ), //o
    .sData_payload (waStreamDemux_2_io_outputs_4_payload[63:0]), //i
    .mData_valid   (split_1_mData_valid                       ), //o
    .mData_ready   (waStreamMux_1_io_inputs_4_ready           ), //i
    .mData_payload (split_1_mData_payload[63:0]               ), //o
    .rowNumIn      (split_1_rowNumIn[8:0]                     ), //i
    .colNumIn      (split_1_colNumIn[8:0]                     ), //i
    .channelIn     (split_1_channelIn[9:0]                    ), //i
    .clk           (clk                                       ), //i
    .reset         (reset                                     )  //i
  );
  UpSampling upSampling_1 (
    .start         (shapeState_1_start_2_delay_8              ), //i
    .fifoReady     (fifoReady                                 ), //i
    .sData_valid   (waStreamDemux_2_io_outputs_3_valid        ), //i
    .sData_ready   (upSampling_1_sData_ready                  ), //o
    .sData_payload (waStreamDemux_2_io_outputs_3_payload[63:0]), //i
    .mData_valid   (upSampling_1_mData_valid                  ), //o
    .mData_ready   (waStreamMux_1_io_inputs_3_ready           ), //i
    .mData_payload (upSampling_1_mData_payload[63:0]          ), //o
    .rowNumIn      (upSampling_1_rowNumIn[8:0]                ), //i
    .colNumIn      (upSampling_1_colNumIn[8:0]                ), //i
    .channelIn     (upSampling_1_channelIn[9:0]               ), //i
    .clk           (clk                                       ), //i
    .reset         (reset                                     )  //i
  );
  shapeCount1 mulDataCount1 (
    .A   (mulDataCount1_A[7:0] ), //i
    .B   (mulDataCount1_B[9:0] ), //i
    .P   (mulDataCount1_P[17:0]), //o
    .CLK (clk                  )  //i
  );
  WaStreamFifoPipe_2 fifo (
    .push_valid   (waStreamMux_1_io_output_valid        ), //i
    .push_ready   (fifo_push_ready                      ), //o
    .push_payload (waStreamMux_1_io_output_payload[63:0]), //i
    .pop_valid    (fifo_pop_valid                       ), //o
    .pop_ready    (mData_ready                          ), //i
    .pop_payload  (fifo_pop_payload[63:0]               ), //o
    .flush        (1'b0                                 ), //i
    .occupancy    (fifo_occupancy[12:0]                 ), //o
    .availability (fifo_availability[12:0]              ), //o
    .clk          (clk                                  ), //i
    .reset        (reset                                )  //i
  );
  WaStreamDemux waStreamDemux_2 (
    .io_select            (shapeState_1_state[3:0]                   ), //i
    .io_input_valid       (sData_0_valid                             ), //i
    .io_input_ready       (waStreamDemux_2_io_input_ready            ), //o
    .io_input_payload     (sData_0_payload[63:0]                     ), //i
    .io_outputs_0_valid   (waStreamDemux_2_io_outputs_0_valid        ), //o
    .io_outputs_0_ready   (concat_1_dataPort_sData_ready             ), //i
    .io_outputs_0_payload (waStreamDemux_2_io_outputs_0_payload[63:0]), //o
    .io_outputs_1_valid   (waStreamDemux_2_io_outputs_1_valid        ), //o
    .io_outputs_1_ready   (add_1_dataPort_sData_ready                ), //i
    .io_outputs_1_payload (waStreamDemux_2_io_outputs_1_payload[63:0]), //o
    .io_outputs_2_valid   (waStreamDemux_2_io_outputs_2_valid        ), //o
    .io_outputs_2_ready   (maxPooling_1_sData_ready                  ), //i
    .io_outputs_2_payload (waStreamDemux_2_io_outputs_2_payload[63:0]), //o
    .io_outputs_3_valid   (waStreamDemux_2_io_outputs_3_valid        ), //o
    .io_outputs_3_ready   (upSampling_1_sData_ready                  ), //i
    .io_outputs_3_payload (waStreamDemux_2_io_outputs_3_payload[63:0]), //o
    .io_outputs_4_valid   (waStreamDemux_2_io_outputs_4_valid        ), //o
    .io_outputs_4_ready   (split_1_sData_ready                       ), //i
    .io_outputs_4_payload (waStreamDemux_2_io_outputs_4_payload[63:0])  //o
  );
  WaStreamDemux waStreamDemux_3 (
    .io_select            (shapeState_1_state[3:0]                   ), //i
    .io_input_valid       (sData_1_valid                             ), //i
    .io_input_ready       (waStreamDemux_3_io_input_ready            ), //o
    .io_input_payload     (sData_1_payload[63:0]                     ), //i
    .io_outputs_0_valid   (waStreamDemux_3_io_outputs_0_valid        ), //o
    .io_outputs_0_ready   (concat_1_sData1_ready                     ), //i
    .io_outputs_0_payload (waStreamDemux_3_io_outputs_0_payload[63:0]), //o
    .io_outputs_1_valid   (waStreamDemux_3_io_outputs_1_valid        ), //o
    .io_outputs_1_ready   (add_1_sData1_ready                        ), //i
    .io_outputs_1_payload (waStreamDemux_3_io_outputs_1_payload[63:0]), //o
    .io_outputs_2_valid   (waStreamDemux_3_io_outputs_2_valid        ), //o
    .io_outputs_2_ready   (s_0_ready                                 ), //i
    .io_outputs_2_payload (waStreamDemux_3_io_outputs_2_payload[63:0]), //o
    .io_outputs_3_valid   (waStreamDemux_3_io_outputs_3_valid        ), //o
    .io_outputs_3_ready   (s_1_ready                                 ), //i
    .io_outputs_3_payload (waStreamDemux_3_io_outputs_3_payload[63:0]), //o
    .io_outputs_4_valid   (waStreamDemux_3_io_outputs_4_valid        ), //o
    .io_outputs_4_ready   (s_2_ready                                 ), //i
    .io_outputs_4_payload (waStreamDemux_3_io_outputs_4_payload[63:0])  //o
  );
  WaStreamMux waStreamMux_1 (
    .io_select           (shapeState_1_state[3:0]              ), //i
    .io_inputs_0_valid   (concat_1_dataPort_mData_valid        ), //i
    .io_inputs_0_ready   (waStreamMux_1_io_inputs_0_ready      ), //o
    .io_inputs_0_payload (concat_1_dataPort_mData_payload[63:0]), //i
    .io_inputs_1_valid   (add_1_dataPort_mData_valid           ), //i
    .io_inputs_1_ready   (waStreamMux_1_io_inputs_1_ready      ), //o
    .io_inputs_1_payload (add_1_dataPort_mData_payload[63:0]   ), //i
    .io_inputs_2_valid   (maxPooling_1_mData_valid             ), //i
    .io_inputs_2_ready   (waStreamMux_1_io_inputs_2_ready      ), //o
    .io_inputs_2_payload (maxPooling_1_mData_payload[63:0]     ), //i
    .io_inputs_3_valid   (upSampling_1_mData_valid             ), //i
    .io_inputs_3_ready   (waStreamMux_1_io_inputs_3_ready      ), //o
    .io_inputs_3_payload (upSampling_1_mData_payload[63:0]     ), //i
    .io_inputs_4_valid   (split_1_mData_valid                  ), //i
    .io_inputs_4_ready   (waStreamMux_1_io_inputs_4_ready      ), //o
    .io_inputs_4_payload (split_1_mData_payload[63:0]          ), //i
    .io_output_valid     (waStreamMux_1_io_output_valid        ), //o
    .io_output_ready     (fifo_push_ready                      ), //i
    .io_output_payload   (waStreamMux_1_io_output_payload[63:0])  //o
  );
  assign dmaReadValid_0 = shapeState_1_dmaReadValid_0;
  assign dmaReadValid_1 = shapeState_1_dmaReadValid_1;
  assign dmaWriteValid = shapeState_1_dmaWriteValid;
  assign state = shapeState_1_state;
  assign start = (((((shapeState_1_start_0 && (! shapeState_1_start_0_regNext)) || (shapeState_1_start_1 && (! shapeState_1_start_1_regNext))) || (shapeState_1_start_2 && (! shapeState_1_start_2_regNext))) || (shapeState_1_start_3 && (! shapeState_1_start_3_regNext))) || (shapeState_1_start_4 && (! shapeState_1_start_4_regNext)));
  assign instruction = {instruction_5,{instruction_4,{instruction_3,{instruction_2,{instruction_1,instruction_0}}}}};
  assign concat_1_dataPort_colNumIn = _zz_dataPort_colNumIn[8:0];
  assign concat_1_dataPort_rowNumIn = _zz_dataPort_rowNumIn[8:0];
  assign concat_1_dataPort_channelIn = _zz_dataPort_channelIn[9:0];
  assign concat_1_channelIn1 = instructionReg[41 : 32];
  assign concat_1_zero = instructionReg[159 : 128];
  assign concat_1_scale = instructionReg[95 : 64];
  assign concat_1_zero1 = instructionReg[191 : 160];
  assign concat_1_scale1 = instructionReg[127 : 96];
  assign add_1_dataPort_colNumIn = _zz_dataPort_colNumIn_1[8:0];
  assign add_1_dataPort_rowNumIn = _zz_dataPort_rowNumIn_1[8:0];
  assign add_1_dataPort_channelIn = _zz_dataPort_channelIn_1[9:0];
  assign add_1_channelIn1 = instructionReg[41 : 32];
  assign add_1_zero = instructionReg[159 : 128];
  assign add_1_scale = instructionReg[95 : 64];
  assign add_1_zero1 = instructionReg[191 : 160];
  assign add_1_scale1 = instructionReg[127 : 96];
  assign maxPooling_1_colNumIn = _zz_colNumIn[8:0];
  assign maxPooling_1_rowNumIn = _zz_rowNumIn[8:0];
  assign maxPooling_1_channelIn = _zz_channelIn[9:0];
  assign split_1_colNumIn = _zz_colNumIn_1[8:0];
  assign split_1_rowNumIn = _zz_rowNumIn_1[8:0];
  assign split_1_channelIn = _zz_channelIn_1[9:0];
  assign upSampling_1_colNumIn = _zz_colNumIn_2[8:0];
  assign upSampling_1_rowNumIn = _zz_rowNumIn_2[8:0];
  assign upSampling_1_channelIn = _zz_channelIn_2[9:0];
  assign mulDataCount1_A = _zz_A;
  assign mulDataCount1_B = instructionReg[20 : 11];
  assign dataCount1 = mulDataCount1_P;
  assign mData_valid = fifo_pop_valid;
  assign mData_payload = fifo_pop_payload;
  assign channelTimes0 = {3'd0, _zz_channelTimes0};
  assign channelTimes1 = {4'd0, _zz_channelTimes1};
  assign mData_fire = (mData_valid && mData_ready);
  assign when_WaCounter_l12 = (channelOutCnt_count == _zz_when_WaCounter_l12);
  always @(*) begin
    if(when_WaCounter_l12) begin
      channelOutCnt_valid = 1'b1;
    end else begin
      channelOutCnt_valid = 1'b0;
    end
  end

  assign mData_fire_1 = (mData_valid && mData_ready);
  assign when_WaCounter_l17 = (channelOutCnt_valid && mData_fire_1);
  assign when_WaCounter_l12_1 = (colOutCnt_count == _zz_when_WaCounter_l12_1);
  always @(*) begin
    if(when_WaCounter_l12_1) begin
      colOutCnt_valid = 1'b1;
    end else begin
      colOutCnt_valid = 1'b0;
    end
  end

  assign mData_fire_2 = (mData_valid && mData_ready);
  assign when_WaCounter_l17_1 = ((channelOutCnt_valid && colOutCnt_valid) && mData_fire_2);
  assign when_WaCounter_l12_2 = (rowOutCnt_count == _zz_when_WaCounter_l12_2);
  always @(*) begin
    if(when_WaCounter_l12_2) begin
      rowOutCnt_valid = 1'b1;
    end else begin
      rowOutCnt_valid = 1'b0;
    end
  end

  assign last = ((channelOutCnt_valid && colOutCnt_valid) && rowOutCnt_valid);
  assign when_Shape_l160 = (dataCount < _zz_when_Shape_l160);
  assign s_0_ready = 1'b0;
  assign s_1_ready = 1'b0;
  assign s_2_ready = 1'b0;
  assign sData_0_ready = waStreamDemux_2_io_input_ready;
  assign sData_1_ready = waStreamDemux_3_io_input_ready;
  assign s_0_valid = waStreamDemux_3_io_outputs_2_valid;
  assign s_0_payload = waStreamDemux_3_io_outputs_2_payload;
  assign s_1_valid = waStreamDemux_3_io_outputs_3_valid;
  assign s_1_payload = waStreamDemux_3_io_outputs_3_payload;
  assign s_2_valid = waStreamDemux_3_io_outputs_4_valid;
  assign s_2_payload = waStreamDemux_3_io_outputs_4_payload;
  always @(posedge clk) begin
    shapeState_1_start_0_regNext <= shapeState_1_start_0;
    shapeState_1_start_1_regNext <= shapeState_1_start_1;
    shapeState_1_start_2_regNext <= shapeState_1_start_2;
    shapeState_1_start_3_regNext <= shapeState_1_start_3;
    shapeState_1_start_4_regNext <= shapeState_1_start_4;
    shapeState_1_start_3_delay_1 <= shapeState_1_start_3;
    shapeState_1_start_3_delay_2 <= shapeState_1_start_3_delay_1;
    shapeState_1_start_3_delay_3 <= shapeState_1_start_3_delay_2;
    shapeState_1_start_3_delay_4 <= shapeState_1_start_3_delay_3;
    shapeState_1_start_3_delay_5 <= shapeState_1_start_3_delay_4;
    shapeState_1_start_3_delay_6 <= shapeState_1_start_3_delay_5;
    shapeState_1_start_3_delay_7 <= shapeState_1_start_3_delay_6;
    shapeState_1_start_3_delay_8 <= shapeState_1_start_3_delay_7;
    shapeState_1_start_4_delay_1 <= shapeState_1_start_4;
    shapeState_1_start_4_delay_2 <= shapeState_1_start_4_delay_1;
    shapeState_1_start_4_delay_3 <= shapeState_1_start_4_delay_2;
    shapeState_1_start_4_delay_4 <= shapeState_1_start_4_delay_3;
    shapeState_1_start_4_delay_5 <= shapeState_1_start_4_delay_4;
    shapeState_1_start_4_delay_6 <= shapeState_1_start_4_delay_5;
    shapeState_1_start_4_delay_7 <= shapeState_1_start_4_delay_6;
    shapeState_1_start_4_delay_8 <= shapeState_1_start_4_delay_7;
    shapeState_1_start_0_delay_1 <= shapeState_1_start_0;
    shapeState_1_start_0_delay_2 <= shapeState_1_start_0_delay_1;
    shapeState_1_start_0_delay_3 <= shapeState_1_start_0_delay_2;
    shapeState_1_start_0_delay_4 <= shapeState_1_start_0_delay_3;
    shapeState_1_start_0_delay_5 <= shapeState_1_start_0_delay_4;
    shapeState_1_start_0_delay_6 <= shapeState_1_start_0_delay_5;
    shapeState_1_start_0_delay_7 <= shapeState_1_start_0_delay_6;
    shapeState_1_start_0_delay_8 <= shapeState_1_start_0_delay_7;
    shapeState_1_start_1_delay_1 <= shapeState_1_start_1;
    shapeState_1_start_1_delay_2 <= shapeState_1_start_1_delay_1;
    shapeState_1_start_1_delay_3 <= shapeState_1_start_1_delay_2;
    shapeState_1_start_1_delay_4 <= shapeState_1_start_1_delay_3;
    shapeState_1_start_1_delay_5 <= shapeState_1_start_1_delay_4;
    shapeState_1_start_1_delay_6 <= shapeState_1_start_1_delay_5;
    shapeState_1_start_1_delay_7 <= shapeState_1_start_1_delay_6;
    shapeState_1_start_1_delay_8 <= shapeState_1_start_1_delay_7;
    shapeState_1_start_2_delay_1 <= shapeState_1_start_2;
    shapeState_1_start_2_delay_2 <= shapeState_1_start_2_delay_1;
    shapeState_1_start_2_delay_3 <= shapeState_1_start_2_delay_2;
    shapeState_1_start_2_delay_4 <= shapeState_1_start_2_delay_3;
    shapeState_1_start_2_delay_5 <= shapeState_1_start_2_delay_4;
    shapeState_1_start_2_delay_6 <= shapeState_1_start_2_delay_5;
    shapeState_1_start_2_delay_7 <= shapeState_1_start_2_delay_6;
    shapeState_1_start_2_delay_8 <= shapeState_1_start_2_delay_7;
    dataCount2 <= (dataCount1 <<< 1);
    case(shapeState_1_state)
      4'b0100 : begin
        dataCount <= dataCount2_regNext;
        colOutTimes <= _zz_colOutTimes;
        rowOutTimes <= _zz_rowOutTimes;
        channelOutTimes <= _zz_channelOutTimes;
      end
      4'b0101 : begin
        dataCount <= dataCount2_regNext_1;
        colOutTimes <= _zz_colOutTimes_1;
        rowOutTimes <= _zz_rowOutTimes_1;
        channelOutTimes <= {3'd0, _zz_channelOutTimes_5};
      end
      4'b0001 : begin
        dataCount <= _zz_dataCount;
        colOutTimes <= {1'd0, _zz_colOutTimes_5};
        rowOutTimes <= {1'd0, _zz_rowOutTimes_5};
        channelOutTimes <= {3'd0, _zz_channelOutTimes_6};
      end
      4'b0011 : begin
        dataCount <= dataCount2_regNext_2;
        colOutTimes <= _zz_colOutTimes_6[9:0];
        rowOutTimes <= _zz_rowOutTimes_6[10:0];
        channelOutTimes <= {3'd0, _zz_channelOutTimes_7};
      end
      4'b0010 : begin
        dataCount <= _zz_dataCount_1;
        colOutTimes <= _zz_colOutTimes_4;
        rowOutTimes <= _zz_rowOutTimes_4;
        channelOutTimes <= {4'd0, _zz_channelOutTimes_8};
      end
      default : begin
        dataCount <= 18'h0;
        colOutTimes <= colOutTimes;
        rowOutTimes <= rowOutTimes;
        channelOutTimes <= channelOutTimes;
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      instructionReg <= 192'h0;
      fifoReady <= 1'b0;
      channelOutCnt_count <= 11'h0;
      colOutCnt_count <= 10'h0;
      rowOutCnt_count <= 11'h0;
    end else begin
      if(start) begin
        instructionReg <= instruction;
      end
      if(mData_fire) begin
        channelOutCnt_count <= (channelOutCnt_count + 11'h001);
        if(channelOutCnt_valid) begin
          channelOutCnt_count <= 11'h0;
        end
      end
      if(when_WaCounter_l17) begin
        colOutCnt_count <= (colOutCnt_count + 10'h001);
        if(colOutCnt_valid) begin
          colOutCnt_count <= 10'h0;
        end
      end
      if(when_WaCounter_l17_1) begin
        rowOutCnt_count <= (rowOutCnt_count + 11'h001);
        if(rowOutCnt_valid) begin
          rowOutCnt_count <= 11'h0;
        end
      end
      if(when_Shape_l160) begin
        fifoReady <= 1'b1;
      end else begin
        fifoReady <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    dataCount2_regNext <= dataCount2;
    _zz_colOutTimes <= instructionReg[20 : 11];
    _zz_rowOutTimes <= instructionReg[10 : 0];
    _zz_channelOutTimes <= (channelTimes0 + channelTimes1);
  end

  always @(posedge clk) begin
    dataCount2_regNext_1 <= dataCount2;
    _zz_colOutTimes_1 <= instructionReg[20 : 11];
    _zz_rowOutTimes_1 <= instructionReg[10 : 0];
    _zz_channelOutTimes_1 <= (instructionReg[31 : 21] >>> 3);
  end

  always @(posedge clk) begin
    _zz_dataCount <= dataCount1;
    _zz_colOutTimes_2 <= (instructionReg[20 : 11] >>> 1);
    _zz_rowOutTimes_2 <= (instructionReg[10 : 0] >>> 1);
    _zz_channelOutTimes_2 <= (instructionReg[31 : 21] >>> 3);
  end

  always @(posedge clk) begin
    dataCount2_regNext_2 <= dataCount2;
    _zz_colOutTimes_3 <= ({1'd0,instructionReg[20 : 11]} <<< 1);
    _zz_rowOutTimes_3 <= ({1'd0,instructionReg[10 : 0]} <<< 1);
    _zz_channelOutTimes_3 <= (instructionReg[31 : 21] >>> 3);
  end

  always @(posedge clk) begin
    _zz_dataCount_1 <= dataCount1;
    _zz_colOutTimes_4 <= instructionReg[20 : 11];
    _zz_rowOutTimes_4 <= instructionReg[10 : 0];
    _zz_channelOutTimes_4 <= (instructionReg[31 : 21] >>> 4);
  end


endmodule

module WaStreamMux (
  input      [3:0]    io_select,
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [63:0]   io_inputs_0_payload,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [63:0]   io_inputs_1_payload,
  input               io_inputs_2_valid,
  output              io_inputs_2_ready,
  input      [63:0]   io_inputs_2_payload,
  input               io_inputs_3_valid,
  output              io_inputs_3_ready,
  input      [63:0]   io_inputs_3_payload,
  input               io_inputs_4_valid,
  output              io_inputs_4_ready,
  input      [63:0]   io_inputs_4_payload,
  output reg          io_output_valid,
  input               io_output_ready,
  output reg [63:0]   io_output_payload
);


  assign io_inputs_0_ready = ((4'b0100 == io_select) && io_output_ready);
  assign io_inputs_1_ready = ((4'b0101 == io_select) && io_output_ready);
  assign io_inputs_2_ready = ((4'b0001 == io_select) && io_output_ready);
  assign io_inputs_3_ready = ((4'b0011 == io_select) && io_output_ready);
  assign io_inputs_4_ready = ((4'b0010 == io_select) && io_output_ready);
  always @(*) begin
    case(io_select)
      4'b0100 : begin
        io_output_valid = io_inputs_0_valid;
      end
      4'b0101 : begin
        io_output_valid = io_inputs_1_valid;
      end
      4'b0001 : begin
        io_output_valid = io_inputs_2_valid;
      end
      4'b0011 : begin
        io_output_valid = io_inputs_3_valid;
      end
      4'b0010 : begin
        io_output_valid = io_inputs_4_valid;
      end
      default : begin
        io_output_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(io_select)
      4'b0100 : begin
        io_output_payload = io_inputs_0_payload;
      end
      4'b0101 : begin
        io_output_payload = io_inputs_1_payload;
      end
      4'b0001 : begin
        io_output_payload = io_inputs_2_payload;
      end
      4'b0011 : begin
        io_output_payload = io_inputs_3_payload;
      end
      4'b0010 : begin
        io_output_payload = io_inputs_4_payload;
      end
      default : begin
        io_output_payload = 64'h0;
      end
    endcase
  end


endmodule

//WaStreamDemux replaced by WaStreamDemux

module WaStreamDemux (
  input      [3:0]    io_select,
  input               io_input_valid,
  output reg          io_input_ready,
  input      [63:0]   io_input_payload,
  output reg          io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [63:0]   io_outputs_0_payload,
  output reg          io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [63:0]   io_outputs_1_payload,
  output reg          io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [63:0]   io_outputs_2_payload,
  output reg          io_outputs_3_valid,
  input               io_outputs_3_ready,
  output     [63:0]   io_outputs_3_payload,
  output reg          io_outputs_4_valid,
  input               io_outputs_4_ready,
  output     [63:0]   io_outputs_4_payload
);

  wire                when_WaStreamDemux_l26;
  wire                when_WaStreamDemux_l26_1;
  wire                when_WaStreamDemux_l26_2;
  wire                when_WaStreamDemux_l26_3;
  wire                when_WaStreamDemux_l26_4;

  always @(*) begin
    io_input_ready = 1'b0;
    if(!when_WaStreamDemux_l26) begin
      io_input_ready = io_outputs_0_ready;
    end
    if(!when_WaStreamDemux_l26_1) begin
      io_input_ready = io_outputs_1_ready;
    end
    if(!when_WaStreamDemux_l26_2) begin
      io_input_ready = io_outputs_2_ready;
    end
    if(!when_WaStreamDemux_l26_3) begin
      io_input_ready = io_outputs_3_ready;
    end
    if(!when_WaStreamDemux_l26_4) begin
      io_input_ready = io_outputs_4_ready;
    end
  end

  assign io_outputs_0_payload = io_input_payload;
  assign when_WaStreamDemux_l26 = (4'b0100 != io_select);
  always @(*) begin
    if(when_WaStreamDemux_l26) begin
      io_outputs_0_valid = 1'b0;
    end else begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  assign io_outputs_1_payload = io_input_payload;
  assign when_WaStreamDemux_l26_1 = (4'b0101 != io_select);
  always @(*) begin
    if(when_WaStreamDemux_l26_1) begin
      io_outputs_1_valid = 1'b0;
    end else begin
      io_outputs_1_valid = io_input_valid;
    end
  end

  assign io_outputs_2_payload = io_input_payload;
  assign when_WaStreamDemux_l26_2 = (4'b0001 != io_select);
  always @(*) begin
    if(when_WaStreamDemux_l26_2) begin
      io_outputs_2_valid = 1'b0;
    end else begin
      io_outputs_2_valid = io_input_valid;
    end
  end

  assign io_outputs_3_payload = io_input_payload;
  assign when_WaStreamDemux_l26_3 = (4'b0011 != io_select);
  always @(*) begin
    if(when_WaStreamDemux_l26_3) begin
      io_outputs_3_valid = 1'b0;
    end else begin
      io_outputs_3_valid = io_input_valid;
    end
  end

  assign io_outputs_4_payload = io_input_payload;
  assign when_WaStreamDemux_l26_4 = (4'b0010 != io_select);
  always @(*) begin
    if(when_WaStreamDemux_l26_4) begin
      io_outputs_4_valid = 1'b0;
    end else begin
      io_outputs_4_valid = io_input_valid;
    end
  end


endmodule

module WaStreamFifoPipe_2 (
  input               push_valid,
  output              push_ready,
  input      [63:0]   push_payload,
  output              pop_valid,
  input               pop_ready,
  output     [63:0]   pop_payload,
  input               flush,
  output     [12:0]   occupancy,
  output     [12:0]   availability,
  input               clk,
  input               reset
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [63:0]   fifo_io_pop_payload;
  wire       [12:0]   fifo_io_occupancy;
  wire       [12:0]   fifo_io_availability;
  reg        [63:0]   dataReg;
  wire                fifo_io_pop_fire;
  reg                 fireReg;
  reg                 validHold;
  wire                when_WaStreamFifoPipe_l26;
  reg        [63:0]   dataHold;
  wire                when_WaStreamFifoPipe_l30;

  StreamFifo_4 fifo (
    .io_push_valid   (push_valid                ), //i
    .io_push_ready   (fifo_io_push_ready        ), //o
    .io_push_payload (push_payload[63:0]        ), //i
    .io_pop_valid    (fifo_io_pop_valid         ), //o
    .io_pop_ready    (pop_ready                 ), //i
    .io_pop_payload  (fifo_io_pop_payload[63:0] ), //o
    .io_flush        (flush                     ), //i
    .io_occupancy    (fifo_io_occupancy[12:0]   ), //o
    .io_availability (fifo_io_availability[12:0]), //o
    .clk             (clk                       ), //i
    .reset           (reset                     )  //i
  );
  assign push_ready = fifo_io_push_ready;
  assign occupancy = fifo_io_occupancy;
  assign availability = fifo_io_availability;
  assign fifo_io_pop_fire = (fifo_io_pop_valid && pop_ready);
  assign when_WaStreamFifoPipe_l26 = (fireReg && (! pop_ready));
  assign when_WaStreamFifoPipe_l30 = (fireReg && (! pop_ready));
  assign pop_valid = (validHold || fireReg);
  assign pop_payload = (validHold ? dataHold : dataReg);
  always @(posedge clk) begin
    dataReg <= fifo_io_pop_payload;
    if(when_WaStreamFifoPipe_l26) begin
      dataHold <= dataReg;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fireReg <= 1'b0;
      validHold <= 1'b0;
    end else begin
      fireReg <= fifo_io_pop_fire;
      if(pop_ready) begin
        validHold <= 1'b0;
      end else begin
        if(when_WaStreamFifoPipe_l30) begin
          validHold <= 1'b1;
        end
      end
    end
  end


endmodule

module UpSampling (
  input               start,
  input               fifoReady,
  input               sData_valid,
  output reg          sData_ready,
  input      [63:0]   sData_payload,
  output reg          mData_valid,
  input               mData_ready,
  output reg [63:0]   mData_payload,
  input      [8:0]    rowNumIn,
  input      [8:0]    colNumIn,
  input      [9:0]    channelIn,
  input               clk,
  input               reset
);
  localparam ShapeStateMachineEnum_IDLE = 5'd1;
  localparam ShapeStateMachineEnum_INIT = 5'd2;
  localparam ShapeStateMachineEnum_FIFO_READY = 5'd4;
  localparam ShapeStateMachineEnum_COMPUTE = 5'd8;
  localparam ShapeStateMachineEnum_LAST = 5'd16;

  reg                 dataTemp_push_valid;
  reg        [63:0]   dataTemp_push_payload;
  reg                 dataTemp_pop_ready;
  reg                 channelMem_push_valid;
  reg        [63:0]   channelMem_push_payload;
  reg                 channelMem_pop_ready;
  wire                dataTemp_push_ready;
  wire                dataTemp_pop_valid;
  wire       [63:0]   dataTemp_pop_payload;
  wire       [11:0]   dataTemp_occupancy;
  wire       [11:0]   dataTemp_availability;
  wire                channelMem_push_ready;
  wire                channelMem_pop_valid;
  wire       [63:0]   channelMem_pop_payload;
  wire       [6:0]    channelMem_occupancy;
  wire       [6:0]    channelMem_availability;
  wire       [9:0]    _zz_when_WaCounter_l12;
  wire       [6:0]    _zz_when_WaCounter_l12_1;
  wire       [9:0]    _zz_when_WaCounter_l12_1_1;
  wire       [9:0]    _zz_when_WaCounter_l12_2;
  wire       [6:0]    computeChannelTimes;
  wire       [9:0]    computeColumn;
  wire       [9:0]    computeRow;
  wire                fsm_initEnd;
  wire                fsm_fifoReady;
  reg                 fsm_computeEnd;
  wire                fsm_last;
  reg        [4:0]    fsm_currentState;
  reg        [4:0]    fsm_nextState;
  wire                mData_fire;
  reg        [9:0]    channelCnt_count;
  reg                 channelCnt_valid;
  wire                when_WaCounter_l12;
  wire                mData_fire_1;
  wire                when_WaCounter_l17;
  reg        [9:0]    columnCnt_count;
  reg                 columnCnt_valid;
  wire                when_WaCounter_l12_1;
  reg        [9:0]    rowCnt_count;
  reg                 rowCnt_valid;
  wire                when_WaCounter_l12_2;
  wire                when_WaCounter_l17_1;
  reg        [2:0]    initCount_count;
  reg                 initCount_valid;
  wire                when_WaCounter_l12_3;
  wire                when_UpSampling_l39;
  reg                 columnCnt_valid_regNext;
  reg                 rowCnt_valid_regNext;
  wire                when_UpSampling_l53;
  wire                when_UpSampling_l54;
  wire                sData_fire;
  wire                sData_fire_1;
  wire                sData_fire_2;
  wire                when_UpSampling_l75;
  wire                when_UpSampling_l93;
  `ifndef SYNTHESIS
  reg [79:0] fsm_currentState_string;
  reg [79:0] fsm_nextState_string;
  `endif


  assign _zz_when_WaCounter_l12_1 = (computeChannelTimes - 7'h01);
  assign _zz_when_WaCounter_l12 = {3'd0, _zz_when_WaCounter_l12_1};
  assign _zz_when_WaCounter_l12_1_1 = (computeColumn - 10'h001);
  assign _zz_when_WaCounter_l12_2 = (computeRow - 10'h001);
  WaStreamFifoPipe dataTemp (
    .push_valid   (dataTemp_push_valid        ), //i
    .push_ready   (dataTemp_push_ready        ), //o
    .push_payload (dataTemp_push_payload[63:0]), //i
    .pop_valid    (dataTemp_pop_valid         ), //o
    .pop_ready    (dataTemp_pop_ready         ), //i
    .pop_payload  (dataTemp_pop_payload[63:0] ), //o
    .flush        (1'b0                       ), //i
    .occupancy    (dataTemp_occupancy[11:0]   ), //o
    .availability (dataTemp_availability[11:0]), //o
    .clk          (clk                        ), //i
    .reset        (reset                      )  //i
  );
  WaStreamFifoPipe_1 channelMem (
    .push_valid   (channelMem_push_valid        ), //i
    .push_ready   (channelMem_push_ready        ), //o
    .push_payload (channelMem_push_payload[63:0]), //i
    .pop_valid    (channelMem_pop_valid         ), //o
    .pop_ready    (channelMem_pop_ready         ), //i
    .pop_payload  (channelMem_pop_payload[63:0] ), //o
    .flush        (1'b0                         ), //i
    .occupancy    (channelMem_occupancy[6:0]    ), //o
    .availability (channelMem_availability[6:0] ), //o
    .clk          (clk                          ), //i
    .reset        (reset                        )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_currentState)
      ShapeStateMachineEnum_IDLE : fsm_currentState_string = "IDLE      ";
      ShapeStateMachineEnum_INIT : fsm_currentState_string = "INIT      ";
      ShapeStateMachineEnum_FIFO_READY : fsm_currentState_string = "FIFO_READY";
      ShapeStateMachineEnum_COMPUTE : fsm_currentState_string = "COMPUTE   ";
      ShapeStateMachineEnum_LAST : fsm_currentState_string = "LAST      ";
      default : fsm_currentState_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_nextState)
      ShapeStateMachineEnum_IDLE : fsm_nextState_string = "IDLE      ";
      ShapeStateMachineEnum_INIT : fsm_nextState_string = "INIT      ";
      ShapeStateMachineEnum_FIFO_READY : fsm_nextState_string = "FIFO_READY";
      ShapeStateMachineEnum_COMPUTE : fsm_nextState_string = "COMPUTE   ";
      ShapeStateMachineEnum_LAST : fsm_nextState_string = "LAST      ";
      default : fsm_nextState_string = "??????????";
    endcase
  end
  `endif

  assign computeChannelTimes = (channelIn >>> 3);
  assign computeColumn = ({1'd0,colNumIn} <<< 1);
  assign computeRow = ({1'd0,rowNumIn} <<< 1);
  always @(*) begin
    (* parallel_case *)
    case(1) // synthesis parallel_case
      (((fsm_currentState) & ShapeStateMachineEnum_IDLE) == ShapeStateMachineEnum_IDLE) : begin
        if(start) begin
          fsm_nextState = ShapeStateMachineEnum_INIT;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_IDLE;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_INIT) == ShapeStateMachineEnum_INIT) : begin
        if(fsm_initEnd) begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_INIT;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_FIFO_READY) == ShapeStateMachineEnum_FIFO_READY) : begin
        if(fsm_fifoReady) begin
          fsm_nextState = ShapeStateMachineEnum_COMPUTE;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_COMPUTE) == ShapeStateMachineEnum_COMPUTE) : begin
        if(fsm_computeEnd) begin
          fsm_nextState = ShapeStateMachineEnum_LAST;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_COMPUTE;
        end
      end
      default : begin
        if(fsm_last) begin
          fsm_nextState = ShapeStateMachineEnum_IDLE;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end
      end
    endcase
  end

  assign mData_fire = (mData_valid && mData_ready);
  assign when_WaCounter_l12 = (channelCnt_count == _zz_when_WaCounter_l12);
  always @(*) begin
    if(when_WaCounter_l12) begin
      channelCnt_valid = 1'b1;
    end else begin
      channelCnt_valid = 1'b0;
    end
  end

  assign mData_fire_1 = (mData_valid && mData_ready);
  assign when_WaCounter_l17 = (channelCnt_valid && mData_fire_1);
  assign when_WaCounter_l12_1 = (columnCnt_count == _zz_when_WaCounter_l12_1_1);
  always @(*) begin
    if(when_WaCounter_l12_1) begin
      columnCnt_valid = 1'b1;
    end else begin
      columnCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l12_2 = (rowCnt_count == _zz_when_WaCounter_l12_2);
  always @(*) begin
    if(when_WaCounter_l12_2) begin
      rowCnt_valid = 1'b1;
    end else begin
      rowCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l17_1 = ((fsm_currentState & ShapeStateMachineEnum_INIT) != 5'b00000);
  assign when_WaCounter_l12_3 = (initCount_count == 3'b101);
  always @(*) begin
    if(when_WaCounter_l12_3) begin
      initCount_valid = 1'b1;
    end else begin
      initCount_valid = 1'b0;
    end
  end

  assign fsm_initEnd = initCount_valid;
  assign fsm_fifoReady = fifoReady;
  assign when_UpSampling_l39 = (computeChannelTimes == 7'h01);
  always @(*) begin
    if(when_UpSampling_l39) begin
      fsm_computeEnd = (channelCnt_valid && (columnCnt_valid && (! columnCnt_valid_regNext)));
    end else begin
      fsm_computeEnd = (channelCnt_valid && columnCnt_valid);
    end
  end

  assign fsm_last = rowCnt_valid_regNext;
  assign when_UpSampling_l53 = (! rowCnt_count[0]);
  assign when_UpSampling_l54 = (! columnCnt_count[0]);
  always @(*) begin
    if(when_UpSampling_l53) begin
      if(when_UpSampling_l54) begin
        sData_ready = ((mData_ready && dataTemp_push_ready) && channelMem_push_ready);
      end else begin
        sData_ready = 1'b0;
      end
    end else begin
      sData_ready = 1'b0;
    end
    if(when_UpSampling_l93) begin
      sData_ready = 1'b0;
    end
  end

  assign sData_fire = (sData_valid && sData_ready);
  always @(*) begin
    if(when_UpSampling_l53) begin
      if(when_UpSampling_l54) begin
        mData_valid = sData_fire;
      end else begin
        mData_valid = channelMem_pop_valid;
      end
    end else begin
      if(when_UpSampling_l75) begin
        mData_valid = dataTemp_pop_valid;
      end else begin
        mData_valid = channelMem_pop_valid;
      end
    end
  end

  always @(*) begin
    if(when_UpSampling_l53) begin
      if(when_UpSampling_l54) begin
        mData_payload = sData_payload;
      end else begin
        mData_payload = channelMem_pop_payload;
      end
    end else begin
      if(when_UpSampling_l75) begin
        mData_payload = dataTemp_pop_payload;
      end else begin
        mData_payload = channelMem_pop_payload;
      end
    end
  end

  always @(*) begin
    if(when_UpSampling_l53) begin
      if(when_UpSampling_l54) begin
        dataTemp_push_payload = sData_payload;
      end else begin
        dataTemp_push_payload = 64'h0;
      end
    end else begin
      if(when_UpSampling_l75) begin
        dataTemp_push_payload = 64'h0;
      end else begin
        dataTemp_push_payload = 64'h0;
      end
    end
  end

  assign sData_fire_1 = (sData_valid && sData_ready);
  always @(*) begin
    if(when_UpSampling_l53) begin
      if(when_UpSampling_l54) begin
        dataTemp_push_valid = sData_fire_1;
      end else begin
        dataTemp_push_valid = 1'b0;
      end
    end else begin
      if(when_UpSampling_l75) begin
        dataTemp_push_valid = 1'b0;
      end else begin
        dataTemp_push_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    if(when_UpSampling_l53) begin
      if(when_UpSampling_l54) begin
        dataTemp_pop_ready = 1'b0;
      end else begin
        dataTemp_pop_ready = 1'b0;
      end
    end else begin
      if(when_UpSampling_l75) begin
        dataTemp_pop_ready = (mData_ready && channelMem_push_ready);
      end else begin
        dataTemp_pop_ready = 1'b0;
      end
    end
  end

  always @(*) begin
    if(when_UpSampling_l53) begin
      if(when_UpSampling_l54) begin
        channelMem_push_payload = sData_payload;
      end else begin
        channelMem_push_payload = 64'h0;
      end
    end else begin
      if(when_UpSampling_l75) begin
        channelMem_push_payload = dataTemp_pop_payload;
      end else begin
        channelMem_push_payload = 64'h0;
      end
    end
  end

  assign sData_fire_2 = (sData_valid && sData_ready);
  always @(*) begin
    if(when_UpSampling_l53) begin
      if(when_UpSampling_l54) begin
        channelMem_push_valid = sData_fire_2;
      end else begin
        channelMem_push_valid = 1'b0;
      end
    end else begin
      if(when_UpSampling_l75) begin
        channelMem_push_valid = dataTemp_pop_valid;
      end else begin
        channelMem_push_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    if(when_UpSampling_l53) begin
      if(when_UpSampling_l54) begin
        channelMem_pop_ready = 1'b0;
      end else begin
        channelMem_pop_ready = mData_ready;
      end
    end else begin
      if(when_UpSampling_l75) begin
        channelMem_pop_ready = 1'b0;
      end else begin
        channelMem_pop_ready = mData_ready;
      end
    end
  end

  assign when_UpSampling_l75 = (! columnCnt_count[0]);
  assign when_UpSampling_l93 = (((fsm_currentState & ShapeStateMachineEnum_IDLE) != 5'b00000) || ((fsm_currentState & ShapeStateMachineEnum_INIT) != 5'b00000));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_currentState <= ShapeStateMachineEnum_IDLE;
      channelCnt_count <= 10'h0;
      columnCnt_count <= 10'h0;
      rowCnt_count <= 10'h0;
      initCount_count <= 3'b000;
    end else begin
      fsm_currentState <= fsm_nextState;
      if(mData_fire) begin
        channelCnt_count <= (channelCnt_count + 10'h001);
        if(channelCnt_valid) begin
          channelCnt_count <= 10'h0;
        end
      end
      if(when_WaCounter_l17) begin
        columnCnt_count <= (columnCnt_count + 10'h001);
        if(columnCnt_valid) begin
          columnCnt_count <= 10'h0;
        end
      end
      if(fsm_computeEnd) begin
        rowCnt_count <= (rowCnt_count + 10'h001);
        if(rowCnt_valid) begin
          rowCnt_count <= 10'h0;
        end
      end
      if(when_WaCounter_l17_1) begin
        initCount_count <= (initCount_count + 3'b001);
        if(initCount_valid) begin
          initCount_count <= 3'b000;
        end
      end
    end
  end

  always @(posedge clk) begin
    columnCnt_valid_regNext <= columnCnt_valid;
  end

  always @(posedge clk) begin
    rowCnt_valid_regNext <= rowCnt_valid;
  end


endmodule

module Split (
  input               start,
  input               fifoReady,
  input               sData_valid,
  output              sData_ready,
  input      [63:0]   sData_payload,
  output              mData_valid,
  input               mData_ready,
  output     [63:0]   mData_payload,
  input      [8:0]    rowNumIn,
  input      [8:0]    colNumIn,
  input      [9:0]    channelIn,
  input               clk,
  input               reset
);
  localparam ShapeStateMachineEnum_IDLE = 5'd1;
  localparam ShapeStateMachineEnum_INIT = 5'd2;
  localparam ShapeStateMachineEnum_FIFO_READY = 5'd4;
  localparam ShapeStateMachineEnum_COMPUTE = 5'd8;
  localparam ShapeStateMachineEnum_LAST = 5'd16;

  wire       [9:0]    _zz_when_WaCounter_l12;
  wire       [6:0]    _zz_when_WaCounter_l12_1;
  wire       [8:0]    _zz_when_WaCounter_l12_1_1;
  wire       [8:0]    _zz_when_WaCounter_l12_2;
  wire       [9:0]    _zz_when_Stream_l438;
  wire       [6:0]    computeChannelTimes;
  wire       [5:0]    channelOut;
  wire                fsm_initEnd;
  wire                fsm_fifoReady;
  wire                fsm_computeEnd;
  wire                fsm_last;
  reg        [4:0]    fsm_currentState;
  reg        [4:0]    fsm_nextState;
  wire                sData_fire;
  reg        [9:0]    channelCnt_count;
  reg                 channelCnt_valid;
  wire                when_WaCounter_l12;
  wire                sData_fire_1;
  wire                when_WaCounter_l17;
  reg        [8:0]    columnCnt_count;
  reg                 columnCnt_valid;
  wire                when_WaCounter_l12_1;
  wire                when_WaCounter_l17_1;
  reg        [8:0]    rowCnt_count;
  reg                 rowCnt_valid;
  wire                when_WaCounter_l12_2;
  wire                when_WaCounter_l17_2;
  reg        [2:0]    initCount_count;
  reg                 initCount_valid;
  wire                when_WaCounter_l12_3;
  wire                _zz_sData_ready;
  reg                 _zz_sData_ready_1;
  wire                when_Stream_l438;
  reg                 _zz_mData_valid;
  `ifndef SYNTHESIS
  reg [79:0] fsm_currentState_string;
  reg [79:0] fsm_nextState_string;
  `endif


  assign _zz_when_WaCounter_l12_1 = (computeChannelTimes - 7'h01);
  assign _zz_when_WaCounter_l12 = {3'd0, _zz_when_WaCounter_l12_1};
  assign _zz_when_WaCounter_l12_1_1 = (colNumIn - 9'h001);
  assign _zz_when_WaCounter_l12_2 = (rowNumIn - 9'h001);
  assign _zz_when_Stream_l438 = {4'd0, channelOut};
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_currentState)
      ShapeStateMachineEnum_IDLE : fsm_currentState_string = "IDLE      ";
      ShapeStateMachineEnum_INIT : fsm_currentState_string = "INIT      ";
      ShapeStateMachineEnum_FIFO_READY : fsm_currentState_string = "FIFO_READY";
      ShapeStateMachineEnum_COMPUTE : fsm_currentState_string = "COMPUTE   ";
      ShapeStateMachineEnum_LAST : fsm_currentState_string = "LAST      ";
      default : fsm_currentState_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_nextState)
      ShapeStateMachineEnum_IDLE : fsm_nextState_string = "IDLE      ";
      ShapeStateMachineEnum_INIT : fsm_nextState_string = "INIT      ";
      ShapeStateMachineEnum_FIFO_READY : fsm_nextState_string = "FIFO_READY";
      ShapeStateMachineEnum_COMPUTE : fsm_nextState_string = "COMPUTE   ";
      ShapeStateMachineEnum_LAST : fsm_nextState_string = "LAST      ";
      default : fsm_nextState_string = "??????????";
    endcase
  end
  `endif

  assign computeChannelTimes = (channelIn >>> 3);
  assign channelOut = (computeChannelTimes >>> 1);
  always @(*) begin
    (* parallel_case *)
    case(1) // synthesis parallel_case
      (((fsm_currentState) & ShapeStateMachineEnum_IDLE) == ShapeStateMachineEnum_IDLE) : begin
        if(start) begin
          fsm_nextState = ShapeStateMachineEnum_INIT;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_IDLE;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_INIT) == ShapeStateMachineEnum_INIT) : begin
        if(fsm_initEnd) begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_INIT;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_FIFO_READY) == ShapeStateMachineEnum_FIFO_READY) : begin
        if(fsm_fifoReady) begin
          fsm_nextState = ShapeStateMachineEnum_COMPUTE;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_COMPUTE) == ShapeStateMachineEnum_COMPUTE) : begin
        if(fsm_computeEnd) begin
          fsm_nextState = ShapeStateMachineEnum_LAST;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_COMPUTE;
        end
      end
      default : begin
        if(fsm_last) begin
          fsm_nextState = ShapeStateMachineEnum_IDLE;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end
      end
    endcase
  end

  assign sData_fire = (sData_valid && sData_ready);
  assign when_WaCounter_l12 = (channelCnt_count == _zz_when_WaCounter_l12);
  always @(*) begin
    if(when_WaCounter_l12) begin
      channelCnt_valid = 1'b1;
    end else begin
      channelCnt_valid = 1'b0;
    end
  end

  assign sData_fire_1 = (sData_valid && sData_ready);
  assign when_WaCounter_l17 = (channelCnt_valid && sData_fire_1);
  assign when_WaCounter_l12_1 = (columnCnt_count == _zz_when_WaCounter_l12_1_1);
  always @(*) begin
    if(when_WaCounter_l12_1) begin
      columnCnt_valid = 1'b1;
    end else begin
      columnCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l17_1 = ((fsm_currentState & ShapeStateMachineEnum_LAST) != 5'b00000);
  assign when_WaCounter_l12_2 = (rowCnt_count == _zz_when_WaCounter_l12_2);
  always @(*) begin
    if(when_WaCounter_l12_2) begin
      rowCnt_valid = 1'b1;
    end else begin
      rowCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l17_2 = ((fsm_currentState & ShapeStateMachineEnum_INIT) != 5'b00000);
  assign when_WaCounter_l12_3 = (initCount_count == 3'b101);
  always @(*) begin
    if(when_WaCounter_l12_3) begin
      initCount_valid = 1'b1;
    end else begin
      initCount_valid = 1'b0;
    end
  end

  assign fsm_initEnd = initCount_valid;
  assign fsm_fifoReady = fifoReady;
  assign fsm_computeEnd = (channelCnt_valid && columnCnt_valid);
  assign fsm_last = rowCnt_valid;
  assign _zz_sData_ready = (! ((fsm_currentState & ShapeStateMachineEnum_COMPUTE) == 5'b00000));
  assign sData_ready = (_zz_sData_ready_1 && _zz_sData_ready);
  assign when_Stream_l438 = (channelCnt_count < _zz_when_Stream_l438);
  always @(*) begin
    _zz_mData_valid = (sData_valid && _zz_sData_ready);
    if(when_Stream_l438) begin
      _zz_mData_valid = 1'b0;
    end
  end

  always @(*) begin
    _zz_sData_ready_1 = mData_ready;
    if(when_Stream_l438) begin
      _zz_sData_ready_1 = 1'b1;
    end
  end

  assign mData_valid = _zz_mData_valid;
  assign mData_payload = sData_payload;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_currentState <= ShapeStateMachineEnum_IDLE;
      channelCnt_count <= 10'h0;
      columnCnt_count <= 9'h0;
      rowCnt_count <= 9'h0;
      initCount_count <= 3'b000;
    end else begin
      fsm_currentState <= fsm_nextState;
      if(sData_fire) begin
        channelCnt_count <= (channelCnt_count + 10'h001);
        if(channelCnt_valid) begin
          channelCnt_count <= 10'h0;
        end
      end
      if(when_WaCounter_l17) begin
        columnCnt_count <= (columnCnt_count + 9'h001);
        if(columnCnt_valid) begin
          columnCnt_count <= 9'h0;
        end
      end
      if(when_WaCounter_l17_1) begin
        rowCnt_count <= (rowCnt_count + 9'h001);
        if(rowCnt_valid) begin
          rowCnt_count <= 9'h0;
        end
      end
      if(when_WaCounter_l17_2) begin
        initCount_count <= (initCount_count + 3'b001);
        if(initCount_valid) begin
          initCount_count <= 3'b000;
        end
      end
    end
  end


endmodule

module MaxPooling (
  input               start,
  input               fifoReady,
  input               sData_valid,
  output reg          sData_ready,
  input      [63:0]   sData_payload,
  output              mData_valid,
  input               mData_ready,
  output reg [63:0]   mData_payload,
  input      [8:0]    rowNumIn,
  input      [8:0]    colNumIn,
  input      [9:0]    channelIn,
  input               clk,
  input               reset
);
  localparam ShapeStateMachineEnum_IDLE = 5'd1;
  localparam ShapeStateMachineEnum_INIT = 5'd2;
  localparam ShapeStateMachineEnum_FIFO_READY = 5'd4;
  localparam ShapeStateMachineEnum_COMPUTE = 5'd8;
  localparam ShapeStateMachineEnum_LAST = 5'd16;

  reg        [63:0]   _zz_channelMem_port1;
  reg        [63:0]   _zz_rowMem_port1;
  wire       [9:0]    _zz_when_WaCounter_l12_1;
  wire       [6:0]    _zz_when_WaCounter_l12_1_1;
  wire       [8:0]    _zz_when_WaCounter_l12_2;
  wire       [8:0]    _zz_when_WaCounter_l12_3;
  wire       [6:0]    _zz_when_WaCounter_l12_4;
  wire       [6:0]    _zz_when_WaCounter_l12_4_1;
  wire       [63:0]   _zz_channelMem_port;
  wire                _zz_channelMem_port_1;
  wire       [6:0]    _zz_when_WaCounter_l12_5;
  wire       [6:0]    _zz_when_WaCounter_l12_5_1;
  wire       [15:0]   _zz_when_WaCounter_l12_6;
  wire       [15:0]   _zz_when_WaCounter_l12_6_1;
  wire       [63:0]   _zz_rowMem_port;
  wire       [15:0]   _zz_when_WaCounter_l12_7;
  wire       [15:0]   _zz_when_WaCounter_l12_7_1;
  wire                _zz_channelMem_port_2;
  wire                _zz__zz_pix11_0;
  wire                _zz_rowMem_port_1;
  wire                _zz__zz_maxPix1_0;
  wire       [6:0]    computeChannelTimes;
  wire                fsm_initEnd;
  wire                fsm_fifoReady;
  wire                fsm_computeEnd;
  wire                fsm_last;
  reg        [4:0]    fsm_currentState;
  reg        [4:0]    fsm_nextState;
  wire                when_WaCounter_l17;
  reg        [2:0]    initCount_count;
  reg                 initCount_valid;
  wire                when_WaCounter_l12;
  wire                sData_fire;
  reg        [9:0]    channelCnt_count;
  reg                 channelCnt_valid;
  wire                when_WaCounter_l12_1;
  wire                sData_fire_1;
  wire                when_WaCounter_l17_1;
  reg        [8:0]    columnCnt_count;
  reg                 columnCnt_valid;
  wire                when_WaCounter_l12_2;
  wire                when_WaCounter_l17_2;
  reg        [8:0]    rowCnt_count;
  reg                 rowCnt_valid;
  wire                when_WaCounter_l12_3;
  wire                sData_fire_2;
  wire                when_WaCounter_l17_3;
  reg        [5:0]    channelMemWriteAddr_count;
  reg                 channelMemWriteAddr_valid;
  wire                when_WaCounter_l12_4;
  wire                sData_fire_3;
  wire                sData_fire_4;
  wire                when_WaCounter_l17_4;
  reg        [5:0]    channelMemReadAddr_count;
  reg                 channelMemReadAddr_valid;
  wire                when_WaCounter_l12_5;
  wire                when_MaxPooling_l44;
  wire       [7:0]    dataTemp_0;
  wire       [7:0]    dataTemp_1;
  wire       [7:0]    dataTemp_2;
  wire       [7:0]    dataTemp_3;
  wire       [7:0]    dataTemp_4;
  wire       [7:0]    dataTemp_5;
  wire       [7:0]    dataTemp_6;
  wire       [7:0]    dataTemp_7;
  reg        [15:0]   depth;
  wire                sData_fire_5;
  reg                 _zz_1;
  reg                 _zz_1_regNext;
  reg                 _zz_1_regNext_regNext;
  reg        [10:0]   rowMemWriteAddr_count;
  reg                 rowMemWriteAddr_valid;
  wire                when_WaCounter_l12_6;
  reg                 _zz_2;
  reg                 _zz_2_regNext;
  reg                 _zz_2_regNext_regNext;
  wire                sData_fire_6;
  reg                 _zz_3;
  reg                 _zz_3_regNext;
  reg                 _zz_3_regNext_regNext;
  reg        [10:0]   rowMemReadAddr_count;
  reg                 rowMemReadAddr_valid;
  wire                when_WaCounter_l12_7;
  wire                when_MaxPooling_l73;
  wire       [7:0]    dataOut_0;
  wire       [7:0]    dataOut_1;
  wire       [7:0]    dataOut_2;
  wire       [7:0]    dataOut_3;
  wire       [7:0]    dataOut_4;
  wire       [7:0]    dataOut_5;
  wire       [7:0]    dataOut_6;
  wire       [7:0]    dataOut_7;
  wire       [7:0]    pix12_0;
  wire       [7:0]    pix12_1;
  wire       [7:0]    pix12_2;
  wire       [7:0]    pix12_3;
  wire       [7:0]    pix12_4;
  wire       [7:0]    pix12_5;
  wire       [7:0]    pix12_6;
  wire       [7:0]    pix12_7;
  wire       [7:0]    pix11_0;
  wire       [7:0]    pix11_1;
  wire       [7:0]    pix11_2;
  wire       [7:0]    pix11_3;
  wire       [7:0]    pix11_4;
  wire       [7:0]    pix11_5;
  wire       [7:0]    pix11_6;
  wire       [7:0]    pix11_7;
  wire       [7:0]    maxPix2_0;
  wire       [7:0]    maxPix2_1;
  wire       [7:0]    maxPix2_2;
  wire       [7:0]    maxPix2_3;
  wire       [7:0]    maxPix2_4;
  wire       [7:0]    maxPix2_5;
  wire       [7:0]    maxPix2_6;
  wire       [7:0]    maxPix2_7;
  wire       [7:0]    maxPix1_0;
  wire       [7:0]    maxPix1_1;
  wire       [7:0]    maxPix1_2;
  wire       [7:0]    maxPix1_3;
  wire       [7:0]    maxPix1_4;
  wire       [7:0]    maxPix1_5;
  wire       [7:0]    maxPix1_6;
  wire       [7:0]    maxPix1_7;
  reg        [7:0]    _zz_pix12_0;
  reg        [7:0]    _zz_pix12_1;
  reg        [7:0]    _zz_pix12_2;
  reg        [7:0]    _zz_pix12_3;
  reg        [7:0]    _zz_pix12_4;
  reg        [7:0]    _zz_pix12_5;
  reg        [7:0]    _zz_pix12_6;
  reg        [7:0]    _zz_pix12_7;
  reg        [7:0]    _zz_pix12_0_1;
  reg        [7:0]    _zz_pix12_1_1;
  reg        [7:0]    _zz_pix12_2_1;
  reg        [7:0]    _zz_pix12_3_1;
  reg        [7:0]    _zz_pix12_4_1;
  reg        [7:0]    _zz_pix12_5_1;
  reg        [7:0]    _zz_pix12_6_1;
  reg        [7:0]    _zz_pix12_7_1;
  reg        [63:0]   _zz_pix11_0;
  reg        [7:0]    dataTemp_regNext_0;
  reg        [7:0]    dataTemp_regNext_1;
  reg        [7:0]    dataTemp_regNext_2;
  reg        [7:0]    dataTemp_regNext_3;
  reg        [7:0]    dataTemp_regNext_4;
  reg        [7:0]    dataTemp_regNext_5;
  reg        [7:0]    dataTemp_regNext_6;
  reg        [7:0]    dataTemp_regNext_7;
  reg        [7:0]    dataTemp_regNext_regNext_0;
  reg        [7:0]    dataTemp_regNext_regNext_1;
  reg        [7:0]    dataTemp_regNext_regNext_2;
  reg        [7:0]    dataTemp_regNext_regNext_3;
  reg        [7:0]    dataTemp_regNext_regNext_4;
  reg        [7:0]    dataTemp_regNext_regNext_5;
  reg        [7:0]    dataTemp_regNext_regNext_6;
  reg        [7:0]    dataTemp_regNext_regNext_7;
  reg        [63:0]   _zz_maxPix1_0;
  reg        [7:0]    _zz_dataTemp_0;
  wire                when_MaxPooling_l55;
  reg        [7:0]    _zz_dataOut_0;
  wire                when_MaxPooling_l55_1;
  reg        [7:0]    _zz_dataTemp_1;
  wire                when_MaxPooling_l55_2;
  reg        [7:0]    _zz_dataOut_1;
  wire                when_MaxPooling_l55_3;
  reg        [7:0]    _zz_dataTemp_2;
  wire                when_MaxPooling_l55_4;
  reg        [7:0]    _zz_dataOut_2;
  wire                when_MaxPooling_l55_5;
  reg        [7:0]    _zz_dataTemp_3;
  wire                when_MaxPooling_l55_6;
  reg        [7:0]    _zz_dataOut_3;
  wire                when_MaxPooling_l55_7;
  reg        [7:0]    _zz_dataTemp_4;
  wire                when_MaxPooling_l55_8;
  reg        [7:0]    _zz_dataOut_4;
  wire                when_MaxPooling_l55_9;
  reg        [7:0]    _zz_dataTemp_5;
  wire                when_MaxPooling_l55_10;
  reg        [7:0]    _zz_dataOut_5;
  wire                when_MaxPooling_l55_11;
  reg        [7:0]    _zz_dataTemp_6;
  wire                when_MaxPooling_l55_12;
  reg        [7:0]    _zz_dataOut_6;
  wire                when_MaxPooling_l55_13;
  reg        [7:0]    _zz_dataTemp_7;
  wire                when_MaxPooling_l55_14;
  reg        [7:0]    _zz_dataOut_7;
  wire                when_MaxPooling_l55_15;
  reg        [7:0]    dataOut_regNext_0;
  reg        [7:0]    dataOut_regNext_1;
  reg        [7:0]    dataOut_regNext_2;
  reg        [7:0]    dataOut_regNext_3;
  reg        [7:0]    dataOut_regNext_4;
  reg        [7:0]    dataOut_regNext_5;
  reg        [7:0]    dataOut_regNext_6;
  reg        [7:0]    dataOut_regNext_7;
  reg                 _zz_mData_valid;
  reg                 _zz_mData_valid_1;
  reg                 _zz_mData_valid_2;
  reg                 _zz_mData_valid_3;
  reg                 _zz_mData_valid_4;
  reg                 _zz_mData_valid_5;
  reg                 _zz_mData_valid_6;
  `ifndef SYNTHESIS
  reg [79:0] fsm_currentState_string;
  reg [79:0] fsm_nextState_string;
  `endif

  reg [63:0] channelMem [0:63];
  (* ram_style = "block" *) reg [63:0] rowMem [0:2047];

  assign _zz_when_WaCounter_l12_1_1 = (computeChannelTimes - 7'h01);
  assign _zz_when_WaCounter_l12_1 = {3'd0, _zz_when_WaCounter_l12_1_1};
  assign _zz_when_WaCounter_l12_2 = (colNumIn - 9'h001);
  assign _zz_when_WaCounter_l12_3 = (rowNumIn - 9'h001);
  assign _zz_when_WaCounter_l12_4 = {1'd0, channelMemWriteAddr_count};
  assign _zz_when_WaCounter_l12_4_1 = (computeChannelTimes - 7'h01);
  assign _zz_when_WaCounter_l12_5 = {1'd0, channelMemReadAddr_count};
  assign _zz_when_WaCounter_l12_5_1 = (computeChannelTimes - 7'h01);
  assign _zz_when_WaCounter_l12_6 = {5'd0, rowMemWriteAddr_count};
  assign _zz_when_WaCounter_l12_6_1 = (depth - 16'h0001);
  assign _zz_when_WaCounter_l12_7 = {5'd0, rowMemReadAddr_count};
  assign _zz_when_WaCounter_l12_7_1 = (depth - 16'h0001);
  assign _zz_channelMem_port = sData_payload;
  assign _zz_channelMem_port_1 = ((! columnCnt_count[0]) && sData_fire_3);
  assign _zz__zz_pix11_0 = 1'b1;
  assign _zz_rowMem_port = {{{{{{{dataTemp_7,dataTemp_6},dataTemp_5},dataTemp_4},dataTemp_3},dataTemp_2},dataTemp_1},dataTemp_0};
  assign _zz__zz_maxPix1_0 = 1'b1;
  always @(posedge clk) begin
    if(_zz_channelMem_port_1) begin
      channelMem[channelMemWriteAddr_count] <= _zz_channelMem_port;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_pix11_0) begin
      _zz_channelMem_port1 <= channelMem[channelMemReadAddr_count];
    end
  end

  always @(posedge clk) begin
    if(_zz_2_regNext_regNext) begin
      rowMem[rowMemWriteAddr_count] <= _zz_rowMem_port;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_maxPix1_0) begin
      _zz_rowMem_port1 <= rowMem[rowMemReadAddr_count];
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_currentState)
      ShapeStateMachineEnum_IDLE : fsm_currentState_string = "IDLE      ";
      ShapeStateMachineEnum_INIT : fsm_currentState_string = "INIT      ";
      ShapeStateMachineEnum_FIFO_READY : fsm_currentState_string = "FIFO_READY";
      ShapeStateMachineEnum_COMPUTE : fsm_currentState_string = "COMPUTE   ";
      ShapeStateMachineEnum_LAST : fsm_currentState_string = "LAST      ";
      default : fsm_currentState_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_nextState)
      ShapeStateMachineEnum_IDLE : fsm_nextState_string = "IDLE      ";
      ShapeStateMachineEnum_INIT : fsm_nextState_string = "INIT      ";
      ShapeStateMachineEnum_FIFO_READY : fsm_nextState_string = "FIFO_READY";
      ShapeStateMachineEnum_COMPUTE : fsm_nextState_string = "COMPUTE   ";
      ShapeStateMachineEnum_LAST : fsm_nextState_string = "LAST      ";
      default : fsm_nextState_string = "??????????";
    endcase
  end
  `endif

  assign computeChannelTimes = (channelIn >>> 3);
  always @(*) begin
    (* parallel_case *)
    case(1) // synthesis parallel_case
      (((fsm_currentState) & ShapeStateMachineEnum_IDLE) == ShapeStateMachineEnum_IDLE) : begin
        if(start) begin
          fsm_nextState = ShapeStateMachineEnum_INIT;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_IDLE;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_INIT) == ShapeStateMachineEnum_INIT) : begin
        if(fsm_initEnd) begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_INIT;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_FIFO_READY) == ShapeStateMachineEnum_FIFO_READY) : begin
        if(fsm_fifoReady) begin
          fsm_nextState = ShapeStateMachineEnum_COMPUTE;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_COMPUTE) == ShapeStateMachineEnum_COMPUTE) : begin
        if(fsm_computeEnd) begin
          fsm_nextState = ShapeStateMachineEnum_LAST;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_COMPUTE;
        end
      end
      default : begin
        if(fsm_last) begin
          fsm_nextState = ShapeStateMachineEnum_IDLE;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end
      end
    endcase
  end

  assign fsm_fifoReady = fifoReady;
  assign when_WaCounter_l17 = ((fsm_currentState & ShapeStateMachineEnum_INIT) != 5'b00000);
  assign when_WaCounter_l12 = (initCount_count == 3'b101);
  always @(*) begin
    if(when_WaCounter_l12) begin
      initCount_valid = 1'b1;
    end else begin
      initCount_valid = 1'b0;
    end
  end

  assign fsm_initEnd = initCount_valid;
  assign sData_fire = (sData_valid && sData_ready);
  assign when_WaCounter_l12_1 = (channelCnt_count == _zz_when_WaCounter_l12_1);
  always @(*) begin
    if(when_WaCounter_l12_1) begin
      channelCnt_valid = 1'b1;
    end else begin
      channelCnt_valid = 1'b0;
    end
    if(when_MaxPooling_l73) begin
      channelCnt_valid = 1'b0;
    end
  end

  assign sData_fire_1 = (sData_valid && sData_ready);
  assign when_WaCounter_l17_1 = (channelCnt_valid && sData_fire_1);
  assign when_WaCounter_l12_2 = (columnCnt_count == _zz_when_WaCounter_l12_2);
  always @(*) begin
    if(when_WaCounter_l12_2) begin
      columnCnt_valid = 1'b1;
    end else begin
      columnCnt_valid = 1'b0;
    end
    if(when_MaxPooling_l73) begin
      columnCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l17_2 = ((fsm_currentState & ShapeStateMachineEnum_LAST) != 5'b00000);
  assign when_WaCounter_l12_3 = (rowCnt_count == _zz_when_WaCounter_l12_3);
  always @(*) begin
    if(when_WaCounter_l12_3) begin
      rowCnt_valid = 1'b1;
    end else begin
      rowCnt_valid = 1'b0;
    end
    if(when_MaxPooling_l73) begin
      rowCnt_valid = 1'b0;
    end
  end

  assign sData_fire_2 = (sData_valid && sData_ready);
  assign when_WaCounter_l17_3 = ((! columnCnt_count[0]) && sData_fire_2);
  assign when_WaCounter_l12_4 = (_zz_when_WaCounter_l12_4 == _zz_when_WaCounter_l12_4_1);
  always @(*) begin
    if(when_WaCounter_l12_4) begin
      channelMemWriteAddr_valid = 1'b1;
    end else begin
      channelMemWriteAddr_valid = 1'b0;
    end
    if(when_MaxPooling_l73) begin
      channelMemWriteAddr_valid = 1'b0;
    end
  end

  assign sData_fire_3 = (sData_valid && sData_ready);
  assign sData_fire_4 = (sData_valid && sData_ready);
  assign when_WaCounter_l17_4 = (columnCnt_count[0] && sData_fire_4);
  assign when_WaCounter_l12_5 = (_zz_when_WaCounter_l12_5 == _zz_when_WaCounter_l12_5_1);
  always @(*) begin
    if(when_WaCounter_l12_5) begin
      channelMemReadAddr_valid = 1'b1;
    end else begin
      channelMemReadAddr_valid = 1'b0;
    end
    if(when_MaxPooling_l73) begin
      channelMemReadAddr_valid = 1'b0;
    end
  end

  assign when_MaxPooling_l44 = ((fsm_currentState & ShapeStateMachineEnum_COMPUTE) != 5'b00000);
  always @(*) begin
    if(when_MaxPooling_l44) begin
      sData_ready = 1'b1;
    end else begin
      sData_ready = 1'b0;
    end
  end

  assign fsm_computeEnd = (columnCnt_valid && channelCnt_valid);
  assign fsm_last = rowCnt_valid;
  assign sData_fire_5 = (sData_valid && sData_ready);
  assign when_WaCounter_l12_6 = (_zz_when_WaCounter_l12_6 == _zz_when_WaCounter_l12_6_1);
  always @(*) begin
    if(when_WaCounter_l12_6) begin
      rowMemWriteAddr_valid = 1'b1;
    end else begin
      rowMemWriteAddr_valid = 1'b0;
    end
    if(when_MaxPooling_l73) begin
      rowMemWriteAddr_valid = 1'b0;
    end
  end

  assign sData_fire_6 = (sData_valid && sData_ready);
  assign when_WaCounter_l12_7 = (_zz_when_WaCounter_l12_7 == _zz_when_WaCounter_l12_7_1);
  always @(*) begin
    if(when_WaCounter_l12_7) begin
      rowMemReadAddr_valid = 1'b1;
    end else begin
      rowMemReadAddr_valid = 1'b0;
    end
    if(when_MaxPooling_l73) begin
      rowMemReadAddr_valid = 1'b0;
    end
  end

  assign when_MaxPooling_l73 = ((fsm_currentState & ShapeStateMachineEnum_INIT) != 5'b00000);
  assign pix12_0 = _zz_pix12_0_1;
  assign pix12_1 = _zz_pix12_1_1;
  assign pix12_2 = _zz_pix12_2_1;
  assign pix12_3 = _zz_pix12_3_1;
  assign pix12_4 = _zz_pix12_4_1;
  assign pix12_5 = _zz_pix12_5_1;
  assign pix12_6 = _zz_pix12_6_1;
  assign pix12_7 = _zz_pix12_7_1;
  assign pix11_0 = _zz_pix11_0[7 : 0];
  assign pix11_1 = _zz_pix11_0[15 : 8];
  assign pix11_2 = _zz_pix11_0[23 : 16];
  assign pix11_3 = _zz_pix11_0[31 : 24];
  assign pix11_4 = _zz_pix11_0[39 : 32];
  assign pix11_5 = _zz_pix11_0[47 : 40];
  assign pix11_6 = _zz_pix11_0[55 : 48];
  assign pix11_7 = _zz_pix11_0[63 : 56];
  assign maxPix2_0 = dataTemp_regNext_regNext_0;
  assign maxPix2_1 = dataTemp_regNext_regNext_1;
  assign maxPix2_2 = dataTemp_regNext_regNext_2;
  assign maxPix2_3 = dataTemp_regNext_regNext_3;
  assign maxPix2_4 = dataTemp_regNext_regNext_4;
  assign maxPix2_5 = dataTemp_regNext_regNext_5;
  assign maxPix2_6 = dataTemp_regNext_regNext_6;
  assign maxPix2_7 = dataTemp_regNext_regNext_7;
  assign maxPix1_0 = _zz_maxPix1_0[7 : 0];
  assign maxPix1_1 = _zz_maxPix1_0[15 : 8];
  assign maxPix1_2 = _zz_maxPix1_0[23 : 16];
  assign maxPix1_3 = _zz_maxPix1_0[31 : 24];
  assign maxPix1_4 = _zz_maxPix1_0[39 : 32];
  assign maxPix1_5 = _zz_maxPix1_0[47 : 40];
  assign maxPix1_6 = _zz_maxPix1_0[55 : 48];
  assign maxPix1_7 = _zz_maxPix1_0[63 : 56];
  assign when_MaxPooling_l55 = (pix11_0 < pix12_0);
  assign dataTemp_0 = _zz_dataTemp_0;
  assign when_MaxPooling_l55_1 = (maxPix1_0 < maxPix2_0);
  assign dataOut_0 = _zz_dataOut_0;
  assign when_MaxPooling_l55_2 = (pix11_1 < pix12_1);
  assign dataTemp_1 = _zz_dataTemp_1;
  assign when_MaxPooling_l55_3 = (maxPix1_1 < maxPix2_1);
  assign dataOut_1 = _zz_dataOut_1;
  assign when_MaxPooling_l55_4 = (pix11_2 < pix12_2);
  assign dataTemp_2 = _zz_dataTemp_2;
  assign when_MaxPooling_l55_5 = (maxPix1_2 < maxPix2_2);
  assign dataOut_2 = _zz_dataOut_2;
  assign when_MaxPooling_l55_6 = (pix11_3 < pix12_3);
  assign dataTemp_3 = _zz_dataTemp_3;
  assign when_MaxPooling_l55_7 = (maxPix1_3 < maxPix2_3);
  assign dataOut_3 = _zz_dataOut_3;
  assign when_MaxPooling_l55_8 = (pix11_4 < pix12_4);
  assign dataTemp_4 = _zz_dataTemp_4;
  assign when_MaxPooling_l55_9 = (maxPix1_4 < maxPix2_4);
  assign dataOut_4 = _zz_dataOut_4;
  assign when_MaxPooling_l55_10 = (pix11_5 < pix12_5);
  assign dataTemp_5 = _zz_dataTemp_5;
  assign when_MaxPooling_l55_11 = (maxPix1_5 < maxPix2_5);
  assign dataOut_5 = _zz_dataOut_5;
  assign when_MaxPooling_l55_12 = (pix11_6 < pix12_6);
  assign dataTemp_6 = _zz_dataTemp_6;
  assign when_MaxPooling_l55_13 = (maxPix1_6 < maxPix2_6);
  assign dataOut_6 = _zz_dataOut_6;
  assign when_MaxPooling_l55_14 = (pix11_7 < pix12_7);
  assign dataTemp_7 = _zz_dataTemp_7;
  assign when_MaxPooling_l55_15 = (maxPix1_7 < maxPix2_7);
  assign dataOut_7 = _zz_dataOut_7;
  always @(*) begin
    mData_payload[7 : 0] = dataOut_regNext_0;
    mData_payload[15 : 8] = dataOut_regNext_1;
    mData_payload[23 : 16] = dataOut_regNext_2;
    mData_payload[31 : 24] = dataOut_regNext_3;
    mData_payload[39 : 32] = dataOut_regNext_4;
    mData_payload[47 : 40] = dataOut_regNext_5;
    mData_payload[55 : 48] = dataOut_regNext_6;
    mData_payload[63 : 56] = dataOut_regNext_7;
  end

  assign mData_valid = _zz_mData_valid_6;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_currentState <= ShapeStateMachineEnum_IDLE;
      initCount_count <= 3'b000;
      channelCnt_count <= 10'h0;
      columnCnt_count <= 9'h0;
      rowCnt_count <= 9'h0;
      channelMemWriteAddr_count <= 6'h0;
      channelMemReadAddr_count <= 6'h0;
      rowMemWriteAddr_count <= 11'h0;
      rowMemReadAddr_count <= 11'h0;
    end else begin
      fsm_currentState <= fsm_nextState;
      if(when_WaCounter_l17) begin
        initCount_count <= (initCount_count + 3'b001);
        if(initCount_valid) begin
          initCount_count <= 3'b000;
        end
      end
      if(sData_fire) begin
        channelCnt_count <= (channelCnt_count + 10'h001);
        if(channelCnt_valid) begin
          channelCnt_count <= 10'h0;
        end
      end
      if(when_WaCounter_l17_1) begin
        columnCnt_count <= (columnCnt_count + 9'h001);
        if(columnCnt_valid) begin
          columnCnt_count <= 9'h0;
        end
      end
      if(when_WaCounter_l17_2) begin
        rowCnt_count <= (rowCnt_count + 9'h001);
        if(rowCnt_valid) begin
          rowCnt_count <= 9'h0;
        end
      end
      if(when_WaCounter_l17_3) begin
        channelMemWriteAddr_count <= (channelMemWriteAddr_count + 6'h01);
        if(channelMemWriteAddr_valid) begin
          channelMemWriteAddr_count <= 6'h0;
        end
      end
      if(when_WaCounter_l17_4) begin
        channelMemReadAddr_count <= (channelMemReadAddr_count + 6'h01);
        if(channelMemReadAddr_valid) begin
          channelMemReadAddr_count <= 6'h0;
        end
      end
      if(_zz_1_regNext_regNext) begin
        rowMemWriteAddr_count <= (rowMemWriteAddr_count + 11'h001);
        if(rowMemWriteAddr_valid) begin
          rowMemWriteAddr_count <= 11'h0;
        end
      end
      if(_zz_3_regNext_regNext) begin
        rowMemReadAddr_count <= (rowMemReadAddr_count + 11'h001);
        if(rowMemReadAddr_valid) begin
          rowMemReadAddr_count <= 11'h0;
        end
      end
      if(when_MaxPooling_l73) begin
        channelCnt_count <= 10'h0;
        columnCnt_count <= 9'h0;
        rowCnt_count <= 9'h0;
        channelMemWriteAddr_count <= 6'h0;
        channelMemReadAddr_count <= 6'h0;
        rowMemWriteAddr_count <= 11'h0;
        rowMemReadAddr_count <= 11'h0;
      end
    end
  end

  always @(posedge clk) begin
    depth <= (colNumIn * computeChannelTimes);
    _zz_1 <= ((columnCnt_count[0] && (! rowCnt_count[0])) && sData_fire_5);
    _zz_1_regNext <= _zz_1;
    _zz_1_regNext_regNext <= _zz_1_regNext;
    _zz_2 <= (columnCnt_count[0] && (! rowCnt_count[0]));
    _zz_2_regNext <= _zz_2;
    _zz_2_regNext_regNext <= _zz_2_regNext;
    _zz_3 <= ((columnCnt_count[0] && rowCnt_count[0]) && sData_fire_6);
    _zz_3_regNext <= _zz_3;
    _zz_3_regNext_regNext <= _zz_3_regNext;
    _zz_pix12_0 <= sData_payload[7 : 0];
    _zz_pix12_1 <= sData_payload[15 : 8];
    _zz_pix12_2 <= sData_payload[23 : 16];
    _zz_pix12_3 <= sData_payload[31 : 24];
    _zz_pix12_4 <= sData_payload[39 : 32];
    _zz_pix12_5 <= sData_payload[47 : 40];
    _zz_pix12_6 <= sData_payload[55 : 48];
    _zz_pix12_7 <= sData_payload[63 : 56];
    _zz_pix12_0_1 <= _zz_pix12_0;
    _zz_pix12_1_1 <= _zz_pix12_1;
    _zz_pix12_2_1 <= _zz_pix12_2;
    _zz_pix12_3_1 <= _zz_pix12_3;
    _zz_pix12_4_1 <= _zz_pix12_4;
    _zz_pix12_5_1 <= _zz_pix12_5;
    _zz_pix12_6_1 <= _zz_pix12_6;
    _zz_pix12_7_1 <= _zz_pix12_7;
    _zz_pix11_0 <= _zz_channelMem_port1;
    dataTemp_regNext_0 <= dataTemp_0;
    dataTemp_regNext_1 <= dataTemp_1;
    dataTemp_regNext_2 <= dataTemp_2;
    dataTemp_regNext_3 <= dataTemp_3;
    dataTemp_regNext_4 <= dataTemp_4;
    dataTemp_regNext_5 <= dataTemp_5;
    dataTemp_regNext_6 <= dataTemp_6;
    dataTemp_regNext_7 <= dataTemp_7;
    dataTemp_regNext_regNext_0 <= dataTemp_regNext_0;
    dataTemp_regNext_regNext_1 <= dataTemp_regNext_1;
    dataTemp_regNext_regNext_2 <= dataTemp_regNext_2;
    dataTemp_regNext_regNext_3 <= dataTemp_regNext_3;
    dataTemp_regNext_regNext_4 <= dataTemp_regNext_4;
    dataTemp_regNext_regNext_5 <= dataTemp_regNext_5;
    dataTemp_regNext_regNext_6 <= dataTemp_regNext_6;
    dataTemp_regNext_regNext_7 <= dataTemp_regNext_7;
    _zz_maxPix1_0 <= _zz_rowMem_port1;
    if(when_MaxPooling_l55) begin
      _zz_dataTemp_0 <= pix12_0;
    end else begin
      _zz_dataTemp_0 <= pix11_0;
    end
    if(when_MaxPooling_l55_1) begin
      _zz_dataOut_0 <= maxPix2_0;
    end else begin
      _zz_dataOut_0 <= maxPix1_0;
    end
    if(when_MaxPooling_l55_2) begin
      _zz_dataTemp_1 <= pix12_1;
    end else begin
      _zz_dataTemp_1 <= pix11_1;
    end
    if(when_MaxPooling_l55_3) begin
      _zz_dataOut_1 <= maxPix2_1;
    end else begin
      _zz_dataOut_1 <= maxPix1_1;
    end
    if(when_MaxPooling_l55_4) begin
      _zz_dataTemp_2 <= pix12_2;
    end else begin
      _zz_dataTemp_2 <= pix11_2;
    end
    if(when_MaxPooling_l55_5) begin
      _zz_dataOut_2 <= maxPix2_2;
    end else begin
      _zz_dataOut_2 <= maxPix1_2;
    end
    if(when_MaxPooling_l55_6) begin
      _zz_dataTemp_3 <= pix12_3;
    end else begin
      _zz_dataTemp_3 <= pix11_3;
    end
    if(when_MaxPooling_l55_7) begin
      _zz_dataOut_3 <= maxPix2_3;
    end else begin
      _zz_dataOut_3 <= maxPix1_3;
    end
    if(when_MaxPooling_l55_8) begin
      _zz_dataTemp_4 <= pix12_4;
    end else begin
      _zz_dataTemp_4 <= pix11_4;
    end
    if(when_MaxPooling_l55_9) begin
      _zz_dataOut_4 <= maxPix2_4;
    end else begin
      _zz_dataOut_4 <= maxPix1_4;
    end
    if(when_MaxPooling_l55_10) begin
      _zz_dataTemp_5 <= pix12_5;
    end else begin
      _zz_dataTemp_5 <= pix11_5;
    end
    if(when_MaxPooling_l55_11) begin
      _zz_dataOut_5 <= maxPix2_5;
    end else begin
      _zz_dataOut_5 <= maxPix1_5;
    end
    if(when_MaxPooling_l55_12) begin
      _zz_dataTemp_6 <= pix12_6;
    end else begin
      _zz_dataTemp_6 <= pix11_6;
    end
    if(when_MaxPooling_l55_13) begin
      _zz_dataOut_6 <= maxPix2_6;
    end else begin
      _zz_dataOut_6 <= maxPix1_6;
    end
    if(when_MaxPooling_l55_14) begin
      _zz_dataTemp_7 <= pix12_7;
    end else begin
      _zz_dataTemp_7 <= pix11_7;
    end
    if(when_MaxPooling_l55_15) begin
      _zz_dataOut_7 <= maxPix2_7;
    end else begin
      _zz_dataOut_7 <= maxPix1_7;
    end
    dataOut_regNext_0 <= dataOut_0;
    dataOut_regNext_1 <= dataOut_1;
    dataOut_regNext_2 <= dataOut_2;
    dataOut_regNext_3 <= dataOut_3;
    dataOut_regNext_4 <= dataOut_4;
    dataOut_regNext_5 <= dataOut_5;
    dataOut_regNext_6 <= dataOut_6;
    dataOut_regNext_7 <= dataOut_7;
    _zz_mData_valid <= (rowCnt_count[0] && columnCnt_count[0]);
    _zz_mData_valid_1 <= _zz_mData_valid;
    _zz_mData_valid_2 <= _zz_mData_valid_1;
    _zz_mData_valid_3 <= _zz_mData_valid_2;
    _zz_mData_valid_4 <= _zz_mData_valid_3;
    _zz_mData_valid_5 <= _zz_mData_valid_4;
    _zz_mData_valid_6 <= _zz_mData_valid_5;
  end


endmodule

module Add (
  input               dataPort_start,
  input               dataPort_fifoReady,
  input               dataPort_sData_valid,
  output              dataPort_sData_ready,
  input      [63:0]   dataPort_sData_payload,
  output              dataPort_mData_valid,
  input               dataPort_mData_ready,
  output reg [63:0]   dataPort_mData_payload,
  input      [8:0]    dataPort_rowNumIn,
  input      [8:0]    dataPort_colNumIn,
  input      [9:0]    dataPort_channelIn,
  input      [31:0]   zero,
  input      [31:0]   zero1,
  input      [31:0]   scale,
  input      [31:0]   scale1,
  input               sData1_valid,
  output              sData1_ready,
  input      [63:0]   sData1_payload,
  input      [9:0]    channelIn1,
  input               clk,
  input               reset
);
  localparam AddMachineEnum_IDLE = 6'd1;
  localparam AddMachineEnum_INIT = 6'd2;
  localparam AddMachineEnum_FIFO_READY = 6'd4;
  localparam AddMachineEnum_DATA_READY = 6'd8;
  localparam AddMachineEnum_COMPUTE = 6'd16;
  localparam AddMachineEnum_LAST = 6'd32;

  reg                 mem1_io_pop_ready;
  reg                 mem2_io_pop_ready;
  wire       [63:0]   add1_dataIn;
  wire       [63:0]   add2_dataIn;
  wire                mem1_io_push_ready;
  wire                mem1_io_pop_valid;
  wire       [63:0]   mem1_io_pop_payload;
  wire       [11:0]   mem1_io_occupancy;
  wire       [11:0]   mem1_io_availability;
  wire                mem2_io_push_ready;
  wire                mem2_io_pop_valid;
  wire       [63:0]   mem2_io_pop_payload;
  wire       [11:0]   mem2_io_occupancy;
  wire       [11:0]   mem2_io_availability;
  wire       [31:0]   add1_dataOut_0;
  wire       [31:0]   add1_dataOut_1;
  wire       [31:0]   add1_dataOut_2;
  wire       [31:0]   add1_dataOut_3;
  wire       [31:0]   add1_dataOut_4;
  wire       [31:0]   add1_dataOut_5;
  wire       [31:0]   add1_dataOut_6;
  wire       [31:0]   add1_dataOut_7;
  wire       [31:0]   add2_dataOut_0;
  wire       [31:0]   add2_dataOut_1;
  wire       [31:0]   add2_dataOut_2;
  wire       [31:0]   add2_dataOut_3;
  wire       [31:0]   add2_dataOut_4;
  wire       [31:0]   add2_dataOut_5;
  wire       [31:0]   add2_dataOut_6;
  wire       [31:0]   add2_dataOut_7;
  wire       [63:0]   addScale1_dataOut_0;
  wire       [63:0]   addScale1_dataOut_1;
  wire       [63:0]   addScale1_dataOut_2;
  wire       [63:0]   addScale1_dataOut_3;
  wire       [63:0]   addScale1_dataOut_4;
  wire       [63:0]   addScale1_dataOut_5;
  wire       [63:0]   addScale1_dataOut_6;
  wire       [63:0]   addScale1_dataOut_7;
  wire       [63:0]   addScale2_dataOut_0;
  wire       [63:0]   addScale2_dataOut_1;
  wire       [63:0]   addScale2_dataOut_2;
  wire       [63:0]   addScale2_dataOut_3;
  wire       [63:0]   addScale2_dataOut_4;
  wire       [63:0]   addScale2_dataOut_5;
  wire       [63:0]   addScale2_dataOut_6;
  wire       [63:0]   addScale2_dataOut_7;
  wire       [63:0]   add_0_S;
  wire       [63:0]   add_1_S;
  wire       [63:0]   add_2_S;
  wire       [63:0]   add_3_S;
  wire       [63:0]   add_4_S;
  wire       [63:0]   add_5_S;
  wire       [63:0]   add_6_S;
  wire       [63:0]   add_7_S;
  wire       [9:0]    _zz_when_WaCounter_l12_1;
  wire       [6:0]    _zz_when_WaCounter_l12_1_1;
  wire       [8:0]    _zz_when_WaCounter_l12_2;
  wire       [8:0]    _zz_when_WaCounter_l12_3;
  wire       [15:0]   _zz_when_Add_l116;
  wire       [15:0]   _zz_when_Add_l116_1;
  wire       [31:0]   _zz__zz_dataPort_mData_payload;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_1;
  wire       [7:0]    _zz__zz_dataPort_mData_payload_1_1;
  wire       [31:0]   _zz_when_Add_l168;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_2;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_2_1;
  wire       [7:0]    _zz__zz_dataPort_mData_payload_3;
  wire       [31:0]   _zz_when_Add_l168_1;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_4;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_4_1;
  wire       [7:0]    _zz__zz_dataPort_mData_payload_5;
  wire       [31:0]   _zz_when_Add_l168_2;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_6;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_6_1;
  wire       [7:0]    _zz__zz_dataPort_mData_payload_7;
  wire       [31:0]   _zz_when_Add_l168_3;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_8;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_8_1;
  wire       [7:0]    _zz__zz_dataPort_mData_payload_9;
  wire       [31:0]   _zz_when_Add_l168_4;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_10;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_10_1;
  wire       [7:0]    _zz__zz_dataPort_mData_payload_11;
  wire       [31:0]   _zz_when_Add_l168_5;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_12;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_12_1;
  wire       [7:0]    _zz__zz_dataPort_mData_payload_13;
  wire       [31:0]   _zz_when_Add_l168_6;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_14;
  wire       [31:0]   _zz__zz_dataPort_mData_payload_14_1;
  wire       [7:0]    _zz__zz_dataPort_mData_payload_15;
  wire       [31:0]   _zz_when_Add_l168_7;
  wire                fsm_initEnd;
  wire                fsm_fifoReady;
  reg                 fsm_dataReady;
  wire                fsm_computeEnd;
  wire                fsm_last;
  reg        [5:0]    fsm_currentState;
  reg        [5:0]    fsm_nextState;
  wire                when_WaCounter_l17;
  reg        [2:0]    initCount_count;
  reg                 initCount_valid;
  wire                when_WaCounter_l12;
  wire       [6:0]    channelTimes;
  reg        [15:0]   cnt;
  wire                mem1_io_pop_fire;
  reg        [9:0]    channelCnt_count;
  reg                 channelCnt_valid;
  wire                when_WaCounter_l12_1;
  wire                mem1_io_pop_fire_1;
  wire                when_WaCounter_l17_1;
  reg        [8:0]    columnCnt_count;
  reg                 columnCnt_valid;
  wire                when_WaCounter_l12_2;
  wire                when_WaCounter_l17_2;
  reg        [8:0]    rowCnt_count;
  reg                 rowCnt_valid;
  wire                when_WaCounter_l12_3;
  wire                when_Add_l116;
  wire                when_Add_l121;
  wire       [63:0]   dataTemp_0;
  wire       [63:0]   dataTemp_1;
  wire       [63:0]   dataTemp_2;
  wire       [63:0]   dataTemp_3;
  wire       [63:0]   dataTemp_4;
  wire       [63:0]   dataTemp_5;
  wire       [63:0]   dataTemp_6;
  wire       [63:0]   dataTemp_7;
  reg        [31:0]   _zz_dataPort_mData_payload;
  wire                when_Add_l159;
  reg        [7:0]    _zz_dataPort_mData_payload_1;
  wire                when_Add_l166;
  wire                when_Add_l168;
  reg        [31:0]   _zz_dataPort_mData_payload_2;
  wire                when_Add_l159_1;
  reg        [7:0]    _zz_dataPort_mData_payload_3;
  wire                when_Add_l166_1;
  wire                when_Add_l168_1;
  reg        [31:0]   _zz_dataPort_mData_payload_4;
  wire                when_Add_l159_2;
  reg        [7:0]    _zz_dataPort_mData_payload_5;
  wire                when_Add_l166_2;
  wire                when_Add_l168_2;
  reg        [31:0]   _zz_dataPort_mData_payload_6;
  wire                when_Add_l159_3;
  reg        [7:0]    _zz_dataPort_mData_payload_7;
  wire                when_Add_l166_3;
  wire                when_Add_l168_3;
  reg        [31:0]   _zz_dataPort_mData_payload_8;
  wire                when_Add_l159_4;
  reg        [7:0]    _zz_dataPort_mData_payload_9;
  wire                when_Add_l166_4;
  wire                when_Add_l168_4;
  reg        [31:0]   _zz_dataPort_mData_payload_10;
  wire                when_Add_l159_5;
  reg        [7:0]    _zz_dataPort_mData_payload_11;
  wire                when_Add_l166_5;
  wire                when_Add_l168_5;
  reg        [31:0]   _zz_dataPort_mData_payload_12;
  wire                when_Add_l159_6;
  reg        [7:0]    _zz_dataPort_mData_payload_13;
  wire                when_Add_l166_6;
  wire                when_Add_l168_6;
  reg        [31:0]   _zz_dataPort_mData_payload_14;
  wire                when_Add_l159_7;
  reg        [7:0]    _zz_dataPort_mData_payload_15;
  wire                when_Add_l166_7;
  wire                when_Add_l168_7;
  wire                mem1_io_pop_fire_2;
  reg                 mem1_io_pop_fire_2_delay_1;
  reg                 mem1_io_pop_fire_2_delay_2;
  reg                 mem1_io_pop_fire_2_delay_3;
  reg                 mem1_io_pop_fire_2_delay_4;
  reg                 mem1_io_pop_fire_2_delay_5;
  reg                 mem1_io_pop_fire_2_delay_6;
  reg                 mem1_io_pop_fire_2_delay_7;
  reg                 mem1_io_pop_fire_2_delay_8;
  reg                 mem1_io_pop_fire_2_delay_9;
  reg                 mem1_io_pop_fire_2_delay_10;
  reg                 mem1_io_pop_fire_2_delay_11;
  reg                 mem1_io_pop_fire_2_delay_12;
  reg                 mem1_io_pop_fire_2_delay_13;
  reg                 mem1_io_pop_fire_2_delay_14;
  reg                 mem1_io_pop_fire_2_delay_15;
  `ifndef SYNTHESIS
  reg [79:0] fsm_currentState_string;
  reg [79:0] fsm_nextState_string;
  `endif


  assign _zz_when_WaCounter_l12_1_1 = (channelTimes - 7'h01);
  assign _zz_when_WaCounter_l12_1 = {3'd0, _zz_when_WaCounter_l12_1_1};
  assign _zz_when_WaCounter_l12_2 = (dataPort_colNumIn - 9'h001);
  assign _zz_when_WaCounter_l12_3 = (dataPort_rowNumIn - 9'h001);
  assign _zz_when_Add_l116 = {4'd0, mem1_io_occupancy};
  assign _zz_when_Add_l116_1 = {4'd0, mem2_io_occupancy};
  assign _zz__zz_dataPort_mData_payload = dataTemp_0[63 : 32];
  assign _zz__zz_dataPort_mData_payload_1 = 32'h00000001;
  assign _zz__zz_dataPort_mData_payload_1_1 = _zz_dataPort_mData_payload[7 : 0];
  assign _zz_when_Add_l168 = 32'h000000ff;
  assign _zz__zz_dataPort_mData_payload_2 = dataTemp_1[63 : 32];
  assign _zz__zz_dataPort_mData_payload_2_1 = 32'h00000001;
  assign _zz__zz_dataPort_mData_payload_3 = _zz_dataPort_mData_payload_2[7 : 0];
  assign _zz_when_Add_l168_1 = 32'h000000ff;
  assign _zz__zz_dataPort_mData_payload_4 = dataTemp_2[63 : 32];
  assign _zz__zz_dataPort_mData_payload_4_1 = 32'h00000001;
  assign _zz__zz_dataPort_mData_payload_5 = _zz_dataPort_mData_payload_4[7 : 0];
  assign _zz_when_Add_l168_2 = 32'h000000ff;
  assign _zz__zz_dataPort_mData_payload_6 = dataTemp_3[63 : 32];
  assign _zz__zz_dataPort_mData_payload_6_1 = 32'h00000001;
  assign _zz__zz_dataPort_mData_payload_7 = _zz_dataPort_mData_payload_6[7 : 0];
  assign _zz_when_Add_l168_3 = 32'h000000ff;
  assign _zz__zz_dataPort_mData_payload_8 = dataTemp_4[63 : 32];
  assign _zz__zz_dataPort_mData_payload_8_1 = 32'h00000001;
  assign _zz__zz_dataPort_mData_payload_9 = _zz_dataPort_mData_payload_8[7 : 0];
  assign _zz_when_Add_l168_4 = 32'h000000ff;
  assign _zz__zz_dataPort_mData_payload_10 = dataTemp_5[63 : 32];
  assign _zz__zz_dataPort_mData_payload_10_1 = 32'h00000001;
  assign _zz__zz_dataPort_mData_payload_11 = _zz_dataPort_mData_payload_10[7 : 0];
  assign _zz_when_Add_l168_5 = 32'h000000ff;
  assign _zz__zz_dataPort_mData_payload_12 = dataTemp_6[63 : 32];
  assign _zz__zz_dataPort_mData_payload_12_1 = 32'h00000001;
  assign _zz__zz_dataPort_mData_payload_13 = _zz_dataPort_mData_payload_12[7 : 0];
  assign _zz_when_Add_l168_6 = 32'h000000ff;
  assign _zz__zz_dataPort_mData_payload_14 = dataTemp_7[63 : 32];
  assign _zz__zz_dataPort_mData_payload_14_1 = 32'h00000001;
  assign _zz__zz_dataPort_mData_payload_15 = _zz_dataPort_mData_payload_14[7 : 0];
  assign _zz_when_Add_l168_7 = 32'h000000ff;
  StreamFifo mem1 (
    .io_push_valid   (dataPort_sData_valid        ), //i
    .io_push_ready   (mem1_io_push_ready          ), //o
    .io_push_payload (dataPort_sData_payload[63:0]), //i
    .io_pop_valid    (mem1_io_pop_valid           ), //o
    .io_pop_ready    (mem1_io_pop_ready           ), //i
    .io_pop_payload  (mem1_io_pop_payload[63:0]   ), //o
    .io_flush        (1'b0                        ), //i
    .io_occupancy    (mem1_io_occupancy[11:0]     ), //o
    .io_availability (mem1_io_availability[11:0]  ), //o
    .clk             (clk                         ), //i
    .reset           (reset                       )  //i
  );
  StreamFifo mem2 (
    .io_push_valid   (sData1_valid              ), //i
    .io_push_ready   (mem2_io_push_ready        ), //o
    .io_push_payload (sData1_payload[63:0]      ), //i
    .io_pop_valid    (mem2_io_pop_valid         ), //o
    .io_pop_ready    (mem2_io_pop_ready         ), //i
    .io_pop_payload  (mem2_io_pop_payload[63:0] ), //o
    .io_flush        (1'b0                      ), //i
    .io_occupancy    (mem2_io_occupancy[11:0]   ), //o
    .io_availability (mem2_io_availability[11:0]), //o
    .clk             (clk                       ), //i
    .reset           (reset                     )  //i
  );
  AddAdd_1 add1 (
    .dataIn    (add1_dataIn[63:0]   ), //i
    .zero      (zero[31:0]          ), //i
    .dataOut_0 (add1_dataOut_0[31:0]), //o
    .dataOut_1 (add1_dataOut_1[31:0]), //o
    .dataOut_2 (add1_dataOut_2[31:0]), //o
    .dataOut_3 (add1_dataOut_3[31:0]), //o
    .dataOut_4 (add1_dataOut_4[31:0]), //o
    .dataOut_5 (add1_dataOut_5[31:0]), //o
    .dataOut_6 (add1_dataOut_6[31:0]), //o
    .dataOut_7 (add1_dataOut_7[31:0]), //o
    .clk       (clk                 )  //i
  );
  AddAdd_1 add2 (
    .dataIn    (add2_dataIn[63:0]   ), //i
    .zero      (zero1[31:0]         ), //i
    .dataOut_0 (add2_dataOut_0[31:0]), //o
    .dataOut_1 (add2_dataOut_1[31:0]), //o
    .dataOut_2 (add2_dataOut_2[31:0]), //o
    .dataOut_3 (add2_dataOut_3[31:0]), //o
    .dataOut_4 (add2_dataOut_4[31:0]), //o
    .dataOut_5 (add2_dataOut_5[31:0]), //o
    .dataOut_6 (add2_dataOut_6[31:0]), //o
    .dataOut_7 (add2_dataOut_7[31:0]), //o
    .clk       (clk                 )  //i
  );
  AddScale addScale1 (
    .dataIn_0  (add1_dataOut_0[31:0]     ), //i
    .dataIn_1  (add1_dataOut_1[31:0]     ), //i
    .dataIn_2  (add1_dataOut_2[31:0]     ), //i
    .dataIn_3  (add1_dataOut_3[31:0]     ), //i
    .dataIn_4  (add1_dataOut_4[31:0]     ), //i
    .dataIn_5  (add1_dataOut_5[31:0]     ), //i
    .dataIn_6  (add1_dataOut_6[31:0]     ), //i
    .dataIn_7  (add1_dataOut_7[31:0]     ), //i
    .scale     (scale[31:0]              ), //i
    .dataOut_0 (addScale1_dataOut_0[63:0]), //o
    .dataOut_1 (addScale1_dataOut_1[63:0]), //o
    .dataOut_2 (addScale1_dataOut_2[63:0]), //o
    .dataOut_3 (addScale1_dataOut_3[63:0]), //o
    .dataOut_4 (addScale1_dataOut_4[63:0]), //o
    .dataOut_5 (addScale1_dataOut_5[63:0]), //o
    .dataOut_6 (addScale1_dataOut_6[63:0]), //o
    .dataOut_7 (addScale1_dataOut_7[63:0]), //o
    .clk       (clk                      )  //i
  );
  AddScale addScale2 (
    .dataIn_0  (add2_dataOut_0[31:0]     ), //i
    .dataIn_1  (add2_dataOut_1[31:0]     ), //i
    .dataIn_2  (add2_dataOut_2[31:0]     ), //i
    .dataIn_3  (add2_dataOut_3[31:0]     ), //i
    .dataIn_4  (add2_dataOut_4[31:0]     ), //i
    .dataIn_5  (add2_dataOut_5[31:0]     ), //i
    .dataIn_6  (add2_dataOut_6[31:0]     ), //i
    .dataIn_7  (add2_dataOut_7[31:0]     ), //i
    .scale     (scale1[31:0]             ), //i
    .dataOut_0 (addScale2_dataOut_0[63:0]), //o
    .dataOut_1 (addScale2_dataOut_1[63:0]), //o
    .dataOut_2 (addScale2_dataOut_2[63:0]), //o
    .dataOut_3 (addScale2_dataOut_3[63:0]), //o
    .dataOut_4 (addScale2_dataOut_4[63:0]), //o
    .dataOut_5 (addScale2_dataOut_5[63:0]), //o
    .dataOut_6 (addScale2_dataOut_6[63:0]), //o
    .dataOut_7 (addScale2_dataOut_7[63:0]), //o
    .clk       (clk                      )  //i
  );
  addAdd64_64 add_0 (
    .A   (addScale1_dataOut_0[63:0]), //i
    .B   (addScale2_dataOut_0[63:0]), //i
    .S   (add_0_S[63:0]            ), //o
    .CLK (clk                      )  //i
  );
  addAdd64_64 add_1 (
    .A   (addScale1_dataOut_1[63:0]), //i
    .B   (addScale2_dataOut_1[63:0]), //i
    .S   (add_1_S[63:0]            ), //o
    .CLK (clk                      )  //i
  );
  addAdd64_64 add_2 (
    .A   (addScale1_dataOut_2[63:0]), //i
    .B   (addScale2_dataOut_2[63:0]), //i
    .S   (add_2_S[63:0]            ), //o
    .CLK (clk                      )  //i
  );
  addAdd64_64 add_3 (
    .A   (addScale1_dataOut_3[63:0]), //i
    .B   (addScale2_dataOut_3[63:0]), //i
    .S   (add_3_S[63:0]            ), //o
    .CLK (clk                      )  //i
  );
  addAdd64_64 add_4 (
    .A   (addScale1_dataOut_4[63:0]), //i
    .B   (addScale2_dataOut_4[63:0]), //i
    .S   (add_4_S[63:0]            ), //o
    .CLK (clk                      )  //i
  );
  addAdd64_64 add_5 (
    .A   (addScale1_dataOut_5[63:0]), //i
    .B   (addScale2_dataOut_5[63:0]), //i
    .S   (add_5_S[63:0]            ), //o
    .CLK (clk                      )  //i
  );
  addAdd64_64 add_6 (
    .A   (addScale1_dataOut_6[63:0]), //i
    .B   (addScale2_dataOut_6[63:0]), //i
    .S   (add_6_S[63:0]            ), //o
    .CLK (clk                      )  //i
  );
  addAdd64_64 add_7 (
    .A   (addScale1_dataOut_7[63:0]), //i
    .B   (addScale2_dataOut_7[63:0]), //i
    .S   (add_7_S[63:0]            ), //o
    .CLK (clk                      )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_currentState)
      AddMachineEnum_IDLE : fsm_currentState_string = "IDLE      ";
      AddMachineEnum_INIT : fsm_currentState_string = "INIT      ";
      AddMachineEnum_FIFO_READY : fsm_currentState_string = "FIFO_READY";
      AddMachineEnum_DATA_READY : fsm_currentState_string = "DATA_READY";
      AddMachineEnum_COMPUTE : fsm_currentState_string = "COMPUTE   ";
      AddMachineEnum_LAST : fsm_currentState_string = "LAST      ";
      default : fsm_currentState_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_nextState)
      AddMachineEnum_IDLE : fsm_nextState_string = "IDLE      ";
      AddMachineEnum_INIT : fsm_nextState_string = "INIT      ";
      AddMachineEnum_FIFO_READY : fsm_nextState_string = "FIFO_READY";
      AddMachineEnum_DATA_READY : fsm_nextState_string = "DATA_READY";
      AddMachineEnum_COMPUTE : fsm_nextState_string = "COMPUTE   ";
      AddMachineEnum_LAST : fsm_nextState_string = "LAST      ";
      default : fsm_nextState_string = "??????????";
    endcase
  end
  `endif

  always @(*) begin
    (* parallel_case *)
    case(1) // synthesis parallel_case
      (((fsm_currentState) & AddMachineEnum_IDLE) == AddMachineEnum_IDLE) : begin
        if(dataPort_start) begin
          fsm_nextState = AddMachineEnum_INIT;
        end else begin
          fsm_nextState = AddMachineEnum_IDLE;
        end
      end
      (((fsm_currentState) & AddMachineEnum_INIT) == AddMachineEnum_INIT) : begin
        if(fsm_initEnd) begin
          fsm_nextState = AddMachineEnum_FIFO_READY;
        end else begin
          fsm_nextState = AddMachineEnum_INIT;
        end
      end
      (((fsm_currentState) & AddMachineEnum_FIFO_READY) == AddMachineEnum_FIFO_READY) : begin
        if(fsm_fifoReady) begin
          fsm_nextState = AddMachineEnum_DATA_READY;
        end else begin
          fsm_nextState = AddMachineEnum_FIFO_READY;
        end
      end
      (((fsm_currentState) & AddMachineEnum_DATA_READY) == AddMachineEnum_DATA_READY) : begin
        if(fsm_dataReady) begin
          fsm_nextState = AddMachineEnum_COMPUTE;
        end else begin
          fsm_nextState = AddMachineEnum_DATA_READY;
        end
      end
      (((fsm_currentState) & AddMachineEnum_COMPUTE) == AddMachineEnum_COMPUTE) : begin
        if(fsm_computeEnd) begin
          fsm_nextState = AddMachineEnum_LAST;
        end else begin
          fsm_nextState = AddMachineEnum_COMPUTE;
        end
      end
      default : begin
        if(fsm_last) begin
          fsm_nextState = AddMachineEnum_IDLE;
        end else begin
          fsm_nextState = AddMachineEnum_FIFO_READY;
        end
      end
    endcase
  end

  assign fsm_fifoReady = dataPort_fifoReady;
  assign when_WaCounter_l17 = ((fsm_currentState & AddMachineEnum_INIT) != 6'b000000);
  assign when_WaCounter_l12 = (initCount_count == 3'b101);
  always @(*) begin
    if(when_WaCounter_l12) begin
      initCount_valid = 1'b1;
    end else begin
      initCount_valid = 1'b0;
    end
  end

  assign fsm_initEnd = initCount_valid;
  assign channelTimes = (dataPort_channelIn >>> 3);
  assign mem1_io_pop_fire = (mem1_io_pop_valid && mem1_io_pop_ready);
  assign when_WaCounter_l12_1 = (channelCnt_count == _zz_when_WaCounter_l12_1);
  always @(*) begin
    if(when_WaCounter_l12_1) begin
      channelCnt_valid = 1'b1;
    end else begin
      channelCnt_valid = 1'b0;
    end
  end

  assign mem1_io_pop_fire_1 = (mem1_io_pop_valid && mem1_io_pop_ready);
  assign when_WaCounter_l17_1 = (channelCnt_valid && mem1_io_pop_fire_1);
  assign when_WaCounter_l12_2 = (columnCnt_count == _zz_when_WaCounter_l12_2);
  always @(*) begin
    if(when_WaCounter_l12_2) begin
      columnCnt_valid = 1'b1;
    end else begin
      columnCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l17_2 = ((fsm_currentState & AddMachineEnum_LAST) != 6'b000000);
  assign when_WaCounter_l12_3 = (rowCnt_count == _zz_when_WaCounter_l12_3);
  always @(*) begin
    if(when_WaCounter_l12_3) begin
      rowCnt_valid = 1'b1;
    end else begin
      rowCnt_valid = 1'b0;
    end
  end

  assign fsm_computeEnd = (channelCnt_valid && columnCnt_valid);
  assign fsm_last = rowCnt_valid;
  assign dataPort_sData_ready = mem1_io_push_ready;
  assign sData1_ready = mem2_io_push_ready;
  assign when_Add_l116 = ((cnt <= _zz_when_Add_l116) && (cnt <= _zz_when_Add_l116_1));
  always @(*) begin
    if(when_Add_l116) begin
      fsm_dataReady = 1'b1;
    end else begin
      fsm_dataReady = 1'b0;
    end
  end

  assign when_Add_l121 = ((fsm_currentState & AddMachineEnum_COMPUTE) != 6'b000000);
  always @(*) begin
    if(when_Add_l121) begin
      mem1_io_pop_ready = 1'b1;
    end else begin
      mem1_io_pop_ready = 1'b0;
    end
  end

  always @(*) begin
    if(when_Add_l121) begin
      mem2_io_pop_ready = 1'b1;
    end else begin
      mem2_io_pop_ready = 1'b0;
    end
  end

  assign add1_dataIn = mem1_io_pop_payload;
  assign add2_dataIn = mem2_io_pop_payload;
  assign dataTemp_0 = add_0_S;
  assign dataTemp_1 = add_1_S;
  assign dataTemp_2 = add_2_S;
  assign dataTemp_3 = add_3_S;
  assign dataTemp_4 = add_4_S;
  assign dataTemp_5 = add_5_S;
  assign dataTemp_6 = add_6_S;
  assign dataTemp_7 = add_7_S;
  assign when_Add_l159 = dataTemp_0[31];
  assign when_Add_l166 = _zz_dataPort_mData_payload[31];
  assign when_Add_l168 = ($signed(_zz_when_Add_l168) < $signed(_zz_dataPort_mData_payload));
  always @(*) begin
    dataPort_mData_payload[7 : 0] = _zz_dataPort_mData_payload_1;
    dataPort_mData_payload[15 : 8] = _zz_dataPort_mData_payload_3;
    dataPort_mData_payload[23 : 16] = _zz_dataPort_mData_payload_5;
    dataPort_mData_payload[31 : 24] = _zz_dataPort_mData_payload_7;
    dataPort_mData_payload[39 : 32] = _zz_dataPort_mData_payload_9;
    dataPort_mData_payload[47 : 40] = _zz_dataPort_mData_payload_11;
    dataPort_mData_payload[55 : 48] = _zz_dataPort_mData_payload_13;
    dataPort_mData_payload[63 : 56] = _zz_dataPort_mData_payload_15;
  end

  assign when_Add_l159_1 = dataTemp_1[31];
  assign when_Add_l166_1 = _zz_dataPort_mData_payload_2[31];
  assign when_Add_l168_1 = ($signed(_zz_when_Add_l168_1) < $signed(_zz_dataPort_mData_payload_2));
  assign when_Add_l159_2 = dataTemp_2[31];
  assign when_Add_l166_2 = _zz_dataPort_mData_payload_4[31];
  assign when_Add_l168_2 = ($signed(_zz_when_Add_l168_2) < $signed(_zz_dataPort_mData_payload_4));
  assign when_Add_l159_3 = dataTemp_3[31];
  assign when_Add_l166_3 = _zz_dataPort_mData_payload_6[31];
  assign when_Add_l168_3 = ($signed(_zz_when_Add_l168_3) < $signed(_zz_dataPort_mData_payload_6));
  assign when_Add_l159_4 = dataTemp_4[31];
  assign when_Add_l166_4 = _zz_dataPort_mData_payload_8[31];
  assign when_Add_l168_4 = ($signed(_zz_when_Add_l168_4) < $signed(_zz_dataPort_mData_payload_8));
  assign when_Add_l159_5 = dataTemp_5[31];
  assign when_Add_l166_5 = _zz_dataPort_mData_payload_10[31];
  assign when_Add_l168_5 = ($signed(_zz_when_Add_l168_5) < $signed(_zz_dataPort_mData_payload_10));
  assign when_Add_l159_6 = dataTemp_6[31];
  assign when_Add_l166_6 = _zz_dataPort_mData_payload_12[31];
  assign when_Add_l168_6 = ($signed(_zz_when_Add_l168_6) < $signed(_zz_dataPort_mData_payload_12));
  assign when_Add_l159_7 = dataTemp_7[31];
  assign when_Add_l166_7 = _zz_dataPort_mData_payload_14[31];
  assign when_Add_l168_7 = ($signed(_zz_when_Add_l168_7) < $signed(_zz_dataPort_mData_payload_14));
  assign mem1_io_pop_fire_2 = (mem1_io_pop_valid && mem1_io_pop_ready);
  assign dataPort_mData_valid = mem1_io_pop_fire_2_delay_15;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_currentState <= AddMachineEnum_IDLE;
      initCount_count <= 3'b000;
      channelCnt_count <= 10'h0;
      columnCnt_count <= 9'h0;
      rowCnt_count <= 9'h0;
    end else begin
      fsm_currentState <= fsm_nextState;
      if(when_WaCounter_l17) begin
        initCount_count <= (initCount_count + 3'b001);
        if(initCount_valid) begin
          initCount_count <= 3'b000;
        end
      end
      if(mem1_io_pop_fire) begin
        channelCnt_count <= (channelCnt_count + 10'h001);
        if(channelCnt_valid) begin
          channelCnt_count <= 10'h0;
        end
      end
      if(when_WaCounter_l17_1) begin
        columnCnt_count <= (columnCnt_count + 9'h001);
        if(columnCnt_valid) begin
          columnCnt_count <= 9'h0;
        end
      end
      if(when_WaCounter_l17_2) begin
        rowCnt_count <= (rowCnt_count + 9'h001);
        if(rowCnt_valid) begin
          rowCnt_count <= 9'h0;
        end
      end
    end
  end

  always @(posedge clk) begin
    cnt <= (channelTimes * dataPort_colNumIn);
    if(when_Add_l159) begin
      _zz_dataPort_mData_payload <= ($signed(_zz__zz_dataPort_mData_payload) + $signed(_zz__zz_dataPort_mData_payload_1));
    end else begin
      _zz_dataPort_mData_payload <= dataTemp_0[63 : 32];
    end
    if(when_Add_l166) begin
      _zz_dataPort_mData_payload_1 <= 8'h0;
    end else begin
      if(when_Add_l168) begin
        _zz_dataPort_mData_payload_1 <= 8'hff;
      end else begin
        _zz_dataPort_mData_payload_1 <= _zz__zz_dataPort_mData_payload_1_1;
      end
    end
    if(when_Add_l159_1) begin
      _zz_dataPort_mData_payload_2 <= ($signed(_zz__zz_dataPort_mData_payload_2) + $signed(_zz__zz_dataPort_mData_payload_2_1));
    end else begin
      _zz_dataPort_mData_payload_2 <= dataTemp_1[63 : 32];
    end
    if(when_Add_l166_1) begin
      _zz_dataPort_mData_payload_3 <= 8'h0;
    end else begin
      if(when_Add_l168_1) begin
        _zz_dataPort_mData_payload_3 <= 8'hff;
      end else begin
        _zz_dataPort_mData_payload_3 <= _zz__zz_dataPort_mData_payload_3;
      end
    end
    if(when_Add_l159_2) begin
      _zz_dataPort_mData_payload_4 <= ($signed(_zz__zz_dataPort_mData_payload_4) + $signed(_zz__zz_dataPort_mData_payload_4_1));
    end else begin
      _zz_dataPort_mData_payload_4 <= dataTemp_2[63 : 32];
    end
    if(when_Add_l166_2) begin
      _zz_dataPort_mData_payload_5 <= 8'h0;
    end else begin
      if(when_Add_l168_2) begin
        _zz_dataPort_mData_payload_5 <= 8'hff;
      end else begin
        _zz_dataPort_mData_payload_5 <= _zz__zz_dataPort_mData_payload_5;
      end
    end
    if(when_Add_l159_3) begin
      _zz_dataPort_mData_payload_6 <= ($signed(_zz__zz_dataPort_mData_payload_6) + $signed(_zz__zz_dataPort_mData_payload_6_1));
    end else begin
      _zz_dataPort_mData_payload_6 <= dataTemp_3[63 : 32];
    end
    if(when_Add_l166_3) begin
      _zz_dataPort_mData_payload_7 <= 8'h0;
    end else begin
      if(when_Add_l168_3) begin
        _zz_dataPort_mData_payload_7 <= 8'hff;
      end else begin
        _zz_dataPort_mData_payload_7 <= _zz__zz_dataPort_mData_payload_7;
      end
    end
    if(when_Add_l159_4) begin
      _zz_dataPort_mData_payload_8 <= ($signed(_zz__zz_dataPort_mData_payload_8) + $signed(_zz__zz_dataPort_mData_payload_8_1));
    end else begin
      _zz_dataPort_mData_payload_8 <= dataTemp_4[63 : 32];
    end
    if(when_Add_l166_4) begin
      _zz_dataPort_mData_payload_9 <= 8'h0;
    end else begin
      if(when_Add_l168_4) begin
        _zz_dataPort_mData_payload_9 <= 8'hff;
      end else begin
        _zz_dataPort_mData_payload_9 <= _zz__zz_dataPort_mData_payload_9;
      end
    end
    if(when_Add_l159_5) begin
      _zz_dataPort_mData_payload_10 <= ($signed(_zz__zz_dataPort_mData_payload_10) + $signed(_zz__zz_dataPort_mData_payload_10_1));
    end else begin
      _zz_dataPort_mData_payload_10 <= dataTemp_5[63 : 32];
    end
    if(when_Add_l166_5) begin
      _zz_dataPort_mData_payload_11 <= 8'h0;
    end else begin
      if(when_Add_l168_5) begin
        _zz_dataPort_mData_payload_11 <= 8'hff;
      end else begin
        _zz_dataPort_mData_payload_11 <= _zz__zz_dataPort_mData_payload_11;
      end
    end
    if(when_Add_l159_6) begin
      _zz_dataPort_mData_payload_12 <= ($signed(_zz__zz_dataPort_mData_payload_12) + $signed(_zz__zz_dataPort_mData_payload_12_1));
    end else begin
      _zz_dataPort_mData_payload_12 <= dataTemp_6[63 : 32];
    end
    if(when_Add_l166_6) begin
      _zz_dataPort_mData_payload_13 <= 8'h0;
    end else begin
      if(when_Add_l168_6) begin
        _zz_dataPort_mData_payload_13 <= 8'hff;
      end else begin
        _zz_dataPort_mData_payload_13 <= _zz__zz_dataPort_mData_payload_13;
      end
    end
    if(when_Add_l159_7) begin
      _zz_dataPort_mData_payload_14 <= ($signed(_zz__zz_dataPort_mData_payload_14) + $signed(_zz__zz_dataPort_mData_payload_14_1));
    end else begin
      _zz_dataPort_mData_payload_14 <= dataTemp_7[63 : 32];
    end
    if(when_Add_l166_7) begin
      _zz_dataPort_mData_payload_15 <= 8'h0;
    end else begin
      if(when_Add_l168_7) begin
        _zz_dataPort_mData_payload_15 <= 8'hff;
      end else begin
        _zz_dataPort_mData_payload_15 <= _zz__zz_dataPort_mData_payload_15;
      end
    end
    mem1_io_pop_fire_2_delay_1 <= mem1_io_pop_fire_2;
    mem1_io_pop_fire_2_delay_2 <= mem1_io_pop_fire_2_delay_1;
    mem1_io_pop_fire_2_delay_3 <= mem1_io_pop_fire_2_delay_2;
    mem1_io_pop_fire_2_delay_4 <= mem1_io_pop_fire_2_delay_3;
    mem1_io_pop_fire_2_delay_5 <= mem1_io_pop_fire_2_delay_4;
    mem1_io_pop_fire_2_delay_6 <= mem1_io_pop_fire_2_delay_5;
    mem1_io_pop_fire_2_delay_7 <= mem1_io_pop_fire_2_delay_6;
    mem1_io_pop_fire_2_delay_8 <= mem1_io_pop_fire_2_delay_7;
    mem1_io_pop_fire_2_delay_9 <= mem1_io_pop_fire_2_delay_8;
    mem1_io_pop_fire_2_delay_10 <= mem1_io_pop_fire_2_delay_9;
    mem1_io_pop_fire_2_delay_11 <= mem1_io_pop_fire_2_delay_10;
    mem1_io_pop_fire_2_delay_12 <= mem1_io_pop_fire_2_delay_11;
    mem1_io_pop_fire_2_delay_13 <= mem1_io_pop_fire_2_delay_12;
    mem1_io_pop_fire_2_delay_14 <= mem1_io_pop_fire_2_delay_13;
    mem1_io_pop_fire_2_delay_15 <= mem1_io_pop_fire_2_delay_14;
  end


endmodule

module Concat (
  input               dataPort_start,
  input               dataPort_fifoReady,
  input               dataPort_sData_valid,
  output reg          dataPort_sData_ready,
  input      [63:0]   dataPort_sData_payload,
  output              dataPort_mData_valid,
  input               dataPort_mData_ready,
  output reg [63:0]   dataPort_mData_payload,
  input      [8:0]    dataPort_rowNumIn,
  input      [8:0]    dataPort_colNumIn,
  input      [9:0]    dataPort_channelIn,
  input      [31:0]   zero,
  input      [31:0]   zero1,
  input      [31:0]   scale,
  input      [31:0]   scale1,
  input               sData1_valid,
  output reg          sData1_ready,
  input      [63:0]   sData1_payload,
  input      [9:0]    channelIn1,
  input               clk,
  input               reset
);
  localparam ShapeStateMachineEnum_IDLE = 5'd1;
  localparam ShapeStateMachineEnum_INIT = 5'd2;
  localparam ShapeStateMachineEnum_FIFO_READY = 5'd4;
  localparam ShapeStateMachineEnum_COMPUTE = 5'd8;
  localparam ShapeStateMachineEnum_LAST = 5'd16;

  reg        [63:0]   concatZero_1_dataIn;
  reg        [31:0]   concatZero_1_zero;
  wire       [31:0]   concatZero_1_dataOut_0;
  wire       [31:0]   concatZero_1_dataOut_1;
  wire       [31:0]   concatZero_1_dataOut_2;
  wire       [31:0]   concatZero_1_dataOut_3;
  wire       [31:0]   concatZero_1_dataOut_4;
  wire       [31:0]   concatZero_1_dataOut_5;
  wire       [31:0]   concatZero_1_dataOut_6;
  wire       [31:0]   concatZero_1_dataOut_7;
  wire       [7:0]    concatScale_1_dataOut_0;
  wire       [7:0]    concatScale_1_dataOut_1;
  wire       [7:0]    concatScale_1_dataOut_2;
  wire       [7:0]    concatScale_1_dataOut_3;
  wire       [7:0]    concatScale_1_dataOut_4;
  wire       [7:0]    concatScale_1_dataOut_5;
  wire       [7:0]    concatScale_1_dataOut_6;
  wire       [7:0]    concatScale_1_dataOut_7;
  wire       [6:0]    _zz_when_WaCounter_l12;
  wire       [8:0]    _zz_when_WaCounter_l12_1;
  wire       [8:0]    _zz_when_WaCounter_l12_2;
  wire                fsm_initEnd;
  wire                fsm_fifoReady;
  wire                fsm_computeEnd;
  wire                fsm_last;
  reg        [4:0]    fsm_currentState;
  reg        [4:0]    fsm_nextState;
  wire       [6:0]    channelTimes0;
  wire       [6:0]    channelTimes1;
  reg        [6:0]    channelTimes;
  wire                dataPort_sData_fire;
  wire                sData1_fire;
  wire                when_WaCounter_l17;
  reg        [6:0]    channelCnt_count;
  reg                 channelCnt_valid;
  wire                when_WaCounter_l12;
  wire                dataPort_sData_fire_1;
  wire                sData1_fire_1;
  wire                when_WaCounter_l17_1;
  reg        [8:0]    columnCnt_count;
  reg                 columnCnt_valid;
  wire                when_WaCounter_l12_1;
  wire                when_WaCounter_l17_2;
  reg        [8:0]    rowCnt_count;
  reg                 rowCnt_valid;
  wire                when_WaCounter_l12_2;
  wire                when_WaCounter_l17_3;
  reg        [2:0]    initCount_count;
  reg                 initCount_valid;
  wire                when_WaCounter_l12_3;
  wire                when_Concat_l44;
  wire                when_Concat_l45;
  reg        [31:0]   scaleTemp;
  wire                dataPort_sData_fire_2;
  wire                sData1_fire_2;
  reg        [31:0]   scaleTemp_delay_1;
  reg        [31:0]   scaleTemp_delay_2;
  wire                dataPort_sData_fire_3;
  wire                sData1_fire_3;
  reg                 _zz_dataPort_mData_valid;
  reg                 _zz_dataPort_mData_valid_1;
  reg                 _zz_dataPort_mData_valid_2;
  reg                 _zz_dataPort_mData_valid_3;
  reg                 _zz_dataPort_mData_valid_4;
  reg                 _zz_dataPort_mData_valid_5;
  reg                 _zz_dataPort_mData_valid_6;
  reg                 _zz_dataPort_mData_valid_7;
  reg                 _zz_dataPort_mData_valid_8;
  reg                 _zz_dataPort_mData_valid_9;
  `ifndef SYNTHESIS
  reg [79:0] fsm_currentState_string;
  reg [79:0] fsm_nextState_string;
  `endif


  assign _zz_when_WaCounter_l12 = (channelTimes - 7'h01);
  assign _zz_when_WaCounter_l12_1 = (dataPort_colNumIn - 9'h001);
  assign _zz_when_WaCounter_l12_2 = (dataPort_rowNumIn - 9'h001);
  ConcatZero concatZero_1 (
    .dataIn    (concatZero_1_dataIn[63:0]   ), //i
    .zero      (concatZero_1_zero[31:0]     ), //i
    .dataOut_0 (concatZero_1_dataOut_0[31:0]), //o
    .dataOut_1 (concatZero_1_dataOut_1[31:0]), //o
    .dataOut_2 (concatZero_1_dataOut_2[31:0]), //o
    .dataOut_3 (concatZero_1_dataOut_3[31:0]), //o
    .dataOut_4 (concatZero_1_dataOut_4[31:0]), //o
    .dataOut_5 (concatZero_1_dataOut_5[31:0]), //o
    .dataOut_6 (concatZero_1_dataOut_6[31:0]), //o
    .dataOut_7 (concatZero_1_dataOut_7[31:0]), //o
    .clk       (clk                         )  //i
  );
  ConcatScale concatScale_1 (
    .dataIn_0  (concatZero_1_dataOut_0[31:0]), //i
    .dataIn_1  (concatZero_1_dataOut_1[31:0]), //i
    .dataIn_2  (concatZero_1_dataOut_2[31:0]), //i
    .dataIn_3  (concatZero_1_dataOut_3[31:0]), //i
    .dataIn_4  (concatZero_1_dataOut_4[31:0]), //i
    .dataIn_5  (concatZero_1_dataOut_5[31:0]), //i
    .dataIn_6  (concatZero_1_dataOut_6[31:0]), //i
    .dataIn_7  (concatZero_1_dataOut_7[31:0]), //i
    .scale     (scaleTemp_delay_2[31:0]     ), //i
    .dataOut_0 (concatScale_1_dataOut_0[7:0]), //o
    .dataOut_1 (concatScale_1_dataOut_1[7:0]), //o
    .dataOut_2 (concatScale_1_dataOut_2[7:0]), //o
    .dataOut_3 (concatScale_1_dataOut_3[7:0]), //o
    .dataOut_4 (concatScale_1_dataOut_4[7:0]), //o
    .dataOut_5 (concatScale_1_dataOut_5[7:0]), //o
    .dataOut_6 (concatScale_1_dataOut_6[7:0]), //o
    .dataOut_7 (concatScale_1_dataOut_7[7:0]), //o
    .clk       (clk                         ), //i
    .reset     (reset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_currentState)
      ShapeStateMachineEnum_IDLE : fsm_currentState_string = "IDLE      ";
      ShapeStateMachineEnum_INIT : fsm_currentState_string = "INIT      ";
      ShapeStateMachineEnum_FIFO_READY : fsm_currentState_string = "FIFO_READY";
      ShapeStateMachineEnum_COMPUTE : fsm_currentState_string = "COMPUTE   ";
      ShapeStateMachineEnum_LAST : fsm_currentState_string = "LAST      ";
      default : fsm_currentState_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_nextState)
      ShapeStateMachineEnum_IDLE : fsm_nextState_string = "IDLE      ";
      ShapeStateMachineEnum_INIT : fsm_nextState_string = "INIT      ";
      ShapeStateMachineEnum_FIFO_READY : fsm_nextState_string = "FIFO_READY";
      ShapeStateMachineEnum_COMPUTE : fsm_nextState_string = "COMPUTE   ";
      ShapeStateMachineEnum_LAST : fsm_nextState_string = "LAST      ";
      default : fsm_nextState_string = "??????????";
    endcase
  end
  `endif

  always @(*) begin
    (* parallel_case *)
    case(1) // synthesis parallel_case
      (((fsm_currentState) & ShapeStateMachineEnum_IDLE) == ShapeStateMachineEnum_IDLE) : begin
        if(dataPort_start) begin
          fsm_nextState = ShapeStateMachineEnum_INIT;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_IDLE;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_INIT) == ShapeStateMachineEnum_INIT) : begin
        if(fsm_initEnd) begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_INIT;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_FIFO_READY) == ShapeStateMachineEnum_FIFO_READY) : begin
        if(fsm_fifoReady) begin
          fsm_nextState = ShapeStateMachineEnum_COMPUTE;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end
      end
      (((fsm_currentState) & ShapeStateMachineEnum_COMPUTE) == ShapeStateMachineEnum_COMPUTE) : begin
        if(fsm_computeEnd) begin
          fsm_nextState = ShapeStateMachineEnum_LAST;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_COMPUTE;
        end
      end
      default : begin
        if(fsm_last) begin
          fsm_nextState = ShapeStateMachineEnum_IDLE;
        end else begin
          fsm_nextState = ShapeStateMachineEnum_FIFO_READY;
        end
      end
    endcase
  end

  assign channelTimes0 = (dataPort_channelIn >>> 3);
  assign channelTimes1 = (channelIn1 >>> 3);
  assign dataPort_sData_fire = (dataPort_sData_valid && dataPort_sData_ready);
  assign sData1_fire = (sData1_valid && sData1_ready);
  assign when_WaCounter_l17 = ((dataPort_sData_fire || sData1_fire) && ((fsm_currentState & ShapeStateMachineEnum_COMPUTE) != 5'b00000));
  assign when_WaCounter_l12 = (channelCnt_count == _zz_when_WaCounter_l12);
  always @(*) begin
    if(when_WaCounter_l12) begin
      channelCnt_valid = 1'b1;
    end else begin
      channelCnt_valid = 1'b0;
    end
  end

  assign dataPort_sData_fire_1 = (dataPort_sData_valid && dataPort_sData_ready);
  assign sData1_fire_1 = (sData1_valid && sData1_ready);
  assign when_WaCounter_l17_1 = (channelCnt_valid && (dataPort_sData_fire_1 || sData1_fire_1));
  assign when_WaCounter_l12_1 = (columnCnt_count == _zz_when_WaCounter_l12_1);
  always @(*) begin
    if(when_WaCounter_l12_1) begin
      columnCnt_valid = 1'b1;
    end else begin
      columnCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l17_2 = ((fsm_currentState & ShapeStateMachineEnum_LAST) != 5'b00000);
  assign when_WaCounter_l12_2 = (rowCnt_count == _zz_when_WaCounter_l12_2);
  always @(*) begin
    if(when_WaCounter_l12_2) begin
      rowCnt_valid = 1'b1;
    end else begin
      rowCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l17_3 = ((fsm_currentState & ShapeStateMachineEnum_INIT) != 5'b00000);
  assign when_WaCounter_l12_3 = (initCount_count == 3'b101);
  always @(*) begin
    if(when_WaCounter_l12_3) begin
      initCount_valid = 1'b1;
    end else begin
      initCount_valid = 1'b0;
    end
  end

  assign fsm_initEnd = initCount_valid;
  assign fsm_fifoReady = dataPort_fifoReady;
  assign fsm_computeEnd = (channelCnt_valid && columnCnt_valid);
  assign fsm_last = rowCnt_valid;
  assign when_Concat_l44 = (((fsm_currentState & ShapeStateMachineEnum_COMPUTE) != 5'b00000) && dataPort_mData_ready);
  assign when_Concat_l45 = (channelCnt_count < channelTimes0);
  always @(*) begin
    if(when_Concat_l44) begin
      if(when_Concat_l45) begin
        dataPort_sData_ready = 1'b1;
      end else begin
        dataPort_sData_ready = 1'b0;
      end
    end else begin
      dataPort_sData_ready = 1'b0;
    end
  end

  always @(*) begin
    if(when_Concat_l44) begin
      if(when_Concat_l45) begin
        sData1_ready = 1'b0;
      end else begin
        sData1_ready = 1'b1;
      end
    end else begin
      sData1_ready = 1'b0;
    end
  end

  assign dataPort_sData_fire_2 = (dataPort_sData_valid && dataPort_sData_ready);
  always @(*) begin
    if(dataPort_sData_fire_2) begin
      concatZero_1_dataIn = dataPort_sData_payload;
    end else begin
      if(sData1_fire_2) begin
        concatZero_1_dataIn = sData1_payload;
      end else begin
        concatZero_1_dataIn = 64'h0;
      end
    end
  end

  always @(*) begin
    if(dataPort_sData_fire_2) begin
      concatZero_1_zero = zero;
    end else begin
      if(sData1_fire_2) begin
        concatZero_1_zero = zero1;
      end else begin
        concatZero_1_zero = 32'h0;
      end
    end
  end

  always @(*) begin
    if(dataPort_sData_fire_2) begin
      scaleTemp = scale;
    end else begin
      if(sData1_fire_2) begin
        scaleTemp = scale1;
      end else begin
        scaleTemp = 32'h0;
      end
    end
  end

  assign sData1_fire_2 = (sData1_valid && sData1_ready);
  always @(*) begin
    dataPort_mData_payload[7 : 0] = concatScale_1_dataOut_0;
    dataPort_mData_payload[15 : 8] = concatScale_1_dataOut_1;
    dataPort_mData_payload[23 : 16] = concatScale_1_dataOut_2;
    dataPort_mData_payload[31 : 24] = concatScale_1_dataOut_3;
    dataPort_mData_payload[39 : 32] = concatScale_1_dataOut_4;
    dataPort_mData_payload[47 : 40] = concatScale_1_dataOut_5;
    dataPort_mData_payload[55 : 48] = concatScale_1_dataOut_6;
    dataPort_mData_payload[63 : 56] = concatScale_1_dataOut_7;
  end

  assign dataPort_sData_fire_3 = (dataPort_sData_valid && dataPort_sData_ready);
  assign sData1_fire_3 = (sData1_valid && sData1_ready);
  assign dataPort_mData_valid = _zz_dataPort_mData_valid_9;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_currentState <= ShapeStateMachineEnum_IDLE;
      channelCnt_count <= 7'h0;
      columnCnt_count <= 9'h0;
      rowCnt_count <= 9'h0;
      initCount_count <= 3'b000;
    end else begin
      fsm_currentState <= fsm_nextState;
      if(when_WaCounter_l17) begin
        channelCnt_count <= (channelCnt_count + 7'h01);
        if(channelCnt_valid) begin
          channelCnt_count <= 7'h0;
        end
      end
      if(when_WaCounter_l17_1) begin
        columnCnt_count <= (columnCnt_count + 9'h001);
        if(columnCnt_valid) begin
          columnCnt_count <= 9'h0;
        end
      end
      if(when_WaCounter_l17_2) begin
        rowCnt_count <= (rowCnt_count + 9'h001);
        if(rowCnt_valid) begin
          rowCnt_count <= 9'h0;
        end
      end
      if(when_WaCounter_l17_3) begin
        initCount_count <= (initCount_count + 3'b001);
        if(initCount_valid) begin
          initCount_count <= 3'b000;
        end
      end
    end
  end

  always @(posedge clk) begin
    channelTimes <= (channelTimes0 + channelTimes1);
    scaleTemp_delay_1 <= scaleTemp;
    scaleTemp_delay_2 <= scaleTemp_delay_1;
    _zz_dataPort_mData_valid <= (dataPort_sData_fire_3 || sData1_fire_3);
    _zz_dataPort_mData_valid_1 <= _zz_dataPort_mData_valid;
    _zz_dataPort_mData_valid_2 <= _zz_dataPort_mData_valid_1;
    _zz_dataPort_mData_valid_3 <= _zz_dataPort_mData_valid_2;
    _zz_dataPort_mData_valid_4 <= _zz_dataPort_mData_valid_3;
    _zz_dataPort_mData_valid_5 <= _zz_dataPort_mData_valid_4;
    _zz_dataPort_mData_valid_6 <= _zz_dataPort_mData_valid_5;
    _zz_dataPort_mData_valid_7 <= _zz_dataPort_mData_valid_6;
    _zz_dataPort_mData_valid_8 <= _zz_dataPort_mData_valid_7;
    _zz_dataPort_mData_valid_9 <= _zz_dataPort_mData_valid_8;
  end


endmodule

module ShapeState (
  input      [3:0]    control,
  input               complete,
  output reg [3:0]    state,
  output reg          start_0,
  output reg          start_1,
  output reg          start_2,
  output reg          start_3,
  output reg          start_4,
  output              dmaReadValid_0,
  output              dmaReadValid_1,
  output              dmaWriteValid,
  input               clk,
  input               reset
);
  localparam ShapeStateEnum_IDLE = 7'd1;
  localparam ShapeStateEnum_MAX_POOLING = 7'd2;
  localparam ShapeStateEnum_SPLIT = 7'd4;
  localparam ShapeStateEnum_UP_SAMPLING = 7'd8;
  localparam ShapeStateEnum_CONCAT = 7'd16;
  localparam ShapeStateEnum_ADD = 7'd32;
  localparam ShapeStateEnum_IRQ = 7'd64;

  reg        [6:0]    fsm_currentState;
  reg        [6:0]    fsm_nextState;
  wire                when_ShapeState_l114;
  reg                 dmaReadValid_0_0;
  reg                 dmaReadValid_0_1;
  reg                 dmaReadValid_1_0;
  reg                 dmaReadValid_1_1;
  reg                 dmaReadValid_2_0;
  reg                 dmaReadValid_2_1;
  reg                 dmaReadValid_3_0;
  reg                 dmaReadValid_3_1;
  reg                 dmaReadValid_4_0;
  reg                 dmaReadValid_4_1;
  reg                 dmaWriteValid_0;
  reg                 dmaWriteValid_1;
  reg                 dmaWriteValid_2;
  reg                 dmaWriteValid_3;
  reg                 dmaWriteValid_4;
  wire                when_ShapeState_l181;
  wire                when_ShapeState_l181_1;
  wire                when_ShapeState_l181_2;
  wire                when_ShapeState_l181_3;
  wire                when_ShapeState_l181_4;
  `ifndef SYNTHESIS
  reg [87:0] fsm_currentState_string;
  reg [87:0] fsm_nextState_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_currentState)
      ShapeStateEnum_IDLE : fsm_currentState_string = "IDLE       ";
      ShapeStateEnum_MAX_POOLING : fsm_currentState_string = "MAX_POOLING";
      ShapeStateEnum_SPLIT : fsm_currentState_string = "SPLIT      ";
      ShapeStateEnum_UP_SAMPLING : fsm_currentState_string = "UP_SAMPLING";
      ShapeStateEnum_CONCAT : fsm_currentState_string = "CONCAT     ";
      ShapeStateEnum_ADD : fsm_currentState_string = "ADD        ";
      ShapeStateEnum_IRQ : fsm_currentState_string = "IRQ        ";
      default : fsm_currentState_string = "???????????";
    endcase
  end
  always @(*) begin
    case(fsm_nextState)
      ShapeStateEnum_IDLE : fsm_nextState_string = "IDLE       ";
      ShapeStateEnum_MAX_POOLING : fsm_nextState_string = "MAX_POOLING";
      ShapeStateEnum_SPLIT : fsm_nextState_string = "SPLIT      ";
      ShapeStateEnum_UP_SAMPLING : fsm_nextState_string = "UP_SAMPLING";
      ShapeStateEnum_CONCAT : fsm_nextState_string = "CONCAT     ";
      ShapeStateEnum_ADD : fsm_nextState_string = "ADD        ";
      ShapeStateEnum_IRQ : fsm_nextState_string = "IRQ        ";
      default : fsm_nextState_string = "???????????";
    endcase
  end
  `endif

  always @(*) begin
    (* parallel_case *)
    case(1) // synthesis parallel_case
      (((fsm_currentState) & ShapeStateEnum_IDLE) == ShapeStateEnum_IDLE) : begin
        case(control)
          4'b0001 : begin
            fsm_nextState = ShapeStateEnum_MAX_POOLING;
          end
          4'b0010 : begin
            fsm_nextState = ShapeStateEnum_SPLIT;
          end
          4'b0011 : begin
            fsm_nextState = ShapeStateEnum_UP_SAMPLING;
          end
          4'b0100 : begin
            fsm_nextState = ShapeStateEnum_CONCAT;
          end
          4'b0101 : begin
            fsm_nextState = ShapeStateEnum_ADD;
          end
          default : begin
            fsm_nextState = ShapeStateEnum_IDLE;
          end
        endcase
      end
      (((fsm_currentState) & ShapeStateEnum_MAX_POOLING) == ShapeStateEnum_MAX_POOLING) : begin
        if(complete) begin
          fsm_nextState = ShapeStateEnum_IRQ;
        end else begin
          fsm_nextState = ShapeStateEnum_MAX_POOLING;
        end
      end
      (((fsm_currentState) & ShapeStateEnum_SPLIT) == ShapeStateEnum_SPLIT) : begin
        if(complete) begin
          fsm_nextState = ShapeStateEnum_IRQ;
        end else begin
          fsm_nextState = ShapeStateEnum_SPLIT;
        end
      end
      (((fsm_currentState) & ShapeStateEnum_UP_SAMPLING) == ShapeStateEnum_UP_SAMPLING) : begin
        if(complete) begin
          fsm_nextState = ShapeStateEnum_IRQ;
        end else begin
          fsm_nextState = ShapeStateEnum_UP_SAMPLING;
        end
      end
      (((fsm_currentState) & ShapeStateEnum_CONCAT) == ShapeStateEnum_CONCAT) : begin
        if(complete) begin
          fsm_nextState = ShapeStateEnum_IRQ;
        end else begin
          fsm_nextState = ShapeStateEnum_CONCAT;
        end
      end
      (((fsm_currentState) & ShapeStateEnum_ADD) == ShapeStateEnum_ADD) : begin
        if(complete) begin
          fsm_nextState = ShapeStateEnum_IRQ;
        end else begin
          fsm_nextState = ShapeStateEnum_ADD;
        end
      end
      default : begin
        if(when_ShapeState_l114) begin
          fsm_nextState = ShapeStateEnum_IDLE;
        end else begin
          fsm_nextState = ShapeStateEnum_IRQ;
        end
      end
    endcase
  end

  assign when_ShapeState_l114 = (control == 4'b1111);
  assign dmaReadValid_0 = ((((dmaReadValid_0_0 ^ dmaReadValid_1_0) ^ dmaReadValid_2_0) ^ dmaReadValid_3_0) ^ dmaReadValid_4_0);
  assign dmaReadValid_1 = ((((dmaReadValid_0_1 ^ dmaReadValid_1_1) ^ dmaReadValid_2_1) ^ dmaReadValid_3_1) ^ dmaReadValid_4_1);
  assign dmaWriteValid = ((((dmaWriteValid_0 ^ dmaWriteValid_1) ^ dmaWriteValid_2) ^ dmaWriteValid_3) ^ dmaWriteValid_4);
  assign when_ShapeState_l181 = (((fsm_currentState & ShapeStateEnum_IDLE) != 7'b0000000) && ((fsm_nextState & ShapeStateEnum_MAX_POOLING) != 7'b0000000));
  assign when_ShapeState_l181_1 = (((fsm_currentState & ShapeStateEnum_IDLE) != 7'b0000000) && ((fsm_nextState & ShapeStateEnum_UP_SAMPLING) != 7'b0000000));
  assign when_ShapeState_l181_2 = (((fsm_currentState & ShapeStateEnum_IDLE) != 7'b0000000) && ((fsm_nextState & ShapeStateEnum_SPLIT) != 7'b0000000));
  assign when_ShapeState_l181_3 = (((fsm_currentState & ShapeStateEnum_IDLE) != 7'b0000000) && ((fsm_nextState & ShapeStateEnum_CONCAT) != 7'b0000000));
  assign when_ShapeState_l181_4 = (((fsm_currentState & ShapeStateEnum_IDLE) != 7'b0000000) && ((fsm_nextState & ShapeStateEnum_ADD) != 7'b0000000));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_currentState <= ShapeStateEnum_IDLE;
      dmaReadValid_0_0 <= 1'b0;
      dmaReadValid_0_1 <= 1'b0;
      dmaReadValid_1_0 <= 1'b0;
      dmaReadValid_1_1 <= 1'b0;
      dmaReadValid_2_0 <= 1'b0;
      dmaReadValid_2_1 <= 1'b0;
      dmaReadValid_3_0 <= 1'b0;
      dmaReadValid_3_1 <= 1'b0;
      dmaReadValid_4_0 <= 1'b0;
      dmaReadValid_4_1 <= 1'b0;
      dmaWriteValid_0 <= 1'b0;
      dmaWriteValid_1 <= 1'b0;
      dmaWriteValid_2 <= 1'b0;
      dmaWriteValid_3 <= 1'b0;
      dmaWriteValid_4 <= 1'b0;
    end else begin
      fsm_currentState <= fsm_nextState;
      if(when_ShapeState_l181) begin
        dmaReadValid_0_0 <= 1'b1;
        dmaReadValid_0_1 <= 1'b0;
        dmaWriteValid_0 <= 1'b1;
      end else begin
        dmaReadValid_0_0 <= 1'b0;
        dmaReadValid_0_1 <= 1'b0;
        dmaWriteValid_0 <= 1'b0;
      end
      if(when_ShapeState_l181_1) begin
        dmaReadValid_2_0 <= 1'b1;
        dmaReadValid_2_1 <= 1'b0;
        dmaWriteValid_2 <= 1'b1;
      end else begin
        dmaReadValid_2_0 <= 1'b0;
        dmaReadValid_2_1 <= 1'b0;
        dmaWriteValid_2 <= 1'b0;
      end
      if(when_ShapeState_l181_2) begin
        dmaReadValid_1_0 <= 1'b1;
        dmaReadValid_1_1 <= 1'b0;
        dmaWriteValid_1 <= 1'b1;
      end else begin
        dmaReadValid_1_0 <= 1'b0;
        dmaReadValid_1_1 <= 1'b0;
        dmaWriteValid_1 <= 1'b0;
      end
      if(when_ShapeState_l181_3) begin
        dmaReadValid_3_0 <= 1'b1;
        dmaReadValid_3_1 <= 1'b1;
        dmaWriteValid_3 <= 1'b1;
      end else begin
        dmaReadValid_3_0 <= 1'b0;
        dmaReadValid_3_1 <= 1'b0;
        dmaWriteValid_3 <= 1'b0;
      end
      if(when_ShapeState_l181_4) begin
        dmaReadValid_4_0 <= 1'b1;
        dmaReadValid_4_1 <= 1'b1;
        dmaWriteValid_4 <= 1'b1;
      end else begin
        dmaReadValid_4_0 <= 1'b0;
        dmaReadValid_4_1 <= 1'b0;
        dmaWriteValid_4 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(when_ShapeState_l181) begin
      start_0 <= 1'b1;
    end else begin
      start_0 <= 1'b0;
    end
    if(when_ShapeState_l181_1) begin
      start_2 <= 1'b1;
    end else begin
      start_2 <= 1'b0;
    end
    if(when_ShapeState_l181_2) begin
      start_1 <= 1'b1;
    end else begin
      start_1 <= 1'b0;
    end
    if(when_ShapeState_l181_3) begin
      start_3 <= 1'b1;
    end else begin
      start_3 <= 1'b0;
    end
    if(when_ShapeState_l181_4) begin
      start_4 <= 1'b1;
    end else begin
      start_4 <= 1'b0;
    end
    (* parallel_case *)
    case(1) // synthesis parallel_case
      (((fsm_currentState) & ShapeStateEnum_CONCAT) == ShapeStateEnum_CONCAT) : begin
        state <= 4'b0100;
      end
      (((fsm_currentState) & ShapeStateEnum_MAX_POOLING) == ShapeStateEnum_MAX_POOLING) : begin
        state <= 4'b0001;
      end
      (((fsm_currentState) & ShapeStateEnum_UP_SAMPLING) == ShapeStateEnum_UP_SAMPLING) : begin
        state <= 4'b0011;
      end
      (((fsm_currentState) & ShapeStateEnum_SPLIT) == ShapeStateEnum_SPLIT) : begin
        state <= 4'b0010;
      end
      (((fsm_currentState) & ShapeStateEnum_ADD) == ShapeStateEnum_ADD) : begin
        state <= 4'b0101;
      end
      (((fsm_currentState) & ShapeStateEnum_IRQ) == ShapeStateEnum_IRQ) : begin
        state <= 4'b1111;
      end
      default : begin
        state <= 4'b0000;
      end
    endcase
  end


endmodule

module StreamFifo_4 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  input               io_flush,
  output     [12:0]   io_occupancy,
  output     [12:0]   io_availability,
  input               clk,
  input               reset
);

  reg        [63:0]   _zz_logic_ram_port0;
  wire       [11:0]   _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [11:0]   _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [63:0]   _zz_logic_ram_port_1;
  wire       [11:0]   _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [11:0]   logic_pushPtr_valueNext;
  reg        [11:0]   logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [11:0]   logic_popPtr_valueNext;
  reg        [11:0]   logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l1075;
  wire       [11:0]   logic_ptrDif;
  (* ram_style = "block" *) reg [63:0] logic_ram [0:4095];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {11'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {11'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  assign _zz_logic_ram_port_1 = io_push_payload;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 12'hfff);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 12'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 12'hfff);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 12'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l1075 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 12'h0;
      logic_popPtr_value <= 12'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l1075) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module WaStreamFifoPipe_1 (
  input               push_valid,
  output              push_ready,
  input      [63:0]   push_payload,
  output              pop_valid,
  input               pop_ready,
  output     [63:0]   pop_payload,
  input               flush,
  output     [6:0]    occupancy,
  output     [6:0]    availability,
  input               clk,
  input               reset
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [63:0]   fifo_io_pop_payload;
  wire       [6:0]    fifo_io_occupancy;
  wire       [6:0]    fifo_io_availability;
  reg        [63:0]   dataReg;
  wire                fifo_io_pop_fire;
  reg                 fireReg;
  reg                 validHold;
  wire                when_WaStreamFifoPipe_l26;
  reg        [63:0]   dataHold;
  wire                when_WaStreamFifoPipe_l30;

  StreamFifo_1 fifo (
    .io_push_valid   (push_valid               ), //i
    .io_push_ready   (fifo_io_push_ready       ), //o
    .io_push_payload (push_payload[63:0]       ), //i
    .io_pop_valid    (fifo_io_pop_valid        ), //o
    .io_pop_ready    (pop_ready                ), //i
    .io_pop_payload  (fifo_io_pop_payload[63:0]), //o
    .io_flush        (flush                    ), //i
    .io_occupancy    (fifo_io_occupancy[6:0]   ), //o
    .io_availability (fifo_io_availability[6:0]), //o
    .clk             (clk                      ), //i
    .reset           (reset                    )  //i
  );
  assign push_ready = fifo_io_push_ready;
  assign occupancy = fifo_io_occupancy;
  assign availability = fifo_io_availability;
  assign fifo_io_pop_fire = (fifo_io_pop_valid && pop_ready);
  assign when_WaStreamFifoPipe_l26 = (fireReg && (! pop_ready));
  assign when_WaStreamFifoPipe_l30 = (fireReg && (! pop_ready));
  assign pop_valid = (validHold || fireReg);
  assign pop_payload = (validHold ? dataHold : dataReg);
  always @(posedge clk) begin
    dataReg <= fifo_io_pop_payload;
    if(when_WaStreamFifoPipe_l26) begin
      dataHold <= dataReg;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fireReg <= 1'b0;
      validHold <= 1'b0;
    end else begin
      fireReg <= fifo_io_pop_fire;
      if(pop_ready) begin
        validHold <= 1'b0;
      end else begin
        if(when_WaStreamFifoPipe_l30) begin
          validHold <= 1'b1;
        end
      end
    end
  end


endmodule

module WaStreamFifoPipe (
  input               push_valid,
  output              push_ready,
  input      [63:0]   push_payload,
  output              pop_valid,
  input               pop_ready,
  output     [63:0]   pop_payload,
  input               flush,
  output     [11:0]   occupancy,
  output     [11:0]   availability,
  input               clk,
  input               reset
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [63:0]   fifo_io_pop_payload;
  wire       [11:0]   fifo_io_occupancy;
  wire       [11:0]   fifo_io_availability;
  reg        [63:0]   dataReg;
  wire                fifo_io_pop_fire;
  reg                 fireReg;
  reg                 validHold;
  wire                when_WaStreamFifoPipe_l26;
  reg        [63:0]   dataHold;
  wire                when_WaStreamFifoPipe_l30;

  StreamFifo fifo (
    .io_push_valid   (push_valid                ), //i
    .io_push_ready   (fifo_io_push_ready        ), //o
    .io_push_payload (push_payload[63:0]        ), //i
    .io_pop_valid    (fifo_io_pop_valid         ), //o
    .io_pop_ready    (pop_ready                 ), //i
    .io_pop_payload  (fifo_io_pop_payload[63:0] ), //o
    .io_flush        (flush                     ), //i
    .io_occupancy    (fifo_io_occupancy[11:0]   ), //o
    .io_availability (fifo_io_availability[11:0]), //o
    .clk             (clk                       ), //i
    .reset           (reset                     )  //i
  );
  assign push_ready = fifo_io_push_ready;
  assign occupancy = fifo_io_occupancy;
  assign availability = fifo_io_availability;
  assign fifo_io_pop_fire = (fifo_io_pop_valid && pop_ready);
  assign when_WaStreamFifoPipe_l26 = (fireReg && (! pop_ready));
  assign when_WaStreamFifoPipe_l30 = (fireReg && (! pop_ready));
  assign pop_valid = (validHold || fireReg);
  assign pop_payload = (validHold ? dataHold : dataReg);
  always @(posedge clk) begin
    dataReg <= fifo_io_pop_payload;
    if(when_WaStreamFifoPipe_l26) begin
      dataHold <= dataReg;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fireReg <= 1'b0;
      validHold <= 1'b0;
    end else begin
      fireReg <= fifo_io_pop_fire;
      if(pop_ready) begin
        validHold <= 1'b0;
      end else begin
        if(when_WaStreamFifoPipe_l30) begin
          validHold <= 1'b1;
        end
      end
    end
  end


endmodule

//AddScale replaced by AddScale

module AddScale (
  input      [31:0]   dataIn_0,
  input      [31:0]   dataIn_1,
  input      [31:0]   dataIn_2,
  input      [31:0]   dataIn_3,
  input      [31:0]   dataIn_4,
  input      [31:0]   dataIn_5,
  input      [31:0]   dataIn_6,
  input      [31:0]   dataIn_7,
  input      [31:0]   scale,
  output     [63:0]   dataOut_0,
  output     [63:0]   dataOut_1,
  output     [63:0]   dataOut_2,
  output     [63:0]   dataOut_3,
  output     [63:0]   dataOut_4,
  output     [63:0]   dataOut_5,
  output     [63:0]   dataOut_6,
  output     [63:0]   dataOut_7,
  input               clk
);

  wire       [63:0]   mulScale_0_P;
  wire       [63:0]   mulScale_1_P;
  wire       [63:0]   mulScale_2_P;
  wire       [63:0]   mulScale_3_P;
  wire       [63:0]   mulScale_4_P;
  wire       [63:0]   mulScale_5_P;
  wire       [63:0]   mulScale_6_P;
  wire       [63:0]   mulScale_7_P;

  addMul mulScale_0 (
    .A   (dataIn_0[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_0_P[63:0]), //o
    .CLK (clk               )  //i
  );
  addMul mulScale_1 (
    .A   (dataIn_1[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_1_P[63:0]), //o
    .CLK (clk               )  //i
  );
  addMul mulScale_2 (
    .A   (dataIn_2[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_2_P[63:0]), //o
    .CLK (clk               )  //i
  );
  addMul mulScale_3 (
    .A   (dataIn_3[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_3_P[63:0]), //o
    .CLK (clk               )  //i
  );
  addMul mulScale_4 (
    .A   (dataIn_4[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_4_P[63:0]), //o
    .CLK (clk               )  //i
  );
  addMul mulScale_5 (
    .A   (dataIn_5[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_5_P[63:0]), //o
    .CLK (clk               )  //i
  );
  addMul mulScale_6 (
    .A   (dataIn_6[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_6_P[63:0]), //o
    .CLK (clk               )  //i
  );
  addMul mulScale_7 (
    .A   (dataIn_7[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_7_P[63:0]), //o
    .CLK (clk               )  //i
  );
  assign dataOut_0 = mulScale_0_P;
  assign dataOut_1 = mulScale_1_P;
  assign dataOut_2 = mulScale_2_P;
  assign dataOut_3 = mulScale_3_P;
  assign dataOut_4 = mulScale_4_P;
  assign dataOut_5 = mulScale_5_P;
  assign dataOut_6 = mulScale_6_P;
  assign dataOut_7 = mulScale_7_P;

endmodule

//AddAdd_1 replaced by AddAdd_1

module AddAdd_1 (
  input      [63:0]   dataIn,
  input      [31:0]   zero,
  output     [31:0]   dataOut_0,
  output     [31:0]   dataOut_1,
  output     [31:0]   dataOut_2,
  output     [31:0]   dataOut_3,
  output     [31:0]   dataOut_4,
  output     [31:0]   dataOut_5,
  output     [31:0]   dataOut_6,
  output     [31:0]   dataOut_7,
  input               clk
);

  wire       [31:0]   add_0_A;
  wire       [31:0]   add_1_A;
  wire       [31:0]   add_2_A;
  wire       [31:0]   add_3_A;
  wire       [31:0]   add_4_A;
  wire       [31:0]   add_5_A;
  wire       [31:0]   add_6_A;
  wire       [31:0]   add_7_A;
  wire       [31:0]   add_0_S;
  wire       [31:0]   add_1_S;
  wire       [31:0]   add_2_S;
  wire       [31:0]   add_3_S;
  wire       [31:0]   add_4_S;
  wire       [31:0]   add_5_S;
  wire       [31:0]   add_6_S;
  wire       [31:0]   add_7_S;
  wire       [15:0]   _zz_A;
  wire       [7:0]    _zz_A_1;
  wire       [15:0]   _zz_A_2;
  wire       [15:0]   _zz_A_3;
  wire       [7:0]    _zz_A_4;
  wire       [15:0]   _zz_A_5;
  wire       [15:0]   _zz_A_6;
  wire       [7:0]    _zz_A_7;
  wire       [15:0]   _zz_A_8;
  wire       [15:0]   _zz_A_9;
  wire       [7:0]    _zz_A_10;
  wire       [15:0]   _zz_A_11;
  wire       [15:0]   _zz_A_12;
  wire       [7:0]    _zz_A_13;
  wire       [15:0]   _zz_A_14;
  wire       [15:0]   _zz_A_15;
  wire       [7:0]    _zz_A_16;
  wire       [15:0]   _zz_A_17;
  wire       [15:0]   _zz_A_18;
  wire       [7:0]    _zz_A_19;
  wire       [15:0]   _zz_A_20;
  wire       [15:0]   _zz_A_21;
  wire       [7:0]    _zz_A_22;
  wire       [15:0]   _zz_A_23;
  wire       [7:0]    dataInTemp_0;
  wire       [7:0]    dataInTemp_1;
  wire       [7:0]    dataInTemp_2;
  wire       [7:0]    dataInTemp_3;
  wire       [7:0]    dataInTemp_4;
  wire       [7:0]    dataInTemp_5;
  wire       [7:0]    dataInTemp_6;
  wire       [7:0]    dataInTemp_7;

  assign _zz_A = {_zz_A_1,dataInTemp_0};
  assign _zz_A_1 = 8'h0;
  assign _zz_A_2 = 16'h0;
  assign _zz_A_3 = {_zz_A_4,dataInTemp_1};
  assign _zz_A_4 = 8'h0;
  assign _zz_A_5 = 16'h0;
  assign _zz_A_6 = {_zz_A_7,dataInTemp_2};
  assign _zz_A_7 = 8'h0;
  assign _zz_A_8 = 16'h0;
  assign _zz_A_9 = {_zz_A_10,dataInTemp_3};
  assign _zz_A_10 = 8'h0;
  assign _zz_A_11 = 16'h0;
  assign _zz_A_12 = {_zz_A_13,dataInTemp_4};
  assign _zz_A_13 = 8'h0;
  assign _zz_A_14 = 16'h0;
  assign _zz_A_15 = {_zz_A_16,dataInTemp_5};
  assign _zz_A_16 = 8'h0;
  assign _zz_A_17 = 16'h0;
  assign _zz_A_18 = {_zz_A_19,dataInTemp_6};
  assign _zz_A_19 = 8'h0;
  assign _zz_A_20 = 16'h0;
  assign _zz_A_21 = {_zz_A_22,dataInTemp_7};
  assign _zz_A_22 = 8'h0;
  assign _zz_A_23 = 16'h0;
  addAdd add_0 (
    .A   (add_0_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_0_S[31:0]), //o
    .CLK (clk          )  //i
  );
  addAdd add_1 (
    .A   (add_1_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_1_S[31:0]), //o
    .CLK (clk          )  //i
  );
  addAdd add_2 (
    .A   (add_2_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_2_S[31:0]), //o
    .CLK (clk          )  //i
  );
  addAdd add_3 (
    .A   (add_3_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_3_S[31:0]), //o
    .CLK (clk          )  //i
  );
  addAdd add_4 (
    .A   (add_4_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_4_S[31:0]), //o
    .CLK (clk          )  //i
  );
  addAdd add_5 (
    .A   (add_5_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_5_S[31:0]), //o
    .CLK (clk          )  //i
  );
  addAdd add_6 (
    .A   (add_6_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_6_S[31:0]), //o
    .CLK (clk          )  //i
  );
  addAdd add_7 (
    .A   (add_7_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_7_S[31:0]), //o
    .CLK (clk          )  //i
  );
  assign dataInTemp_0 = dataIn[7 : 0];
  assign dataInTemp_1 = dataIn[15 : 8];
  assign dataInTemp_2 = dataIn[23 : 16];
  assign dataInTemp_3 = dataIn[31 : 24];
  assign dataInTemp_4 = dataIn[39 : 32];
  assign dataInTemp_5 = dataIn[47 : 40];
  assign dataInTemp_6 = dataIn[55 : 48];
  assign dataInTemp_7 = dataIn[63 : 56];
  assign add_0_A = {_zz_A,_zz_A_2};
  assign dataOut_0 = add_0_S;
  assign add_1_A = {_zz_A_3,_zz_A_5};
  assign dataOut_1 = add_1_S;
  assign add_2_A = {_zz_A_6,_zz_A_8};
  assign dataOut_2 = add_2_S;
  assign add_3_A = {_zz_A_9,_zz_A_11};
  assign dataOut_3 = add_3_S;
  assign add_4_A = {_zz_A_12,_zz_A_14};
  assign dataOut_4 = add_4_S;
  assign add_5_A = {_zz_A_15,_zz_A_17};
  assign dataOut_5 = add_5_S;
  assign add_6_A = {_zz_A_18,_zz_A_20};
  assign dataOut_6 = add_6_S;
  assign add_7_A = {_zz_A_21,_zz_A_23};
  assign dataOut_7 = add_7_S;

endmodule

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

module ConcatScale (
  input      [31:0]   dataIn_0,
  input      [31:0]   dataIn_1,
  input      [31:0]   dataIn_2,
  input      [31:0]   dataIn_3,
  input      [31:0]   dataIn_4,
  input      [31:0]   dataIn_5,
  input      [31:0]   dataIn_6,
  input      [31:0]   dataIn_7,
  input      [31:0]   scale,
  output     [7:0]    dataOut_0,
  output     [7:0]    dataOut_1,
  output     [7:0]    dataOut_2,
  output     [7:0]    dataOut_3,
  output     [7:0]    dataOut_4,
  output     [7:0]    dataOut_5,
  output     [7:0]    dataOut_6,
  output     [7:0]    dataOut_7,
  input               clk,
  input               reset
);

  wire       [32:0]   mulScale_0_P;
  wire       [32:0]   mulScale_1_P;
  wire       [32:0]   mulScale_2_P;
  wire       [32:0]   mulScale_3_P;
  wire       [32:0]   mulScale_4_P;
  wire       [32:0]   mulScale_5_P;
  wire       [32:0]   mulScale_6_P;
  wire       [32:0]   mulScale_7_P;
  wire       [31:0]   _zz__zz_dataOut_0_1;
  wire       [31:0]   _zz__zz_dataOut_0_1_1;
  wire       [7:0]    _zz__zz_dataOut_0;
  wire       [31:0]   _zz_when_Concat_l135;
  wire       [31:0]   _zz__zz_dataOut_1_1;
  wire       [31:0]   _zz__zz_dataOut_1_1_1;
  wire       [7:0]    _zz__zz_dataOut_1;
  wire       [31:0]   _zz_when_Concat_l135_1;
  wire       [31:0]   _zz__zz_dataOut_2_1;
  wire       [31:0]   _zz__zz_dataOut_2_1_1;
  wire       [7:0]    _zz__zz_dataOut_2;
  wire       [31:0]   _zz_when_Concat_l135_2;
  wire       [31:0]   _zz__zz_dataOut_3_1;
  wire       [31:0]   _zz__zz_dataOut_3_1_1;
  wire       [7:0]    _zz__zz_dataOut_3;
  wire       [31:0]   _zz_when_Concat_l135_3;
  wire       [31:0]   _zz__zz_dataOut_4_1;
  wire       [31:0]   _zz__zz_dataOut_4_1_1;
  wire       [7:0]    _zz__zz_dataOut_4;
  wire       [31:0]   _zz_when_Concat_l135_4;
  wire       [31:0]   _zz__zz_dataOut_5_1;
  wire       [31:0]   _zz__zz_dataOut_5_1_1;
  wire       [7:0]    _zz__zz_dataOut_5;
  wire       [31:0]   _zz_when_Concat_l135_5;
  wire       [31:0]   _zz__zz_dataOut_6_1;
  wire       [31:0]   _zz__zz_dataOut_6_1_1;
  wire       [7:0]    _zz__zz_dataOut_6;
  wire       [31:0]   _zz_when_Concat_l135_6;
  wire       [31:0]   _zz__zz_dataOut_7_1;
  wire       [31:0]   _zz__zz_dataOut_7_1_1;
  wire       [7:0]    _zz__zz_dataOut_7;
  wire       [31:0]   _zz_when_Concat_l135_7;
  wire       [32:0]   mulDataOut_0;
  wire       [32:0]   mulDataOut_1;
  wire       [32:0]   mulDataOut_2;
  wire       [32:0]   mulDataOut_3;
  wire       [32:0]   mulDataOut_4;
  wire       [32:0]   mulDataOut_5;
  wire       [32:0]   mulDataOut_6;
  wire       [32:0]   mulDataOut_7;
  reg        [7:0]    _zz_dataOut_0;
  reg        [31:0]   _zz_dataOut_0_1;
  wire                when_Concat_l128;
  wire                when_Concat_l133;
  wire                when_Concat_l135;
  reg        [7:0]    _zz_dataOut_1;
  reg        [31:0]   _zz_dataOut_1_1;
  wire                when_Concat_l128_1;
  wire                when_Concat_l133_1;
  wire                when_Concat_l135_1;
  reg        [7:0]    _zz_dataOut_2;
  reg        [31:0]   _zz_dataOut_2_1;
  wire                when_Concat_l128_2;
  wire                when_Concat_l133_2;
  wire                when_Concat_l135_2;
  reg        [7:0]    _zz_dataOut_3;
  reg        [31:0]   _zz_dataOut_3_1;
  wire                when_Concat_l128_3;
  wire                when_Concat_l133_3;
  wire                when_Concat_l135_3;
  reg        [7:0]    _zz_dataOut_4;
  reg        [31:0]   _zz_dataOut_4_1;
  wire                when_Concat_l128_4;
  wire                when_Concat_l133_4;
  wire                when_Concat_l135_4;
  reg        [7:0]    _zz_dataOut_5;
  reg        [31:0]   _zz_dataOut_5_1;
  wire                when_Concat_l128_5;
  wire                when_Concat_l133_5;
  wire                when_Concat_l135_5;
  reg        [7:0]    _zz_dataOut_6;
  reg        [31:0]   _zz_dataOut_6_1;
  wire                when_Concat_l128_6;
  wire                when_Concat_l133_6;
  wire                when_Concat_l135_6;
  reg        [7:0]    _zz_dataOut_7;
  reg        [31:0]   _zz_dataOut_7_1;
  wire                when_Concat_l128_7;
  wire                when_Concat_l133_7;
  wire                when_Concat_l135_7;

  assign _zz__zz_dataOut_0_1 = mulDataOut_0[32 : 1];
  assign _zz__zz_dataOut_0_1_1 = 32'h00000001;
  assign _zz__zz_dataOut_0 = _zz_dataOut_0_1[7 : 0];
  assign _zz_when_Concat_l135 = 32'h000000ff;
  assign _zz__zz_dataOut_1_1 = mulDataOut_1[32 : 1];
  assign _zz__zz_dataOut_1_1_1 = 32'h00000001;
  assign _zz__zz_dataOut_1 = _zz_dataOut_1_1[7 : 0];
  assign _zz_when_Concat_l135_1 = 32'h000000ff;
  assign _zz__zz_dataOut_2_1 = mulDataOut_2[32 : 1];
  assign _zz__zz_dataOut_2_1_1 = 32'h00000001;
  assign _zz__zz_dataOut_2 = _zz_dataOut_2_1[7 : 0];
  assign _zz_when_Concat_l135_2 = 32'h000000ff;
  assign _zz__zz_dataOut_3_1 = mulDataOut_3[32 : 1];
  assign _zz__zz_dataOut_3_1_1 = 32'h00000001;
  assign _zz__zz_dataOut_3 = _zz_dataOut_3_1[7 : 0];
  assign _zz_when_Concat_l135_3 = 32'h000000ff;
  assign _zz__zz_dataOut_4_1 = mulDataOut_4[32 : 1];
  assign _zz__zz_dataOut_4_1_1 = 32'h00000001;
  assign _zz__zz_dataOut_4 = _zz_dataOut_4_1[7 : 0];
  assign _zz_when_Concat_l135_4 = 32'h000000ff;
  assign _zz__zz_dataOut_5_1 = mulDataOut_5[32 : 1];
  assign _zz__zz_dataOut_5_1_1 = 32'h00000001;
  assign _zz__zz_dataOut_5 = _zz_dataOut_5_1[7 : 0];
  assign _zz_when_Concat_l135_5 = 32'h000000ff;
  assign _zz__zz_dataOut_6_1 = mulDataOut_6[32 : 1];
  assign _zz__zz_dataOut_6_1_1 = 32'h00000001;
  assign _zz__zz_dataOut_6 = _zz_dataOut_6_1[7 : 0];
  assign _zz_when_Concat_l135_6 = 32'h000000ff;
  assign _zz__zz_dataOut_7_1 = mulDataOut_7[32 : 1];
  assign _zz__zz_dataOut_7_1_1 = 32'h00000001;
  assign _zz__zz_dataOut_7 = _zz_dataOut_7_1[7 : 0];
  assign _zz_when_Concat_l135_7 = 32'h000000ff;
  concatMul mulScale_0 (
    .A   (dataIn_0[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_0_P[32:0]), //o
    .CLK (clk               )  //i
  );
  concatMul mulScale_1 (
    .A   (dataIn_1[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_1_P[32:0]), //o
    .CLK (clk               )  //i
  );
  concatMul mulScale_2 (
    .A   (dataIn_2[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_2_P[32:0]), //o
    .CLK (clk               )  //i
  );
  concatMul mulScale_3 (
    .A   (dataIn_3[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_3_P[32:0]), //o
    .CLK (clk               )  //i
  );
  concatMul mulScale_4 (
    .A   (dataIn_4[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_4_P[32:0]), //o
    .CLK (clk               )  //i
  );
  concatMul mulScale_5 (
    .A   (dataIn_5[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_5_P[32:0]), //o
    .CLK (clk               )  //i
  );
  concatMul mulScale_6 (
    .A   (dataIn_6[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_6_P[32:0]), //o
    .CLK (clk               )  //i
  );
  concatMul mulScale_7 (
    .A   (dataIn_7[31:0]    ), //i
    .B   (scale[31:0]       ), //i
    .P   (mulScale_7_P[32:0]), //o
    .CLK (clk               )  //i
  );
  assign mulDataOut_0 = mulScale_0_P;
  assign mulDataOut_1 = mulScale_1_P;
  assign mulDataOut_2 = mulScale_2_P;
  assign mulDataOut_3 = mulScale_3_P;
  assign mulDataOut_4 = mulScale_4_P;
  assign mulDataOut_5 = mulScale_5_P;
  assign mulDataOut_6 = mulScale_6_P;
  assign mulDataOut_7 = mulScale_7_P;
  assign when_Concat_l128 = mulDataOut_0[0];
  assign when_Concat_l133 = _zz_dataOut_0_1[31];
  assign when_Concat_l135 = ($signed(_zz_when_Concat_l135) < $signed(_zz_dataOut_0_1));
  assign dataOut_0 = _zz_dataOut_0;
  assign when_Concat_l128_1 = mulDataOut_1[0];
  assign when_Concat_l133_1 = _zz_dataOut_1_1[31];
  assign when_Concat_l135_1 = ($signed(_zz_when_Concat_l135_1) < $signed(_zz_dataOut_1_1));
  assign dataOut_1 = _zz_dataOut_1;
  assign when_Concat_l128_2 = mulDataOut_2[0];
  assign when_Concat_l133_2 = _zz_dataOut_2_1[31];
  assign when_Concat_l135_2 = ($signed(_zz_when_Concat_l135_2) < $signed(_zz_dataOut_2_1));
  assign dataOut_2 = _zz_dataOut_2;
  assign when_Concat_l128_3 = mulDataOut_3[0];
  assign when_Concat_l133_3 = _zz_dataOut_3_1[31];
  assign when_Concat_l135_3 = ($signed(_zz_when_Concat_l135_3) < $signed(_zz_dataOut_3_1));
  assign dataOut_3 = _zz_dataOut_3;
  assign when_Concat_l128_4 = mulDataOut_4[0];
  assign when_Concat_l133_4 = _zz_dataOut_4_1[31];
  assign when_Concat_l135_4 = ($signed(_zz_when_Concat_l135_4) < $signed(_zz_dataOut_4_1));
  assign dataOut_4 = _zz_dataOut_4;
  assign when_Concat_l128_5 = mulDataOut_5[0];
  assign when_Concat_l133_5 = _zz_dataOut_5_1[31];
  assign when_Concat_l135_5 = ($signed(_zz_when_Concat_l135_5) < $signed(_zz_dataOut_5_1));
  assign dataOut_5 = _zz_dataOut_5;
  assign when_Concat_l128_6 = mulDataOut_6[0];
  assign when_Concat_l133_6 = _zz_dataOut_6_1[31];
  assign when_Concat_l135_6 = ($signed(_zz_when_Concat_l135_6) < $signed(_zz_dataOut_6_1));
  assign dataOut_6 = _zz_dataOut_6;
  assign when_Concat_l128_7 = mulDataOut_7[0];
  assign when_Concat_l133_7 = _zz_dataOut_7_1[31];
  assign when_Concat_l135_7 = ($signed(_zz_when_Concat_l135_7) < $signed(_zz_dataOut_7_1));
  assign dataOut_7 = _zz_dataOut_7;
  always @(posedge clk) begin
    if(when_Concat_l128) begin
      _zz_dataOut_0_1 <= ($signed(_zz__zz_dataOut_0_1) + $signed(_zz__zz_dataOut_0_1_1));
    end else begin
      _zz_dataOut_0_1 <= mulDataOut_0[32 : 1];
    end
    if(when_Concat_l133) begin
      _zz_dataOut_0 <= 8'h0;
    end else begin
      if(when_Concat_l135) begin
        _zz_dataOut_0 <= 8'hff;
      end else begin
        _zz_dataOut_0 <= _zz__zz_dataOut_0;
      end
    end
    if(when_Concat_l128_1) begin
      _zz_dataOut_1_1 <= ($signed(_zz__zz_dataOut_1_1) + $signed(_zz__zz_dataOut_1_1_1));
    end else begin
      _zz_dataOut_1_1 <= mulDataOut_1[32 : 1];
    end
    if(when_Concat_l133_1) begin
      _zz_dataOut_1 <= 8'h0;
    end else begin
      if(when_Concat_l135_1) begin
        _zz_dataOut_1 <= 8'hff;
      end else begin
        _zz_dataOut_1 <= _zz__zz_dataOut_1;
      end
    end
    if(when_Concat_l128_2) begin
      _zz_dataOut_2_1 <= ($signed(_zz__zz_dataOut_2_1) + $signed(_zz__zz_dataOut_2_1_1));
    end else begin
      _zz_dataOut_2_1 <= mulDataOut_2[32 : 1];
    end
    if(when_Concat_l133_2) begin
      _zz_dataOut_2 <= 8'h0;
    end else begin
      if(when_Concat_l135_2) begin
        _zz_dataOut_2 <= 8'hff;
      end else begin
        _zz_dataOut_2 <= _zz__zz_dataOut_2;
      end
    end
    if(when_Concat_l128_3) begin
      _zz_dataOut_3_1 <= ($signed(_zz__zz_dataOut_3_1) + $signed(_zz__zz_dataOut_3_1_1));
    end else begin
      _zz_dataOut_3_1 <= mulDataOut_3[32 : 1];
    end
    if(when_Concat_l133_3) begin
      _zz_dataOut_3 <= 8'h0;
    end else begin
      if(when_Concat_l135_3) begin
        _zz_dataOut_3 <= 8'hff;
      end else begin
        _zz_dataOut_3 <= _zz__zz_dataOut_3;
      end
    end
    if(when_Concat_l128_4) begin
      _zz_dataOut_4_1 <= ($signed(_zz__zz_dataOut_4_1) + $signed(_zz__zz_dataOut_4_1_1));
    end else begin
      _zz_dataOut_4_1 <= mulDataOut_4[32 : 1];
    end
    if(when_Concat_l133_4) begin
      _zz_dataOut_4 <= 8'h0;
    end else begin
      if(when_Concat_l135_4) begin
        _zz_dataOut_4 <= 8'hff;
      end else begin
        _zz_dataOut_4 <= _zz__zz_dataOut_4;
      end
    end
    if(when_Concat_l128_5) begin
      _zz_dataOut_5_1 <= ($signed(_zz__zz_dataOut_5_1) + $signed(_zz__zz_dataOut_5_1_1));
    end else begin
      _zz_dataOut_5_1 <= mulDataOut_5[32 : 1];
    end
    if(when_Concat_l133_5) begin
      _zz_dataOut_5 <= 8'h0;
    end else begin
      if(when_Concat_l135_5) begin
        _zz_dataOut_5 <= 8'hff;
      end else begin
        _zz_dataOut_5 <= _zz__zz_dataOut_5;
      end
    end
    if(when_Concat_l128_6) begin
      _zz_dataOut_6_1 <= ($signed(_zz__zz_dataOut_6_1) + $signed(_zz__zz_dataOut_6_1_1));
    end else begin
      _zz_dataOut_6_1 <= mulDataOut_6[32 : 1];
    end
    if(when_Concat_l133_6) begin
      _zz_dataOut_6 <= 8'h0;
    end else begin
      if(when_Concat_l135_6) begin
        _zz_dataOut_6 <= 8'hff;
      end else begin
        _zz_dataOut_6 <= _zz__zz_dataOut_6;
      end
    end
    if(when_Concat_l128_7) begin
      _zz_dataOut_7_1 <= ($signed(_zz__zz_dataOut_7_1) + $signed(_zz__zz_dataOut_7_1_1));
    end else begin
      _zz_dataOut_7_1 <= mulDataOut_7[32 : 1];
    end
    if(when_Concat_l133_7) begin
      _zz_dataOut_7 <= 8'h0;
    end else begin
      if(when_Concat_l135_7) begin
        _zz_dataOut_7 <= 8'hff;
      end else begin
        _zz_dataOut_7 <= _zz__zz_dataOut_7;
      end
    end
  end


endmodule

module ConcatZero (
  input      [63:0]   dataIn,
  input      [31:0]   zero,
  output     [31:0]   dataOut_0,
  output     [31:0]   dataOut_1,
  output     [31:0]   dataOut_2,
  output     [31:0]   dataOut_3,
  output     [31:0]   dataOut_4,
  output     [31:0]   dataOut_5,
  output     [31:0]   dataOut_6,
  output     [31:0]   dataOut_7,
  input               clk
);

  wire       [31:0]   add_0_A;
  wire       [31:0]   add_1_A;
  wire       [31:0]   add_2_A;
  wire       [31:0]   add_3_A;
  wire       [31:0]   add_4_A;
  wire       [31:0]   add_5_A;
  wire       [31:0]   add_6_A;
  wire       [31:0]   add_7_A;
  wire       [31:0]   add_0_S;
  wire       [31:0]   add_1_S;
  wire       [31:0]   add_2_S;
  wire       [31:0]   add_3_S;
  wire       [31:0]   add_4_S;
  wire       [31:0]   add_5_S;
  wire       [31:0]   add_6_S;
  wire       [31:0]   add_7_S;
  wire       [15:0]   _zz_A;
  wire       [7:0]    _zz_A_1;
  wire       [15:0]   _zz_A_2;
  wire       [15:0]   _zz_A_3;
  wire       [7:0]    _zz_A_4;
  wire       [15:0]   _zz_A_5;
  wire       [15:0]   _zz_A_6;
  wire       [7:0]    _zz_A_7;
  wire       [15:0]   _zz_A_8;
  wire       [15:0]   _zz_A_9;
  wire       [7:0]    _zz_A_10;
  wire       [15:0]   _zz_A_11;
  wire       [15:0]   _zz_A_12;
  wire       [7:0]    _zz_A_13;
  wire       [15:0]   _zz_A_14;
  wire       [15:0]   _zz_A_15;
  wire       [7:0]    _zz_A_16;
  wire       [15:0]   _zz_A_17;
  wire       [15:0]   _zz_A_18;
  wire       [7:0]    _zz_A_19;
  wire       [15:0]   _zz_A_20;
  wire       [15:0]   _zz_A_21;
  wire       [7:0]    _zz_A_22;
  wire       [15:0]   _zz_A_23;
  wire       [7:0]    dataInTemp_0;
  wire       [7:0]    dataInTemp_1;
  wire       [7:0]    dataInTemp_2;
  wire       [7:0]    dataInTemp_3;
  wire       [7:0]    dataInTemp_4;
  wire       [7:0]    dataInTemp_5;
  wire       [7:0]    dataInTemp_6;
  wire       [7:0]    dataInTemp_7;

  assign _zz_A = {_zz_A_1,dataInTemp_0};
  assign _zz_A_1 = 8'h0;
  assign _zz_A_2 = 16'h0;
  assign _zz_A_3 = {_zz_A_4,dataInTemp_1};
  assign _zz_A_4 = 8'h0;
  assign _zz_A_5 = 16'h0;
  assign _zz_A_6 = {_zz_A_7,dataInTemp_2};
  assign _zz_A_7 = 8'h0;
  assign _zz_A_8 = 16'h0;
  assign _zz_A_9 = {_zz_A_10,dataInTemp_3};
  assign _zz_A_10 = 8'h0;
  assign _zz_A_11 = 16'h0;
  assign _zz_A_12 = {_zz_A_13,dataInTemp_4};
  assign _zz_A_13 = 8'h0;
  assign _zz_A_14 = 16'h0;
  assign _zz_A_15 = {_zz_A_16,dataInTemp_5};
  assign _zz_A_16 = 8'h0;
  assign _zz_A_17 = 16'h0;
  assign _zz_A_18 = {_zz_A_19,dataInTemp_6};
  assign _zz_A_19 = 8'h0;
  assign _zz_A_20 = 16'h0;
  assign _zz_A_21 = {_zz_A_22,dataInTemp_7};
  assign _zz_A_22 = 8'h0;
  assign _zz_A_23 = 16'h0;
  concatAdd add_0 (
    .A   (add_0_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_0_S[31:0]), //o
    .CLK (clk          )  //i
  );
  concatAdd add_1 (
    .A   (add_1_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_1_S[31:0]), //o
    .CLK (clk          )  //i
  );
  concatAdd add_2 (
    .A   (add_2_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_2_S[31:0]), //o
    .CLK (clk          )  //i
  );
  concatAdd add_3 (
    .A   (add_3_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_3_S[31:0]), //o
    .CLK (clk          )  //i
  );
  concatAdd add_4 (
    .A   (add_4_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_4_S[31:0]), //o
    .CLK (clk          )  //i
  );
  concatAdd add_5 (
    .A   (add_5_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_5_S[31:0]), //o
    .CLK (clk          )  //i
  );
  concatAdd add_6 (
    .A   (add_6_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_6_S[31:0]), //o
    .CLK (clk          )  //i
  );
  concatAdd add_7 (
    .A   (add_7_A[31:0]), //i
    .B   (zero[31:0]   ), //i
    .S   (add_7_S[31:0]), //o
    .CLK (clk          )  //i
  );
  assign dataInTemp_0 = dataIn[7 : 0];
  assign dataInTemp_1 = dataIn[15 : 8];
  assign dataInTemp_2 = dataIn[23 : 16];
  assign dataInTemp_3 = dataIn[31 : 24];
  assign dataInTemp_4 = dataIn[39 : 32];
  assign dataInTemp_5 = dataIn[47 : 40];
  assign dataInTemp_6 = dataIn[55 : 48];
  assign dataInTemp_7 = dataIn[63 : 56];
  assign add_0_A = {_zz_A,_zz_A_2};
  assign dataOut_0 = add_0_S;
  assign add_1_A = {_zz_A_3,_zz_A_5};
  assign dataOut_1 = add_1_S;
  assign add_2_A = {_zz_A_6,_zz_A_8};
  assign dataOut_2 = add_2_S;
  assign add_3_A = {_zz_A_9,_zz_A_11};
  assign dataOut_3 = add_3_S;
  assign add_4_A = {_zz_A_12,_zz_A_14};
  assign dataOut_4 = add_4_S;
  assign add_5_A = {_zz_A_15,_zz_A_17};
  assign dataOut_5 = add_5_S;
  assign add_6_A = {_zz_A_18,_zz_A_20};
  assign dataOut_6 = add_6_S;
  assign add_7_A = {_zz_A_21,_zz_A_23};
  assign dataOut_7 = add_7_S;

endmodule

module StreamFifo_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  input               io_flush,
  output     [6:0]    io_occupancy,
  output     [6:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [63:0]   _zz_logic_ram_port0;
  wire       [5:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [5:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [63:0]   _zz_logic_ram_port_1;
  wire       [5:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [5:0]    logic_pushPtr_valueNext;
  reg        [5:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [5:0]    logic_popPtr_valueNext;
  reg        [5:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l1075;
  wire       [5:0]    logic_ptrDif;
  reg [63:0] logic_ram [0:63];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {5'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {5'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  assign _zz_logic_ram_port_1 = io_push_payload;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 6'h3f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 6'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 6'h3f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 6'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l1075 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 6'h0;
      logic_popPtr_value <= 6'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l1075) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  input               io_flush,
  output     [11:0]   io_occupancy,
  output     [11:0]   io_availability,
  input               clk,
  input               reset
);

  reg        [63:0]   _zz_logic_ram_port0;
  wire       [10:0]   _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [10:0]   _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [63:0]   _zz_logic_ram_port_1;
  wire       [10:0]   _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [10:0]   logic_pushPtr_valueNext;
  reg        [10:0]   logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [10:0]   logic_popPtr_valueNext;
  reg        [10:0]   logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l1075;
  wire       [10:0]   logic_ptrDif;
  (* ram_style = "block" *) reg [63:0] logic_ram [0:2047];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {10'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {10'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  assign _zz_logic_ram_port_1 = io_push_payload;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 11'h7ff);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 11'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 11'h7ff);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 11'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l1075 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 11'h0;
      logic_popPtr_value <= 11'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l1075) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule
