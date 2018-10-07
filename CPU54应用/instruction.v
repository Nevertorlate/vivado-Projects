`timescale 1ns / 1ps
module instruction(input [5:0]operation_front,input [4:0]instruction25_21,input [4:0]instruction20_16,input [5:0]operation_code,
output reg [5:0]decoder_instruction,output reg enable_mf,output reg enable_mt);
always@(*)begin enable_mt=(operation_front ==6'b010000&&instruction25_21==5'b00100)?1:0;enable_mf=(operation_front ==6'b010000&&instruction25_21==5'b00000)?1:0; 
if(operation_front==6'b010000&&operation_code==5'b011000 && instruction25_21[4]==1)decoder_instruction=34;
if(operation_front ==6'b010000&&instruction25_21==5'b00100)decoder_instruction=45;
if(operation_front==6'b010000&&instruction25_21==5'b00000)decoder_instruction=42;
if(operation_front==6'b000001&&instruction20_16==5'b00001)decoder_instruction=52;
case(operation_front)          
6'b000000:begin case(operation_code)
6'b100001:decoder_instruction=9;
6'b100100:decoder_instruction=10;
6'b001000:decoder_instruction=15;
6'b100110:decoder_instruction=17;
6'b100111:decoder_instruction=18;
6'b100101:decoder_instruction=19;
6'b000000:decoder_instruction=20;
6'b000100:decoder_instruction=21;
6'b101011:decoder_instruction=22;                     
6'b000011:decoder_instruction=23;
6'b000010:decoder_instruction=24;
6'b100011:decoder_instruction=25;
6'b100000:decoder_instruction=27;
6'b100010:decoder_instruction=28;
6'b101010:decoder_instruction=29;
6'b000110:decoder_instruction=30;
6'b000111:decoder_instruction=31;
6'b011011:decoder_instruction=33;
6'b001001:decoder_instruction=35;
6'b010000:decoder_instruction=43;
6'b010001:decoder_instruction=46;
6'b010010:decoder_instruction=44;
6'b010011:decoder_instruction=47;
6'b011001:decoder_instruction=49;
6'b001100:decoder_instruction=50;
6'b110100:decoder_instruction=51;
6'b001101:decoder_instruction=53;
6'b011010:decoder_instruction=54;endcase end
6'b000010:decoder_instruction=13;
6'b000011:decoder_instruction=14;
6'b001000:decoder_instruction=1;
6'b001001:decoder_instruction=2;
6'b001100:decoder_instruction=3;
6'b001101:decoder_instruction=4;			
6'b001110:decoder_instruction=7;				
6'b101011:decoder_instruction=26;				
6'b100011:decoder_instruction=16;	
6'b000100:decoder_instruction=11;
6'b000101:decoder_instruction=12;
6'b001010:decoder_instruction=8;
6'b001011:decoder_instruction=5;
6'b001111:decoder_instruction=6;
6'b011100:begin case(operation_code)
6'b100000:decoder_instruction=32;
6'b000010:decoder_instruction=48;endcase end
6'b101001:decoder_instruction=40;
6'b100000:decoder_instruction=36;
6'b101000:decoder_instruction=39;
6'b100100:decoder_instruction=37;
6'b100001:decoder_instruction=41;
6'b100101:decoder_instruction=38;
endcase end endmodule