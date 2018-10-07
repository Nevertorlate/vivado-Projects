`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 22:31:28
// Design Name: 
// Module Name: DIV_temp
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


module DIV_temp(input [31:0]dividend,
input [31:0]divisor,
input start,
input clock,
input reset,
output reg [31:0]q,
output reg [31:0]r,
output reg busy
);
wire ready;
wire [31:0]q_select;
wire [31:0]r_select;
wire [31:0]divide;
wire [31:0]diviso;
wire [31:0]middle_divide;
wire [31:0]middle_diviso;
reg [31:0]replace_den;
assign middle_divide=dividend-32'b1;
assign middle_diviso=divisor-32'b1;
assign divide=(dividend[31]==1'b1)?{1'b0,~middle_divide}:dividend;
assign diviso=(divisor[31]==1'b1)?{1'b0,~middle_diviso}:divisor;
reg [4:0]count;
reg [31:0]reg_q;
reg [31:0]reg_r;
reg [31:0]reg_b;
reg busy2,r_sign;
assign ready=~busy&busy2;
wire [32:0]sub_add=r_sign?({reg_r,q_select[31]}+{1'b0,reg_b}):({reg_r,q_select[31]}-{1'b0,reg_b});
assign r_select=r_sign?reg_r+reg_b:reg_r;
assign q_select=reg_q;
always @(posedge clock or posedge reset)begin
if(reset==1)begin
count<=5'b0;
busy<=0;
busy2<=0;
end else begin
 busy2<=busy;
 if(start)begin
 reg_r<=32'b0;
 r_sign<=0;
 reg_q<=divide;
 reg_b<=diviso;
 count<=5'b0;
 busy<=1'b1;
 end 
 else if(busy)
 begin
 reg_r<=sub_add[31:0];
 r_sign<=sub_add[32];
 reg_q<={reg_q[30:0],~sub_add[32]};
 count<=count+5'b1;
 if(count==5'b11111) busy<=0;
 end
end
end
reg [31:0]replace_final;
always @(posedge clock)begin
if(dividend[31]==1&&divisor[31]==1)
begin
q=q_select;
replace_final[31:0]=~r_select[31:0];
r[31:0]=replace_final[31:0];
end
else if(dividend[31]==1&&divisor[31]==0)
begin
replace_final[31:0]=~q_select[31:0];
replace_final[31:0]=replace_final[31:0]+32'b1;
q[31:0]=replace_final[31:0];
replace_final[31:0]=~r_select[31:0];
replace_final[31:0]=replace_final[31:0]+32'b1;
r[31:0]=replace_final[31:0];
end
else if(dividend[31]==0&&divisor[31]==1)
begin
q=q_select+1;
replace_final[31:0]=~q[31:0];
replace_final=replace_final+32'b1;
q[31:0]=replace_final[31:0];
r={1'b0,divisor[30:0]}-r_select;
end
else if(dividend[31]==0&&divisor[31]==0)
begin
r<=r_select;
q<=q_select;
end
end
endmodule

