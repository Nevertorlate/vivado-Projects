module sccomp_dataflow(
input clk_in, 
input reset, 
output[31:0]inst, 
output[31:0]pc, 
output[31:0]addr
);
cpu sccpu(._clk(clk_in),.reset(reset),.cpu_out_inst(inst),.cpu_out_pc(pc),.cpu_out_alu(addr));
endmodule
//module counter55(C_CLK,RST,C_EN,D_OUT1,data1,D_OUT0,C_out,count_light
//,a0,a1,a2,a3,speed_select,flowspeed,line_0,line_1,line_2,line_3);
//input [1:0]count_light,speed_select;
//input line_0,line_1,line_2,line_3;
//input [2:0]flowspeed;
//output C_out;
//input [7:0]a0,a1,a2,a3;
//output [3:0] D_OUT1;
//output [3:0] D_OUT0;
//input [7:0]data1;
//input  C_CLK;
//input  RST;
//input  C_EN;
//reg [7:0]data;
//reg [3:0]data_0,data_1;
//reg [3:0] D_OUT1;
//reg [3:0] D_OUT0;
//reg C_out;
//reg [3:0] CData1;
//reg [3:0] CData0;
//reg [7:0] DATA;

//always
//begin
//if({line_3,line_2,line_1,line_0}==4'b0001)
//begin
//data<=a0;
//end
//else if({line_3,line_2,line_1,line_0}==4'b0010)
//begin
//data<=a1;
//end
//else if({line_3,line_2,line_1,line_0}==4'b0100)
//begin
//data<=a2;
//end
//else if({line_3,line_2,line_1,line_0}==4'b1000)
//begin
//data<=a3;
//end
//end
////reg [1:0]flag111;
////always@(posedge C_EN)
////begin
////if(RST==0)
//// flag111<=2'b00;
////else 
////begin
//// flag111<=flag111+1;
////end
////if(flag111==2'b00)
//// data<=a0;
////else if(flag111==2'b01)
//// data<=a1;
////else if(flag111==2'b10)
////  data<=a2;
////else if(flag111==2'b11)
////   data<=a3;
////end


//always
//begin
//data_0<=data[3:0];
//data_1<=data[7:4];
//end

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
//	    if(CData0 ==data_0 && CData1 == data_1)
//		  begin
//	    	CData1 <= 4'b0000;
//	        CData0 <= 4'b0000;
//	        C_out = 1'b1;
//	      end		
//		else if(CData0 != 4'b1001)
//		  begin
//			CData0 <= CData0 + 1;
//			C_out <= 1'b0;
//		  end
//		else if(CData0 == 4'b1001 && CData1 != 4'b0110)
//		  begin
//			CData1 <= CData1 + 1;
//			CData0 <= 4'b0000;
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
//reg [7:0]data_reg;
//always
//begin
//    data_reg={data_1[3:0],data_0[3:0]};
//	DATA <= data_reg-((CData1<<4)+CData0);
//	if(((DATA>>4)&4'b1111)>data_1)
//		D_OUT1 <= (DATA>>4)&4'b1111-4'b1111;
//	else
//		D_OUT1 <= (DATA>>4)&4'b1111;
//	if((DATA&4'b1111)>4'b1001)
//		D_OUT0 <= (DATA&4'b1111)-4'b0110;
//	else
//		D_OUT0 <= DATA&4'b1111;
//end

//endmodule
