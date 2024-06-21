module action_1
#(
    parameter req_key_len   =   144
)(
    input control,
    input[11:0] offset_old,
    input sel,
    input[2048-1:0] message_header,
    input[11:0] offset_inmes_pos,
    input[3:0] offset_inmes_pos_valid_num,
    input[1:0] offset_inmes_kind,                           //00 bit 01 byte 10 4byte 11 8byte
    input[11:0] offset_dir,
    input[11:0] offset_comp,
    output[req_key_len-1:0] req_key,
    output[11:0] offset
);
wire sel_control;
wire[11:0] offset_in_mes;
reg[11:0] offset_in_mes_comp;
wire[11:0] offset_sel;


assign sel_control=control?(!sel):sel;
assign offset_in_mes=message_header[2047-offset_old-offset_inmes_pos+1+:12]&(~(24'b000000000000111111111111<<offset_inmes_pos_valid_num));
always@*begin
    case(offset_inmes_kind)
    2'b00:offset_in_mes_comp=offset_in_mes+offset_comp;
    2'b01:offset_in_mes_comp=(offset_in_mes<<3)+offset_comp;
    2'b10:offset_in_mes_comp=(offset_in_mes<<5)+offset_comp;
    2'b11:offset_in_mes_comp=(offset_in_mes<<6)+offset_comp;
    endcase
end
assign offset_sel=sel_control?offset_dir:offset_in_mes_comp;
assign offset=offset_old+offset_sel;

action_extraction u_action_extraction(
    .message_header(message_header),
    .offset_144bit(offset),
    .req_key(req_key)
);



endmodule


module action_2_offset
#(
    parameter req_key_len   =   144
)(
    input sec_tag,
    input[11:0] sec_offset,
    input control,
    input[11:0] offset_old,
    input sel,
    input[2048-1:0] message_header,
    input[11:0] offset_inmes_pos,
    input[3:0] offset_inmes_pos_valid_num,
    input[1:0] offset_inmes_kind,                           //00 bit 01 byte 10 4byte 11 8byte
    input[11:0] offset_dir,
    input[11:0] offset_comp,
    output[11:0] offset
);
wire sel_control;
wire[11:0] offset_in_mes;
reg[11:0] offset_in_mes_comp;
wire[11:0] offset_sel;


assign sel_control=control?(!sel):sel;
assign offset_in_mes=message_header[2047-offset_old-offset_inmes_pos+1+:12]&(~(24'b000000000000111111111111<<offset_inmes_pos_valid_num));
always@*begin
    case(offset_inmes_kind)
    2'b00:offset_in_mes_comp=offset_in_mes+offset_comp;
    2'b01:offset_in_mes_comp=(offset_in_mes<<3)+offset_comp;
    2'b10:offset_in_mes_comp=(offset_in_mes<<5)+offset_comp;
    2'b11:offset_in_mes_comp=(offset_in_mes<<6)+offset_comp;
    endcase
end
assign offset_sel=sel_control?offset_dir:offset_in_mes_comp;
assign offset=offset_old+offset_sel;

endmodule


