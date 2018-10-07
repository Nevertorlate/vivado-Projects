`timescale 1ns / 1ps
module instruction_regfile(input clock_in,input enable_signal,input [31:0]instruction,output reg [31:0]output_temp);
always@(posedge clock_in)
begin if(enable_signal)begin output_temp = instruction;end end endmodule