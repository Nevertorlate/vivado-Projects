`timescale 1ns / 1ns
module selector_for4(//zÕıÈ·
input [1:0]select_signal,input [31:0] input_data1,input [31:0] input_data2,input [31:0] input_data3,input [31:0] input_data4,output [31:0]output_data); 
wire [31:0]select[3:0];assign select[0]=input_data1;assign select[1]=input_data2;
assign select[2]=input_data3;assign select[3]=input_data4;assign output_data=select[select_signal];endmodule