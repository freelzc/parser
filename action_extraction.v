`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/17 10:20:40
// Design Name: 
// Module Name: action_extraction
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module action2_extr
#(
    parameter NUM_8bit      =   1   ,
    parameter NUM_16bit     =   2   ,
    parameter NUM_32bit     =   2   ,
    parameter NUM_64bit     =   0   ,
    parameter NUM_128bit    =   2
)
(
input   [79:0]                      ram_in          ,
input   [11:0]                      offset_in       ,
input   [2048-1:0]                  message_header  ,
input   [NUM_8bit*12-1:0]           offset_8bit     ,  //2^11=2048
input   [NUM_16bit*12-1:0]          offset_16bit    , 
input   [NUM_32bit*12-1:0]          offset_32bit    , 
input   [NUM_64bit*12-1:0]          offset_64bit    , 
input   [NUM_128bit*12-1:0]         offset_128bit   , 
//
input   [NUM_8bit*4-1:0]            vldbit_8bit     ,
input   [NUM_16bit*5-1:0]           vldbit_16bit    ,
input   [NUM_32bit*6-1:0]           vldbit_32bit    ,
input   [NUM_64bit*7-1:0]           vldbit_64bit    ,
input   [NUM_128bit*8-1:0]          vldbit_128bit   ,
//
output  [NUM_8bit*8-1:0]            out_8bit        ,
output  [NUM_16bit*16-1:0]          out_16bit       ,
output  [NUM_32bit*32-1:0]          out_32bit       ,
output  [NUM_64bit*64-1:0]          out_64bit       ,
output  [NUM_128bit*128-1:0]        out_128bit      ,
output  [(NUM_8bit+NUM_16bit+NUM_32bit+NUM_64bit+NUM_128bit-1):0]               valid_tag
    );

genvar i_1;
generate
    for(i_1=0;i_1<NUM_8bit;i_1=i_1+1) begin
        assign out_8bit[i_1*8 +: 8] = message_header[2047-offset_in-offset_8bit[i_1*12 +: 12]    -:  8]
                                        &   ((16'b1111111100000000   >>  vldbit_8bit[i_1*4 +: 4]));
    end
endgenerate

genvar i_2;
generate
    for(i_2=0;i_2<NUM_16bit;i_2=i_2+1) begin
        assign out_16bit[i_2*16 +: 16] = message_header[2047-offset_in-offset_16bit[i_2*12 +: 12]    -:  16]   
                                        &   (32'b11111111111111110000000000000000   >>  vldbit_16bit[i_2*5 +: 5]);
    end
endgenerate

genvar i_3;
generate
    for(i_3=0;i_3<NUM_32bit;i_3=i_3+1) begin
        assign out_32bit[i_3*32 +: 32] = message_header[2047-offset_in-offset_32bit[i_3*12 +: 12]    -:  32]   
                                        &   ((64'b1111111111111111111111111111111100000000000000000000000000000000   >>  vldbit_32bit[i_3*6 +: 6]));
    end
endgenerate

genvar i_4;
generate
    for(i_4=0;i_4<NUM_64bit;i_4=i_4+1) begin
        assign out_64bit[i_4*64 +: 64] = message_header[2047-offset_in-offset_64bit[i_4*12 +: 12]    -:  64]   
                                        &   ((128'b11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000   >>  vldbit_64bit[i_4*7 +: 7]));
    end
endgenerate

genvar i_5;
generate
    for (i_5 = 0; i_5 < NUM_128bit; i_5 = i_5 + 1) begin
        assign out_128bit[i_5*128 +: 128] = message_header[2047-offset_in-offset_128bit[i_5*12 +: 12] -: 128]
                                        & ((256'b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 >> vldbit_128bit[i_5*8 +: 8]));
    end
endgenerate




assign  valid_tag={ram_in[79:78],ram_in[41:40]};


endmodule

