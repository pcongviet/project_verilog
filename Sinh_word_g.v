`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:41 03/14/2024 
// Design Name: 
// Module Name:    Sinh_word_g 
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
module Sinh_word_g(
    input clk,
    input reset,
    input [0:31] w,
    input [0:7] RCj,
    output [0:31] w_out
    );
	 wire [0:31] temp;
	 reg [0:7] tam;
	 reg [0:31] RCj_core = 32'b0;
	 reg [0:31] reg_shift_left;
	 always@(posedge clk)
	 begin
	 if(reset ==1)
	 begin
	 tam=0;
	 RCj_core=0;
	 reg_shift_left=0;
	 end
	 else
	 begin
	 reg_shift_left= w<<8;
	 reg_shift_left[24:31]=w[0:7];
	 RCj_core[0:7]=RCj;
	 end
	 end

		sbox sbox1(.in(reg_shift_left[24:31]),.sbox(temp[24:31]));
		sbox sbox2(.in(reg_shift_left[16:23]),.sbox(temp[16:23]));
		sbox sbox3(.in(reg_shift_left[8:15]),.sbox(temp[8:15]));
		sbox sbox4(.in(reg_shift_left[0:7]),.sbox(temp[0:7]));
	
assign w_out= (temp^RCj_core);
endmodule