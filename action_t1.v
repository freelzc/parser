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


module action_extraction
#(
    parameter NUM_8bit      =   1   ,
    parameter NUM_16bit     =   1   ,
    parameter NUM_32bit     =   1   ,
    parameter NUM_64bit     =   1   ,
    parameter NUM_128bit    =   1   ,
    parameter req_key_len   =   144
)
(
input   [2048-1:0]                  message_header  ,
input   [NUM_128bit*12-1:0]         offset_144bit   , 
output  [req_key_len-1:0]           req_key      
    );


wire    [NUM_128bit*144-1:0]        out_144bit      ;







assign out_144bit[0 +: 144] = message_header[2047-offset_144bit[0*12 +: 12] -: 144];
                                    




assign req_key =   out_144bit;

endmodule

