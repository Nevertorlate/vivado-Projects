`timescale 1ns / 1ps
//module countersel(D_IN,D_OUT1,D_OUT0);

//output D_OUT1;
//output D_OUT0;

//input  [1:0] D_IN;

//reg D_OUT1;
//reg D_OUT0;

//always
//begin
//	case(D_IN)
//		2'b00 : {D_OUT1,D_OUT0} <= 2'b10;
//		2'b01 : {D_OUT1,D_OUT0} <= 2'b01;
//		2'b10 : {D_OUT1,D_OUT0} <= 2'b10;
//		2'b11 : {D_OUT1,D_OUT0} <= 2'b01;
//		default : {D_OUT1,D_OUT0} <= 2'b00;
//	endcase
//end
//endmodule

module sign_div(input[63:0]data_input,input enable_signal,input clk_in,input reset,output [63:0]out_data,output reg out = 0); 
reg para_nal;reg [5:0]data_sel=0;reg [31:0]selector;reg [63:0]reg_data;
assign out_data[63:32]= reg_data[31:0];assign out_data[31:0]= reg_data[63:32];
always@(posedge clk_in)
//module DataCompare4(input [3:0]iData_a,input [3:0]iData_b,input [2:0] iData,output reg [2:0]oData);
//reg [2:0]x;
//always@(*)
//begin
// if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&(iData_a[1]==iData_b[1])&&(iData_a[0]==iData_b[0])&&iData==3'b100)
//       oData=3'b100;
//else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&(iData_a[1]==iData_b[1])&&(iData_a[0]==iData_b[0])&&iData==3'b010)
//       oData=3'b010;
//else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&(iData_a[1]==iData_b[1])&&(iData_a[0]==iData_b[0])&&iData==3'b001)
//       oData=3'b001;
//else if(iData_a[3]>iData_b[3])
//        oData=3'b100;
//else if((iData_a[3]<iData_b[3]))
//      oData=3'b010;
//else if((iData_a[3]==iData_b[3])&&(iData_a[2]>iData_b[2]))
//       oData=3'b100;
//else if((iData_a[3]==iData_b[3])&&(iData_a[2]<iData_b[2]))
//       oData=3'b010;
//else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]>iData_b[1])))
//        oData=3'b100;           
//else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]<iData_b[1])))
//        oData=3'b010;
//else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]==iData_b[1]))&&((iData_a[0]>iData_b[0])))
//       oData=3'b100; 
//else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]==iData_b[1]))&&((iData_a[0]<iData_b[0])))
//      oData=3'b010;                                              
//end
//endmodule
begin if(reset)begin reg_data = 0;out = 0;end else begin if(enable_signal)begin reg_data  = 0;out = 1;data_sel = 0;
case({data_input[31],data_input[63]})
2'b00:begin selector = data_input[31:0];reg_data[31:0] = data_input[63:32];para_nal = 0;end
2'b01:begin selector = data_input[31:0];reg_data[31:0] = -data_input[63:32];para_nal = 1;end
2'b10:begin selector = -data_input[31:0];reg_data[31:0] = data_input[63:32];para_nal = 1;end
2'b11:begin selector = -data_input[31:0];reg_data[31:0] = -data_input[63:32];para_nal = 0;end
endcase reg_data[63:32] = 0;end
else if(out)begin reg_data = reg_data<<1;
if(reg_data[63:32]>=selector)begin reg_data[63:32] = reg_data[63:32] - selector;reg_data[31:0] = reg_data[31:0] + 1;end data_sel = data_sel +1;
if(data_sel ==32)begin out = 0;
if(para_nal)reg_data[31:0] = -reg_data[31:0];
if(data_input[63]==1)reg_data[63:32] = - reg_data[63:32]; end end end end endmodule