`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 21:56:13
// Design Name: 
// Module Name: control
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


module control(EN_in,SW1,RST,Red1,Red2,Yellow1,Yellow2,Green1,Green2);

output Red1;
output Red2;
output Yellow1;
output Yellow2;
output Green1;
output Green2;

input  [1:0] EN_in;
input  SW1;
input  RST;

reg Red1,Red2,Yellow1,Yellow2,Green1,Green2,D_out;

always @(EN_in,RST,SW1)
begin
	if(SW1==0||RST==0) {Red1,Red2,Yellow1,Yellow2,Green1,Green2}=6'b0;
	else
	  begin
	    case(EN_in)
			2'b00 : {Red1,Red2,Yellow1,Yellow2,Green1,Green2}=6'b010010;
			2'b01 : {Red1,Red2,Yellow1,Yellow2,Green1,Green2}=6'b011000;
			2'b10 : {Red1,Red2,Yellow1,Yellow2,Green1,Green2}=6'b100001;
			2'b11 : {Red1,Red2,Yellow1,Yellow2,Green1,Green2}=6'b100100;
			default : {Red1,Red2,Yellow1,Yellow2,Green1,Green2}=6'b0;
		endcase		
	  end
end
endmodule
