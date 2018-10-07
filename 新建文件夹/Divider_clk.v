`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 22:42:14
// Design Name: 
// Module Name: Divider_clk
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


module Divider_instr(input I_CLK,input Rst,output reg O_CLK);
reg [27:0]cnt;
parameter N=50000000;
always@(posedge I_CLK)
begin
if(Rst)
begin
cnt<=0;
O_CLK<=0;
end
else
begin
if(cnt==N/2-1)
 begin O_CLK <= !O_CLK; cnt<=0; end
else
cnt <= cnt + 1;
end
end
endmodule

