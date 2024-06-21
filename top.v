`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 10:38:23
// Design Name: 
// Module Name: top
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


module top(
input [2047:0] message,
input clk,
input reset
    );
    wire[143:0] req_key_out_1;
    wire[143:0] req_key_out_2;
    wire[143:0] req_key_out_3;
    wire[143:0] req_key_out_4;
    wire[143:0] req_key_out_5;
    wire[143:0] req_key_out_6;
    wire[143:0] req_key_out_7;
    wire[143:0] req_key_out_8;
    wire[143:0] req_key_out_9;
    wire[143:0] req_key_out_10;






    wire[11:0] offset_out_1;
    wire[11:0] offset_out_2;
    wire[11:0] offset_out_3;
    wire[11:0] offset_out_4;
    wire[11:0] offset_out_5;
    wire[11:0] offset_out_6;
    wire[11:0] offset_out_7;
    wire[11:0] offset_out_8;
    wire[11:0] offset_out_9;
    wire[11:0] offset_out_10;






    wire[11:0] action2_offset_out_1;
    wire[11:0] action2_offset_out_2;
    wire[11:0] action2_offset_out_3;
    wire[11:0] action2_offset_out_4;
    wire[11:0] action2_offset_out_5;
    wire[11:0] action2_offset_out_6;
    wire[11:0] action2_offset_out_7;
    wire[11:0] action2_offset_out_8;
    wire[11:0] action2_offset_out_9;
    wire[11:0] action2_offset_out_10;


    wire control_out_1;
    wire control_out_2;
    wire control_out_3;
    wire control_out_4;
    wire control_out_5;
    wire control_out_6;
    wire control_out_7;
    wire control_out_8;
    wire control_out_9;
    wire control_out_10;

    wire[2047:0] message_out_1;
    wire[2047:0] message_out_2;
    wire[2047:0] message_out_3;
    wire[2047:0] message_out_4;
    wire[2047:0] message_out_5;
    wire[2047:0] message_out_6;
    wire[2047:0] message_out_7;
    wire[2047:0] message_out_8;
    wire[2047:0] message_out_9;
    wire[2047:0] message_out_10;


parser_unit_1 parser_1(

.line_message(2304'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffff8100ffffffffffffffffffffffffffffffff0000ffff0000ffffffffffffffffffffffff8100ffff8100ffffffffffffffffffffffff),
.message(message),
.clk(clk),
.reset(reset),
.control_in(1'b0),
.req_key_in(message[2047-12*8-:144/*2047-12*8-:16*/]),
.valid_num(6'd20),
.action2_offset_old(12'd112),
.offset_in(12'd96),
.req_key_out(req_key_out_1),
.offset_out(offset_out_1),
.action2_offset_out(action2_offset_out_1),
.control_out(control_out_1),
.message_out(message_out_1)
 );


parser_unit_1 parser_2(
.line_message(2304'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffffefffffffefffffffefffffffeff8847fffff0fffffff0fffffff0fffffff1ff0000fffffefffffffefffffffeffffffffff8847fffff0fffffff0fffffff1ffffffffff0000fffffefffffffeffffffffffffffffff8847fffff0fffffff1ffffffffffffffffff0000fffffeffffffffffffffffffffffffff8847fffff1ffffffffffffffffffffffffff),
.message(message_out_1),
.clk(clk),
.reset(reset),
.control_in(control_out_1),
.req_key_in(req_key_out_1),
.valid_num(6'd20),
.offset_in(offset_out_1),
.req_key_out(req_key_out_2),
.offset_out(offset_out_2),
.control_out(control_out_2),
.message_out(message_out_2),
.action2_offset_old(action2_offset_out_1),
.action2_offset_out(action2_offset_out_2)
 );

parser_unit_1 parser_3(
.line_message(2304'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffff0806ffffffffffffffffffffffffffffffff0000ffffffffffffffffffffffffffffffff86ddffffffffffffffffffffffffffffffff0000ffffffffffffffffffffffffffffffff0800ffffffffffffffffffffffffffffffff),
.message(message_out_2),
.clk(clk),
.reset(reset),
.control_in(control_out_2),
.req_key_in(req_key_out_2),
.valid_num(6'd20),
.offset_in(offset_out_2),
.req_key_out(req_key_out_3),
.offset_out(offset_out_3),
.control_out(control_out_3),
.message_out(message_out_3),
.action2_offset_old(action2_offset_out_2),
.action2_offset_out(action2_offset_out_3)
 );

parser_unit_1 parser_4(
.line_message(5760'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffffffffffffffffffffffffffffffffff6fffffffffffffffffffffffffffffffffff0fffffffffffffffffffffffffffffffffff4fffffffffffffffffffffffffffffffffff),
.message(message_out_3),
.clk(clk),
.reset(reset),
.control_in(control_out_3),
.req_key_in(req_key_out_3),
.valid_num(6'd20),
.offset_in(offset_out_3),
.req_key_out(req_key_out_4),
.offset_out(offset_out_4),
.control_out(control_out_4),
.message_out(message_out_4),
.action2_offset_old(action2_offset_out_3),
.action2_offset_out(action2_offset_out_4)
 );

 parser_unit_1 parser_5(
.line_message(5760'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffff00ffffffffffffffffffffffffffffffffff),
.message(message_out_4),
.clk(clk),
.reset(reset),
.control_in(control_out_4),
.req_key_in(req_key_out_4),
.valid_num(6'd20),
.offset_in(offset_out_4),
.req_key_out(req_key_out_5),
.offset_out(offset_out_5),
.control_out(control_out_5),
.message_out(message_out_5),
.action2_offset_old(action2_offset_out_4),
.action2_offset_out(action2_offset_out_5)
 );



parser_unit_1 parser_6(
.line_message(5760'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffff3cffffffffffffffffffffffffffffffffff),
.message(message_out_5),
.clk(clk),
.reset(reset),
.control_in(control_out_5),
.req_key_in(req_key_out_5),
.valid_num(6'd20),
.offset_in(offset_out_5),
.req_key_out(req_key_out_6),
.offset_out(offset_out_6),
.control_out(control_out_6),
.message_out(message_out_6),
.action2_offset_old(action2_offset_out_5),
.action2_offset_out(action2_offset_out_6)
 );

parser_unit_1 parser_7(
.line_message(5760'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffff2bffffffffffffffffffffffffffffffffff),
.message(message_out_6),
.clk(clk),
.reset(reset),
.control_in(control_out_6),
.req_key_in(req_key_out_6),
.valid_num(6'd20),
.offset_in(offset_out_6),
.req_key_out(req_key_out_7),
.offset_out(offset_out_7),
.control_out(control_out_7),
.message_out(message_out_7),
.action2_offset_old(action2_offset_out_6),
.action2_offset_out(action2_offset_out_7)
 );


parser_unit_1 parser_8(
.line_message(5760'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffff2cffffffffffffffffffffffffffffffffff),
.message(message_out_7),
.clk(clk),
.reset(reset),
.control_in(control_out_7),
.req_key_in(req_key_out_7),
.valid_num(6'd20),
.offset_in(offset_out_7),
.req_key_out(req_key_out_8),
.offset_out(offset_out_8),
.control_out(control_out_8),
.message_out(message_out_8),
.action2_offset_old(action2_offset_out_7),
.action2_offset_out(action2_offset_out_8)
 );



parser_unit_1 parser_9(
.line_message(5760'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffff33ffffffffffffffffffffffffffffffffff00ffffffffffffffffffffffffffffffffff32ffffffffffffffffffffffffffffffffff00ffffffffffffffffffffffffffffffffff3cffffffffffffffffffffffffffffffffff),
.message(message_out_8),
.clk(clk),
.reset(reset),
.control_in(control_out_8),
.req_key_in(req_key_out_8),
.valid_num(6'd20),
.offset_in(offset_out_8),
.req_key_out(req_key_out_9),
.offset_out(offset_out_9),
.control_out(control_out_9),
.message_out(message_out_9),
.action2_offset_old(action2_offset_out_8),
.action2_offset_out(action2_offset_out_9)
 );



parser_unit_1 parser_10(
.line_message(5760'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffff3affffffffffffffffffffffffffffffffff00ffffffffffffffffffffffffffffffffff11ffffffffffffffffffffffffffffffffff00ffffffffffffffffffffffffffffffffff06ffffffffffffffffffffffffffffffffff),
.message(message_out_9),
.clk(clk),
.reset(reset),
.control_in(control_out_9),
.req_key_in(req_key_out_9),
.valid_num(6'd20),
.offset_in(offset_out_9),
.req_key_out(req_key_out_10),
.offset_out(offset_out_10),
.control_out(control_out_10),
.message_out(message_out_10),
.action2_offset_old(action2_offset_out_9),
.action2_offset_out(action2_offset_out_10)
 );
    
    
endmodule
