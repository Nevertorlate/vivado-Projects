`timescale 1ns / 1ns
//module counter05(C_CLK,RST,C_EN,D_OUT1,D_OUT0,C_out);

//output C_out;
//output [3:0] D_OUT1;
//output [3:0] D_OUT0;

//input  C_CLK;
//input  RST;
//input  C_EN;

//reg [3:0] D_OUT1;
//reg [3:0] D_OUT0;
//reg C_out;
//reg [3:0] CData1;
//reg [3:0] CData0;
//reg [7:0] DATA;


//always @(posedge C_CLK)
//begin
//	if(RST==0||C_EN==0)
//	  begin 
//		C_out <= 1'b0;
//		CData1 <= 4'b0000;
//		CData0 <= 4'b0000;
//	  end
//	else
//	  begin
//	    if(CData0 != 4'b0101)
//		  begin
//			CData0 <= CData0 + 1;
//			C_out <= 1'b0;
//		  end
//		else
//	      begin
//	    	CData1 <= 4'b0000;
//	        CData0 <= 4'b0000;
//	        C_out = 1'b1;
//	      end
//	end
//end

//always
//begin
//	DATA <= 8'b00000101-((CData1<<4)+CData0);
//	D_OUT1 <= 4'b0000;	
//	if((DATA&4'b1111)>4'b0101)
//		D_OUT0 <= DATA&4'b1111-4'b1011;
//	else
//		D_OUT0 <= DATA&4'b1111;
//end

//endmodule
module sign_mult(input enable_signal,input clock_in,input reset,input [63:0]input_data,output [63:0]out_data,output reg busy = 0);//乘法忙信号
reg [5:0]counter =0;reg [63:0]temp_regfile=0;reg enble = 0;//标志信号
always@(posedge clock_in)
begin if(reset)temp_regfile=0;
else if(enable_signal)begin temp_regfile[63:0]={32'b0,input_data[31:0]};enble = 0;busy = 1;counter = 0;end
else if(busy)begin
case({temp_regfile[0],enble})//选择信号select
2'b00,2'b11:;
2'b01:temp_regfile[63:32]=  temp_regfile[63:32] + input_data[63:32];
2'b10:temp_regfile[63:32]=  temp_regfile[63:32] - input_data[63:32];
endcase enble = temp_regfile[0];temp_regfile = {temp_regfile[63],temp_regfile[63:1]};counter=counter+1;busy=((counter)==32)?0:1;
end end assign out_data = temp_regfile;endmodule