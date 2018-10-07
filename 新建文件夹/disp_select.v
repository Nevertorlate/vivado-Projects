`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 21:58:43
// Design Name: 
// Module Name: disp_select
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dispdecoder(data_in,data_out);
output [7:0] data_out;
input  [3:0] data_in;
reg [7:0] data_out;

always @(data_in)
begin
	case(data_in)
    	4'b0000 : data_out <= 8'b11000000;  //0
		4'b0001 : data_out <= 8'b11111001;  //1
		4'b0010 : data_out <= 8'b10100100;  //2
		4'b0011 : data_out <= 8'b10110000;  //3
		4'b0100 : data_out <= 8'b10011001;  //4
		4'b0101 : data_out <= 8'b10010010;  //5
		4'b0110 : data_out <= 8'b10000010;  //6
		4'b0111 : data_out <= 8'b11111000;  //7
		4'b1000 : data_out <= 8'b10000000;  //8
		4'b1001 : data_out <= 8'b10010000;  //9
		default : data_out <= 8'b11000000;
	endcase
end
endmodule

