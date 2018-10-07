`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 19:28:36
// Design Name: 
// Module Name: ALU
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/04 08:03:23
// Design Name: 
// Module Name: alu
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

module ALU(
    input [3:0] ALUopcode,
    input [31:0] rega,
    input [31:0] regb,
    output reg [31:0] result,
    output zero
    );

   assign zero = (result==0)?1:0;
   always @( ALUopcode or rega or regb ) begin
      case (ALUopcode)
         4'b0000 : result = rega + regb;
         4'b0001 : result = rega - regb;
         4'b0010 : result = (rega == regb)?1:0;
         4'b0011 : result = regb << rega;
         4'b0100 : result = rega & regb;
         4'b0101 : result = (!rega) & regb;
         4'b0110 : result = rega ^ regb; 
         4'b0111 : result = rega ^~ regb;
         4'b1000 : result = rega | regb; 
         4'b1001 : result=  (rega>regb)?1:0;
         4'b1010 : result=  (rega<regb)?1:0;
         4'b1011 : result=  (rega==regb)?1:0;
         // 4'b1001 : result = (rega < regb)?1:0;
      default : begin
         result = 32'h00000000;
         $display (" no match");
        end
     endcase
   end
endmodule

