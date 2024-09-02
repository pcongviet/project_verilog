`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:05:36 03/15/2024 
// Design Name: 
// Module Name:    sinh_key_phu 
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
module sinh_key_phu(
    input clk,
    input reset,
	 input exp_en,
    input [0:7] RCj,
    input [0:127] key,
    output [0:127] subkey
    );

wire [0:31] w_out;
reg [0:31] g;
reg [0:127] key_in;
reg [0:127] key_out;
Sinh_word_g ic1(.clk(clk),.reset(reset),.w(key[96:127]),.RCj(RCj),.w_out(w_out));
always@(posedge clk)
begin
	if(reset == 1)
	begin
		g=0;
		key_in=0;
		key_out=0;
	end
	else
	begin
		if(exp_en == 1)
		begin
		g=0;
		key_in=0;
		key_out=0;
		end
		else
		begin
			key_in=key;
			g=w_out;
			key_out[0:31]=key_in[0:31]^g;
			key_out[32:63]=key_in[32:63]^key_out[0:31];
			key_out[64:95]=key_in[64:95]^key_out[32:63];
			key_out[96:127]=key_in[96:127]^key_out[64:95];
		end
	end
end
assign subkey=key_out;
endmodule
