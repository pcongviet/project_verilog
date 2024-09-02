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
module AES_128_encrypt(
    input clk,
    input reset,
	 input enc_en,
    input [0:127] plain_text,
    input [0:127] key,
    output [0:127] cipher_text
    );
	 wire [0:127] key_round1;
	 wire [0:127] key_round2;
	 wire [0:127] key_round3;
	 wire [0:127] key_round4;
	 wire [0:127] key_round5;
	 wire [0:127] key_round6;
	 wire [0:127] key_round7;
	 wire [0:127] key_round8;
	 wire [0:127] key_round9;
	 wire [0:127] key_round10;
	 wire [0:127] cipher_textt;
	 reg [0:7] counter;
	 reg [0:127] reg_cipher;
	 reg [0:127] reg_plain;
Expand_key expand_key(.clk(clk),.rst(reset),.exp_en(enc_en),.key_main(key),.key_r1(key_round1),.key_r2(key_round2),.key_r3(key_round3),.key_r4(key_round4),.key_r5(key_round5)
,.key_r6(key_round6),.key_r7(key_round7),.key_r8(key_round8),.key_r9(key_round9),.key_r10(key_round10));
encrypt_top encrypt_block(
.clk(clk),
.reset(reset),
.plain_text(plain_text),
.main_key(key),
.key_round_1(key_round1),
.key_round_2(key_round2),
.key_round_3(key_round3),
.key_round_4(key_round4),
.key_round_5(key_round5),
.key_round_6(key_round6),
.key_round_7(key_round7),
.key_round_8(key_round8),
.key_round_9(key_round9),
.key_round_10(key_round10),
.cipher_text(cipher_textt)
    ); 
	 always@(posedge clk)
	 begin
	 if(reset ==1)
	 begin
		counter=0;
		reg_cipher=0;
	 end
	 else
	 begin
		 if(reg_plain==plain_text)
		 begin
			if(counter<8'd50)
			begin
				reg_cipher=127'b0;
				counter=counter+1;
			end
			else
			begin
				counter=counter;
				reg_cipher=cipher_textt;
			end
		 end
		 else
		 begin
				counter=0;
				reg_plain=plain_text;
		 end
		 
		
	 end
	 end
	 assign cipher_text=reg_cipher;
endmodule
