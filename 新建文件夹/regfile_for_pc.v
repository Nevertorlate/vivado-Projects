`timescale 1ns / 1ps
module regfile_for_pc(//z正确
input clock_in,input reset,input [31:0]in_pc_address,input wena,output [31:0]out_excaddr);
reg [31:0]temp_reg;  
always@(negedge clock_in)
begin if(reset)temp_reg <=32'h00400000;//初始化为004开头指令
else if(wena)temp_reg <= in_pc_address;end
assign out_excaddr = temp_reg;endmodule//输出PC寄存器指定地址的内容