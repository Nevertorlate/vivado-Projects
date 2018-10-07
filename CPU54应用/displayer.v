`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 22:44:30
// Design Name: 
// Module Name: displayer
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

module display7(iData,oData);
input [3:0]iData;
output [6:0]oData;
reg [6:0]oData;
always @(iData)
begin
case(iData)
4'b0000:begin oData=7'b1000000;end
4'b0001:begin oData=7'b1111001;end
4'b0010:begin oData=7'b0100100;end
4'b0011:begin oData=7'b0110000;end
4'b0100:begin oData=7'b0011001;end
4'b0101:begin oData=7'b0010010;end
4'b0110:begin oData=7'b0000010;end
4'b0111:begin oData=7'b1111000;end
4'b1000:begin oData=7'b0000000;end
4'b1001:begin oData=7'b0010000;end
default:begin oData=7'b0000000;end
endcase
end
endmodule

