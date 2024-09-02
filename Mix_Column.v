`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:05:20 03/27/2024 
// Design Name: 
// Module Name:    Mix_Column 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mix_Column(
    input clk,
    input reset,
    input [0:127] data_in,
    output [0:127] data_out
    );
	 reg [0:127] reg_data;
	 reg [0:127] reg_data_mix_column;
always @(posedge clk)
begin
if(reset ==1)
begin
reg_data=0;
reg_data_mix_column=0;
end
else 
begin
	reg_data= data_in;
	
	//column_1
	reg_data_mix_column[0:7] = mul_2(reg_data[0:7])^mul_3(reg_data[8:15])^reg_data[16:23]^reg_data[24:31];
	reg_data_mix_column[8:15] = reg_data[0:7]^mul_2(reg_data[8:15])^mul_3(reg_data[16:23])^reg_data[24:31];
	reg_data_mix_column[16:23] = reg_data[0:7]^reg_data[8:15]^mul_2(reg_data[16:23])^mul_3(reg_data[24:31]);
	reg_data_mix_column[24:31] = mul_3(reg_data[0:7])^reg_data[8:15]^reg_data[16:23]^mul_2(reg_data[24:31]);
	//column_2
	reg_data_mix_column[32:39] = mul_2(reg_data[32:39])^mul_3(reg_data[40:47])^reg_data[48:55]^reg_data[56:63];
	reg_data_mix_column[40:47] = reg_data[32:39]^mul_2(reg_data[40:47])^mul_3(reg_data[48:55])^reg_data[56:63];
	reg_data_mix_column[48:55] = reg_data[32:39]^reg_data[40:47]^mul_2(reg_data[48:55])^mul_3(reg_data[56:63]);
	reg_data_mix_column[56:63] = mul_3(reg_data[32:39])^reg_data[40:47]^reg_data[48:55]^mul_2(reg_data[56:63]);
	//column_3
	reg_data_mix_column[64:71] = mul_2(reg_data[64:71])^mul_3(reg_data[72:79])^reg_data[80:87]^reg_data[88:95];
	reg_data_mix_column[72:79] = reg_data[64:71]^mul_2(reg_data[72:79])^mul_3(reg_data[80:87])^reg_data[88:95];
	reg_data_mix_column[80:87] = reg_data[64:71]^reg_data[72:79]^mul_2(reg_data[80:87])^mul_3(reg_data[88:95]);
	reg_data_mix_column[88:95] = mul_3(reg_data[64:71])^reg_data[72:79]^reg_data[80:87]^mul_2(reg_data[88:95]);
	//column_4
	reg_data_mix_column[96:103] = mul_2(reg_data[96:103])^mul_3(reg_data[104:111])^reg_data[112:119]^reg_data[120:127];
	reg_data_mix_column[104:111] = reg_data[96:103]^mul_2(reg_data[104:111])^mul_3(reg_data[112:119])^reg_data[120:127];
	reg_data_mix_column[112:119] = reg_data[96:103]^reg_data[104:111]^mul_2(reg_data[112:119])^mul_3(reg_data[120:127]);
	reg_data_mix_column[120:127] = mul_3(reg_data[96:103])^reg_data[104:111]^reg_data[112:119]^mul_2(reg_data[120:127]);
end
end
assign data_out=reg_data_mix_column;

function[0:7] mul_2;
input [0:7] a;

if(a<8'h80)
		mul_2=a<<1;

else
		mul_2=(a<<1)^8'b00011011;

endfunction
function [0:7]mul_3;
input [0:7] a;
if(a<8'h80)
		mul_3=a^(a<<1);

else
		mul_3=a^((a<<1)^8'b00011011);

endfunction
endmodule
