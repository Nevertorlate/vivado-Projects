module selector_for8_8(input [2:0]select_signal,
input [31:0]input_data1,input [31:0]input_data2,
input [31:0]input_data3,output [31:0]output_data);
wire [31:0]select[7:0];assign select[0]=input_data1;assign select[1]=input_data2;assign select[2]=32'd4;assign select[3]=input_data3;
assign select[4]=32'b0;assign select[5]=32'bz;assign select[6]=32'bz;assign select[7]=32'bz;
assign output_data=select[select_signal];endmodule