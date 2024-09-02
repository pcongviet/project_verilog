`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:29:03 03/27/2024 
// Design Name: 
// Module Name:    encrypt_round_10 
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
module encrypt_round_10(
    input clk,
    input reset,
    input [0:127] data_in,
    input [0:127] key_round,
    output [0:127] data_encrypt_round
    );

wire [0:127] out_sub_bytes;
wire [0:127] out_shift_rows;
wire [0:127] out_add_round_key;


reg [0:127] reg_data_encrypt_round;
sub_bytes_ver_2 round_sb(.clk(clk),.reset(reset),.state_sb_in(data_in),.state_sb_out(out_sub_bytes));
shift_rows round_sr(.data_in(out_sub_bytes),.clk(clk),.data_out_shift(out_shift_rows));
Add_Round_Key round_ar(.clk(clk),.reset(reset),.data_in(out_shift_rows),.round_key(key_round),.data_out_add_round_key(out_add_round_key));

always @*
begin
	reg_data_encrypt_round=out_add_round_key;
end
assign data_encrypt_round=reg_data_encrypt_round;

endmodule
