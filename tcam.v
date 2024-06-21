`timescale 1ns/1ps
module tcam #(
	parameter ADDR_WIDTH = 3,
	parameter KEY_WIDTH = 144,
	parameter TCAM_SUM = 8
)
(
    input [KEY_WIDTH*2*TCAM_SUM:0] line_message,                 //ע��˴�����λ���ܴ��λ����z��������˸�λ��Ҫ���ó�f�����ó�0�ᵼ��match�źŸ�Ϊ1��λΪx
	input [KEY_WIDTH-1:0]req_key,             
    input [ADDR_WIDTH-1:0]valid_num,
	output reg [ADDR_WIDTH-1:0]addr_valid
);

wire [ADDR_WIDTH-1:0]addr;
wire [2*KEY_WIDTH-1:0] line [TCAM_SUM-1:0];

genvar i;
generate
    for(i=0; i<TCAM_SUM; i=i+1) begin:BLOCK1
        assign line[i]=line_message[i*KEY_WIDTH*2+KEY_WIDTH*2-1:i*KEY_WIDTH*2];
    end
endgenerate

wire [TCAM_SUM-1:0] match;

/*
genvar j;
generate
    for(j=0; j<TCAM_SUM; j=j+1) begin:BLOCK2
        assign addr=(line[j][KEY_WIDTH-1:0]^req_key)&(~line[j][2*KEY_WIDTH-1:KEY_WIDTH])?j:TCAM_SUM;
    end
endgenerate
*/

genvar j;
generate
    for(j=0; j<TCAM_SUM; j=j+1) begin:BLOCK2
        assign match[j]=(line[j][KEY_WIDTH-1:0]^req_key)&(~line[j][2*KEY_WIDTH-1:KEY_WIDTH])?1'b0:1'b1;
    end
endgenerate







wire    [3:0]   tmp0;
wire    [1:0]   tmp1;

wire    [2:0]   index;

    


assign index[2] = ~(|match[3:0]);
assign tmp0 = index[2] ? match[7:4] : match[3:0];

assign index[1] = ~(|tmp0[1:0]);
assign tmp1 = index[1] ? tmp0[3:2] : tmp0[1:0];

assign index[0] = ~tmp1[0]; 


assign addr=match?index:(TCAM_SUM-1);










always@*
begin
    if(addr<valid_num)
    addr_valid=addr;
    else
    addr_valid=TCAM_SUM-1;
end



endmodule