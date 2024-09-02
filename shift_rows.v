`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:54 03/22/2024 
// Design Name: 
// Module Name:    shift_rows 
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
module shift_rows(
input[0:127] data_in,
input clk,
output [0:127] data_out_shift
    );
reg [0:127] temp;

always @(posedge clk)

begin
	temp[0:7]=data_in[0:7];
	temp[8:15]=data_in[40:47];
	temp[16:23]=data_in[80:87];
	temp[24:31]=data_in[120:127];
	temp[32:39]=data_in[32:39];
	temp[40:47]=data_in[72:79];
	temp[48:55]=data_in[112:119];
	temp[56:63]=data_in[24:31];
	temp[64:71]=data_in[64:71];
	temp[72:79]=data_in[104:111];
	temp[80:87]=data_in[16:23];
	temp[88:95]=data_in[56:63];
	temp[96:103]=data_in[96:103];
	temp[104:111]=data_in[8:15];
	temp[112:119]=data_in[48:55];
	temp[120:127]=data_in[88:95];
end
assign data_out_shift=temp;
endmodule
