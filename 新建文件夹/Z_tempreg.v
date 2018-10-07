`timescale 1ns / 1ps
module Z_tempreg(input enable_Z_temp,input [31:0]Z_ALUcontroler,output reg [31:0]outdata);
always@(*)begin if(enable_Z_temp)outdata<=Z_ALUcontroler;end endmodule