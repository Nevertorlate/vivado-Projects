`timescale 1ns / 1ps
module CPU54_regfiles(
input clock_in,input reset_signal,input enable,input [4:0] read_data_ad1,
input [4:0] read_data_ad2,input [4:0] write_data_ad1,input [31:0] write_data,
output [31:0] outputdata1,output [31:0] outputdata2);
reg [31:0]array_reg[31:0];
always @ (posedge reset_signal or negedge clock_in)
begin
if(reset_signal)begin
array_reg[0]<=32'h00000000;array_reg[1]<=32'h00000000;
array_reg[2]<=32'h00000000;array_reg[3]<=32'h00000000;
array_reg[4]<=32'h00000000;array_reg[5]<=32'h00000000;
array_reg[6]<=32'h00000000;array_reg[7]<=32'h00000000;
array_reg[8]<=32'h00000000;array_reg[9]<=32'h00000000;
array_reg[10]<=32'h00000000;array_reg[11]<=32'h00000000;
array_reg[12]<=32'h00000000;array_reg[13]<=32'h00000000;
array_reg[14]<=32'h00000000;array_reg[15]<=32'h00000000;
array_reg[16]<=32'h00000000;array_reg[17]<=32'h00000000;
array_reg[18]<=32'h00000000;array_reg[19]<=32'h00000000;
array_reg[20]<=32'h00000000;array_reg[21]<=32'h00000000;
array_reg[22]<=32'h00000000;array_reg[23]<=32'h00000000;
array_reg[24]<=32'h00000000;array_reg[25]<=32'h00000000;
array_reg[26]<=32'h00000000;array_reg[27]<=32'h00000000;
array_reg[28]<=32'h00000000;array_reg[29]<=32'h00000000;
array_reg[30]<=32'h00000000;array_reg[31]<=32'h00000000;
end else begin 
if(enable&& write_data_ad1!=0)
begin array_reg[write_data_ad1]<=write_data;end end end
assign outputdata1=array_reg[read_data_ad1];assign outputdata2=array_reg[read_data_ad2];
endmodule