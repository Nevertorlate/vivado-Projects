`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 22:25:25
// Design Name: 
// Module Name: Adder_pcreg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder(input iSA,input [7:0]iData_a,input [7:0]iData_b,output reg [8:0]oData,output reg oData_C);
reg [7:0]iData_A;
reg [7:0]iData_B; 
always@(*)
begin
case(iSA)
1'b1:
begin
//oData={iData_a[7],iData_a}+{iData_b[7],iData_b};
if(iData_a[7]==1)
begin iData_A=iData_a;iData_A[6]=~iData_a[6];iData_A[5]=~iData_a[5];iData_A[4]=~iData_a[4];iData_A[3]=~iData_a[3];iData_A[2]=~iData_a[2];iData_A[1]=~iData_a[1];iData_A[0]=~iData_a[0];iData_A=iData_A+1;end
if(iData_b[7]==1)
begin iData_B=iData_b;iData_B[6]=~iData_b[6];iData_B[5]=~iData_b[5];iData_B[4]=~iData_b[4];iData_B[3]=~iData_b[3];iData_B[2]=~iData_b[2];iData_B[1]=~iData_b[1];iData_B[0]=~iData_b[0];iData_B=iData_B+1;end
if((iData_a[7]==1&&iData_b[7]==0))
   begin oData=iData_A+iData_B;oData_C=0;end
else if((iData_a[7]==0&&iData_b[7]==1))
   begin oData=iData_A+iData_B;oData_C=0;end
else if((iData_a[7]==0&&iData_b[7]==0))
   begin oData=iData_a+iData_b;oData_C=oData[7];end
else if(((iData_a[7]==1&&iData_b[7]==1)))
     begin oData=iData_A+iData_B;oData_C=oData[8];end  
end
1'b0:begin oData=iData_a+iData_b;oData_C=oData[8];end
default:begin oData_C=1'bx;oData=8'bxxxxxxxx;end
endcase
end
endmodule