`timescale 1ns / 1ps
//module datamux(D_IN3,D_IN2,D_IN1,D_IN0,SEL,D_OUT1,D_OUT0);

//output [3:0] D_OUT1;
//output [3:0] D_OUT0;

//input [3:0] D_IN3;
//input [3:0] D_IN2;
//input [3:0] D_IN1;
//input [3:0] D_IN0;
//input [1:0] SEL;

//reg [3:0] D_OUT1;
//reg [3:0] D_OUT0;

//always
//begin
//	case(SEL)
//		2'b00 : begin 
//		        	D_OUT0 <= D_IN0;D_OUT1 <= D_IN1;
//				end
//		2'b01 : begin 
//		        	D_OUT0 <= D_IN2;D_OUT1 <= D_IN3;
//		        end
//		2'b10 : begin 
//		        	D_OUT0 <= D_IN0;D_OUT1 <= D_IN1;
//				end
//		2'b11 : begin 
//		        	D_OUT0 <= D_IN2;D_OUT1 <= D_IN3;
//		        end
//		default : begin
//		          	D_OUT0 <= 4'b0000;D_OUT1 <= 4'b0000;
//				  end
//	endcase
//end
//endmodule

module unsign_divu(input [63:0]input_data,input enable,input clk_in,input reset,output [63:0]out_data,output reg busy); 
reg [63:0]regfile;reg [5:0]regdelete=0;
assign out_data[63:32]=regfile[31:0];assign out_data[31:0]=regfile[63:32];
always@(posedge clk_in)
begin if(reset)begin regfile=0;busy=0;end
else begin if(enable)begin regfile=0;busy=1;regdelete = 0;regfile[31:0]=input_data[63:32];regfile[63:32] = 0;end
else if(busy)begin regfile = regfile<<1;
if(regfile[63:32]>=input_data[31:0])begin regfile[63:32]=regfile[63:32]-input_data[31:0];regfile[31:0]=regfile[31:0]+1;end regdelete=regdelete +1;
if(regdelete==32)busy=0;end end end endmodule
