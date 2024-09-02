`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:35 03/21/2024 
// Design Name: 
// Module Name:    Expand_key 
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
module Expand_key(
input clk,
input rst,
input exp_en,
input [0:127] key_main,
output [0:127] key_r1,
output [0:127] key_r2,
output [0:127] key_r3,
output [0:127] key_r4,
output [0:127] key_r5,
output [0:127] key_r6,
output [0:127] key_r7,
output [0:127] key_r8,
output [0:127] key_r9,
output [0:127] key_r10
    );

sinh_key_phu key1 (.clk(clk),.reset(rst),.exp_en(exp_en),.RCj(8'h01),.key(key_main),.subkey(key_r1));
sinh_key_phu key2 (.clk(clk),.reset(rst),.exp_en(exp_en),.RCj(8'h02),.key(key_r1),.subkey(key_r2));
sinh_key_phu key3 (.clk(clk),.reset(rst),.exp_en(exp_en),.RCj(8'h04),.key(key_r2),.subkey(key_r3));
sinh_key_phu key4 (.clk(clk),.reset(rst),.exp_en(exp_en),.RCj(8'h08),.key(key_r3),.subkey(key_r4));
sinh_key_phu key5 (.clk(clk),.reset(rst),.exp_en(exp_en),.RCj(8'h10),.key(key_r4),.subkey(key_r5));
sinh_key_phu key6 (.clk(clk),.reset(rst),.exp_en(exp_en),.RCj(8'h20),.key(key_r5),.subkey(key_r6));
sinh_key_phu key7 (.clk(clk),.reset(rst),.exp_en(exp_en),.RCj(8'h40),.key(key_r6),.subkey(key_r7));
sinh_key_phu key8 (.clk(clk),.reset(rst),.exp_en(exp_en),.RCj(8'h80),.key(key_r7),.subkey(key_r8));
sinh_key_phu key9 (.clk(clk),.reset(rst),.exp_en(exp_en),.RCj(8'h1b),.key(key_r8),.subkey(key_r9));
sinh_key_phu key10 (.clk(clk),.reset(rst),.exp_en(exp_en),.RCj(8'h36),.key(key_r9),.subkey(key_r10));
endmodule
