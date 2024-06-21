`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/23 19:13:17
// Design Name: 
// Module Name: parser_unit
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


module parser_unit_1(
        input [5769:0] line_message,
        input [2047:0] message,
        input clk,
        input reset,
        input control_in,
        input [143:0] req_key_in,
        input [5:0] valid_num,
        input [11:0] action2_offset_old,
        input [11:0] offset_in,
        output [143:0] req_key_out,
        output [11:0] offset_out,
        output [11:0] action2_offset_out,
        output control_out,
        output reg [2047:0] message_out
        );

    wire[5:0] addr_1;
    wire[44:0] ram_1_out;
    wire[44:0] ram_2_out;
    wire[127:0] ram_3_out;
    reg control_in_d1;
    reg [11:0] offset_in_d1;
    reg [11:0] action2_offset_old_d1;
    wire [63:0]  ipv4_addr;
    wire [255:0] ipv6_addr;
    wire [3:0] valid_tag;

    always@(posedge clk or negedge reset)
    begin
        if(!reset)
        begin
        message_out<=0;
        control_in_d1<=0;
        offset_in_d1<=0;
        action2_offset_old_d1<=0;
        end
        else
        begin
        message_out<=message;
        control_in_d1<=control_in;
        offset_in_d1<=offset_in;
        action2_offset_old_d1<=action2_offset_old;
        end
    end



    tcam u_tcam(
    .line_message(line_message),
    .req_key(req_key_in),
    .valid_num(6'd20),
    .addr_valid(addr_1)
    );

    ram_1 u_ram_1(
    .clka(clk),
    .wea(1'b0),
    .addra(addr_1),
    .douta(ram_1_out)
    );


    action2_offset_ram ram_2 (
    .clka(clk),    // input wire clka
    .wea(1'b0),      // input wire [0 : 0] wea
    .addra(addr_1),  // input wire [4 : 0] addra
    .dina(0),    // input wire [44 : 0] dina
    .douta(ram_2_out)  // output wire [44 : 0] douta
    );

    action2_extraction_ram ram_3 (
    .clka(clk),    // input wire clka
    .wea(1'b0),      // input wire [0 : 0] wea
    .addra(addr_1),  // input wire [4 : 0] addra
    .dina(0),    // input wire [79 : 0] dina
    .douta(ram_3_out)  // output wire [79 : 0] douta
    );





    action_1 u_action_1_1
    (
    .control(control_in_d1),
    .offset_old(offset_in_d1),
    .sel(ram_1_out[44]),
    .message_header(message_out),
    .offset_inmes_pos(ram_1_out[44-2-:12]),
    .offset_inmes_pos_valid_num(ram_1_out[44-2-24-:4]),
    .offset_inmes_kind(ram_1_out[44-2-24-4-:2]),                           //00 bit 01 byte 10 4byte 11 8byte
    .offset_dir(ram_1_out[44-2-12-:12]),
    .offset_comp(ram_1_out[44-2-24-4-2-:12]),
    .req_key(req_key_out),
    .offset(offset_out)
    );

    assign control_out=ram_1_out[43];

    action_2_offset u_action_2_offset
    (
    .sec_tag(0),
    .sec_offset(0),
    .control(0),
    .offset_old(action2_offset_old_d1),
    .sel(ram_2_out[44]),
    .message_header(message_out),
    .offset_inmes_pos(ram_2_out[44-2-:12]),
    .offset_inmes_pos_valid_num(ram_2_out[44-2-24-:4]),
    .offset_inmes_kind(ram_2_out[44-2-24-4-:2]),                           //00 bit 01 byte 10 4byte 11 8byte
    .offset_dir(ram_2_out[44-2-12-:12]),
    .offset_comp(ram_2_out[44-2-24-4-2-:12]),
    .offset(action2_offset_out)
    );


    action2_extr    u_action_extr
(
.ram_in(ram_3_out)         ,
.offset_in(action2_offset_old_d1)       ,
.message_header(message_out)  ,
.offset_8bit(ram_3_out[93:82]),
.vldbit_8bit(ram_3_out[81:78]),
.offset_16bit(ram_3_out[127:104]),
.vldbit_16bit(ram_3_out[103:94]),
.offset_32bit(ram_3_out[77:54])    , 
.offset_128bit(ram_3_out[39:16])   , 
//
.vldbit_32bit(ram_3_out[53:42])    ,
.vldbit_128bit(ram_3_out[15:0])   ,
//

.out_32bit(ipv4_addr)       ,
.out_128bit(ipv6_addr)      ,
.valid_tag(valid_tag)
    );




endmodule
