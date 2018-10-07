`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/17 16:27:45
// Design Name: 
// Module Name: DIVU_tb
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


module DIV_tb;
reg [31:0]divisor;
reg [31:0]dividend;
reg start;
reg clock;
reg reset;
wire [31:0]q;
wire [31:0]r;
wire busy;
initial
begin
#5 begin clock<=1;start<=1;reset<=0;dividend<=32'b01010101010101010101010101010101;divisor<=32'b10101010101010101010101010101010;end
#10 begin start<=0;dividend<=32'b01010101010101010101010101010101;divisor<=32'b10101010101010101010101010101010;end
end
always #1 clock=~clock;
DIV
DIV_tb(.dividend(dividend),.divisor(divisor),.start(start),.clock(clock),.reset(reset),.q(q),.r(r),.busy(busy));
endmodule
