`timescale 1ns / 1ps//ÕıÈ·
module selectorLBLHLW(input [1:0]signal_sel,input [31:0]regfile,input [31:0]input_data1,input [31:0]input_data2,output reg [31:0]out_put);
always@(*)begin case({signal_sel,input_data2[1:0]})
4'b1100,4'b1101,4'b1110,4'b1111:out_put=regfile;
4'b1010,4'b1011:out_put={regfile[15:0],input_data1[15:0]};
4'b1000,4'b1001:out_put={input_data1[31:16],regfile[15:0]};
4'b0100:out_put={input_data1[31:8],regfile[7:0]};
4'b0101:out_put={input_data1[31:15],regfile[7:0],input_data1[7:0]};
4'b0110:out_put={input_data1[31:24],regfile[7:0],input_data1[15:0]};
4'b0111:out_put={regfile[7:0],input_data1[23:0]};endcase end endmodule