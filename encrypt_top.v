`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:21 03/27/2024 
// Design Name: 
// Module Name:    encrypt_top 
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
module encrypt_top(
    input clk,
    input reset,
    input [0:127] plain_text,
    input [0:127] main_key,
    input [0:127] key_round_1,
    input [0:127] key_round_2,
    input [0:127] key_round_3,
    input [0:127] key_round_4,
    input [0:127] key_round_5,
    input [0:127] key_round_6,
    input [0:127] key_round_7,
    input [0:127] key_round_8,
    input [0:127] key_round_9,
    input [0:127] key_round_10,
    output [0:127] cipher_text
    );
reg [0:127] reg_cipher_text;
wire [0:127]enc_state_in;	
	wire [0:127] enc_state_round1_out;
	wire [0:127] enc_state_round2_in, enc_state_round2_out;
	wire [0:127] enc_state_round3_in, enc_state_round3_out;
	wire [0:127] enc_state_round4_in, enc_state_round4_out;
	wire [0:127]enc_state_round5_in, enc_state_round5_out;
	wire [0:127]enc_state_round6_in, enc_state_round6_out;
	wire [0:127]enc_state_round7_in, enc_state_round7_out;
	wire [0:127]enc_state_round8_in, enc_state_round8_out;
	wire [0:127] enc_state_round9_in, enc_state_round9_out;
	wire [0:127] enc_state_final_round_in, enc_state_final_round_out;
	Add_Round_Key add_round_key(.clk(clk),.reset(reset),.data_in(plain_text),.round_key(main_key),.data_out_add_round_key(enc_state_in));
	encrypt_round Round_1(.clk(clk),.reset(reset),.data_in(enc_state_in),.key_round(key_round_1),.data_encrypt_round(enc_state_round1_out));
	encrypt_round Round_2(.clk(clk),.reset(reset),.data_in(enc_state_round1_out),.key_round(key_round_2),.data_encrypt_round(enc_state_round2_out));
	encrypt_round Round_3(.clk(clk),.reset(reset),.data_in(enc_state_round2_out),.key_round(key_round_3),.data_encrypt_round(enc_state_round3_out));
	encrypt_round Round_4(.clk(clk),.reset(reset),.data_in(enc_state_round3_out),.key_round(key_round_4),.data_encrypt_round(enc_state_round4_out));
	encrypt_round Round_5(.clk(clk),.reset(reset),.data_in(enc_state_round4_out),.key_round(key_round_5),.data_encrypt_round(enc_state_round5_out));
	encrypt_round Round_6(.clk(clk),.reset(reset),.data_in(enc_state_round5_out),.key_round(key_round_6),.data_encrypt_round(enc_state_round6_out));
	encrypt_round Round_7(.clk(clk),.reset(reset),.data_in(enc_state_round6_out),.key_round(key_round_7),.data_encrypt_round(enc_state_round7_out));
	encrypt_round Round_8(.clk(clk),.reset(reset),.data_in(enc_state_round7_out),.key_round(key_round_8),.data_encrypt_round(enc_state_round8_out));
	encrypt_round Round_9(.clk(clk),.reset(reset),.data_in(enc_state_round8_out),.key_round(key_round_9),.data_encrypt_round(enc_state_round9_out));
	encrypt_round_10 Round_10(.clk(clk),.reset(reset),.data_in(enc_state_round9_out),.key_round(key_round_10),.data_encrypt_round(enc_state_final_round_out)
    );
always @(posedge clk)
begin
reg_cipher_text=enc_state_final_round_out;
end
assign cipher_text=reg_cipher_text;


endmodule
