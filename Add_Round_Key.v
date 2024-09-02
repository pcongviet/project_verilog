`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:58 03/27/2024 
// Design Name: 
// Module Name:    Add_Round_Key 
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
module Add_Round_Key(
    input clk,
    input reset,
    input [0:127] data_in,
	 input [0:127] round_key,
    output [0:127] data_out_add_round_key
    );

reg [0:127] reg_add_round_key;
always @(posedge clk)
begin
	if(reset==1)
	begin 
	reg_add_round_key=0;
	end
	else
	begin
	reg_add_round_key=data_in^round_key;
	end
end
assign  data_out_add_round_key=reg_add_round_key;

endmodule
