module data_selector(input [3:0]selector,
input [63:0]input_data1,input [63:0]input_data3,
input [63:0]input_data5,input [31:0]input_data7,input [31:0]input_data8,
input [31:0]input_data9,output [31:0]output_data);
wire [31:0]temp_reg[8:0];
assign temp_reg[0]=input_data1[63:32];assign temp_reg[5]=input_data5[31:0];
assign temp_reg[1]=input_data1[31:0];assign temp_reg[6]=input_data7;
assign temp_reg[2]=input_data3[63:32];assign temp_reg[7]=input_data8;
assign temp_reg[3]=input_data3[31:0];assign temp_reg[8]=input_data9;
assign temp_reg[4]=input_data5[63:32];
assign output_data=temp_reg[selector];
endmodule