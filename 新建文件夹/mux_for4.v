`timescale 1ns / 1ps//zÕıÈ·
module mux_for4(input clock_in,input enable_signal,input [1:0]select,
input [31:0]input_data1,input [31:0]input_data2,input [31:0]input_data3,input [31:0]input_data4,output reg [31:0]output_data);
wire [31:0]temp_reg[3:0];
assign temp_reg[0]=input_data1;assign temp_reg[1]=input_data2;assign temp_reg[2]=input_data3;assign temp_reg[3]=input_data4;
always@(negedge clock_in)
begin if(enable_signal)output_data<=temp_reg[select];end endmodule