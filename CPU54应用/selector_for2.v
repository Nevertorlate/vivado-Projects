`timescale 1ns / 1ps
module selector_for2(input select_signal,input [31:0]input_data1,
input [31:0]input_data2,output [31:0]output_data);
wire [31:0]select[1:0];assign select[0]=input_data1;assign select[1]=input_data2;assign output_data=select[select_signal];endmodule