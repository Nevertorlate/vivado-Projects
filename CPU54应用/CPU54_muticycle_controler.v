`timescale 1ns / 1ps
module CPU54_muticycle_controler(input reset_signal,input [31:0]data_in,input [5:0]input_file,input clock_in,input [5:0]exc_temp,output reg [68:0]input_data,output reg end_pc = 0,output reg ram_wena = 0);
 reg [16:0]regfile_temp;
 always@(posedge clock_in)begin
 if(reset_signal)begin input_data[68] = 0;input_data[67] = 0;input_data[46] = 1;regfile_temp[16:12] = 0;input_data[45] = 0;input_data[11:10]= 2'b11;input_data[9:7]= 3'b010;input_data[6:5] = 2'b01;input_data[44] = 1'b0;ram_wena = 1'b0;input_data[15:12]  =4'b0010;input_data[43] = 0;input_data[47] = 1;end
 else begin case(regfile_temp[16:12])                
 4'b0000:begin end_pc = ~end_pc;input_data[68] = 0;
// module DataCompare8(input [7:0] iData_a,input [7:0] iData_b,output [2:0] oData);
// wire [2:0] iData_temp=3'b001;
// wire [2:0] oData_temp;
// DataCompare4
// DataCompare4_1(.iData_a(iData_a[7:4]),.iData_b(iData_b[7:4]),.iData(iData_temp),.oData(oData_temp));
// DataCompare4
// DataCompare4_2(.iData_a(iData_a[3:0]),.iData_b(iData_b[3:0]),.iData(oData_temp),.oData(oData));
 
// //always@(*)
// //begin
//  //    if(iData_a[7]>iData_b[7])
//    //    begin iData=3'b100;end
// //else if((iData_a[7]<iData_b[7]))
//  //      begin iData=3'b010;end
// //else if((iData_a[7]==iData_b[7])&&(iData_a[6]>iData_b[6]))
// //       begin iData=3'b100;end
// //else if((iData_a[7]==iData_b[7])&&(iData_a[6]<iData_b[6]))
// //       begin iData=3'b010;end 
// //else if((iData_a[7]==iData_b[7])&&(iData_a[6]==iData_b[6])&&((iData_a[5]>iData_b[5])))
// //       begin iData=3'b100;end           
// //else if((iData_a[7]==iData_b[7])&&(iData_a[6]==iData_b[6])&&((iData_a[5]<iData_b[5])))
// //       begin iData=3'b010;end 
// //else if((iData_a[7]==iData_b[7])&&(iData_a[6]==iData_b[6])&&((iData_a[5]==iData_b[5]))&&((iData_a[4]>iData_b[4])))
// //       begin iData=3'b100;end 
// //else if((iData_a[7]==iData_b[7])&&(iData_a[6]==iData_b[6])&&((iData_a[5]==iData_b[5]))&&((iData_a[4]<iData_b[4])))
// //       begin iData=3'b010;end                                              
// //end
// //always@(iData_a or iData_b or iData)
// //begin
// // if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&(iData_a[1]==iData_b[1])&&(iData_a[0]==iData_b[0]))
// //       oData<=iData;
// //else if(iData_a[3]>iData_b[3])
// //       oData=3'b100;
// //else if((iData_a[3]<iData_b[3]))
// //       oData=3'b010;
// //else if((iData_a[3]==iData_b[3])&&(iData_a[2]>iData_b[2]))
// //       oData=3'b100;
// //else if((iData_a[3]==iData_b[3])&&(iData_a[2]<iData_b[2]))
// //       oData=3'b010;
// //else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]>iData_b[1])))
// //       oData=3'b100;          
// //else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]<iData_b[1])))
// //       oData=3'b010; 
// //else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]==iData_b[1]))&&((iData_a[0]>iData_b[0])))
// //       oData=3'b100; 
// //else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]==iData_b[1]))&&((iData_a[0]<iData_b[0])))
// //       oData=3'b010;                                            
// //end
// endmodule
 input_data[54] = 0;input_data[51] = 0;input_data[57] = 0;input_data[56] = 0;input_data[55] = 0;input_data[48] = 0;input_data[6:5] = 2'b01;input_data[43] = 0;input_data[47] = 1;input_data[43] = 0;input_data[46] = 0;input_data[45] = 0;
 input_data[11:10]= 2'b11;input_data[9:7] = 3'b010;input_data[15:12]=4'b0010;input_data[44] = 1'b1;ram_wena = 1'b0;regfile_temp[16:12] = 4'b0001;end
 4'b0001:begin input_data[47] = 1;input_data[44] = 1'b0;input_data[43]= 0;
 input_data[17] = 1;input_data[37:33]=data_in[25:21];input_data[32:28]=data_in[20:16];input_data[11:10]=2'b01;
 input_data[9:7]=(input_file==52)?3'b100:3'b000;input_data[15:12]  =4'b0011;
 case(input_file)
 53,50:regfile_temp[16:12] = 4'b1011;
 34:begin regfile_temp[16:12] = 4'b1011;input_data[67] = 1'b0;input_data[68] = 1'b1;input_data[6:5] = 2'b11;end
 27,1,20,2:regfile_temp[16:12] = 4'b0110;
 3,4,5,6:regfile_temp[16:12] = 4'b0110;
 7,8,9,10:regfile_temp[16:12] = 4'b0110;
 22,23,24,25:regfile_temp[16:12] = 4'b0110;
 17,18,19,21:  regfile_temp[16:12] = 4'b0110;
 28,29,30,31:  regfile_temp[16:12] = 4'b0110;                              
 16,26,36,39:regfile_temp[16:12] = 4'b0010;
 41,40,38,37:regfile_temp[16:12] = 4'b0010;
 11,12,52,51:begin regfile_temp[16:12] = 4'b1000;end
 13 ,14,15:begin input_data[27:24] = 4'b0011;regfile_temp[16:12] = 4'b1001;end  
 35:begin input_data[42:38] = data_in[15:11];input_data[27:24] = 4'b0011;input_data[43] = 1;regfile_temp[16:12] = 4'b1001;end
 32:begin input_data[48] = 1;regfile_temp[11:6] = 0;regfile_temp[5:0] = 17;regfile_temp[16:12] = 4'b1010;end
 33,54:begin input_data[57] = 1;regfile_temp[11:6] = 0;regfile_temp[5:0] = 33;regfile_temp[16:12] = 4'b1010;end
 48:begin input_data[56] = 1;regfile_temp[11:6] = 0;regfile_temp[5:0] = 33;regfile_temp[16:12] = 4'b1010;end
 49:begin input_data[55] = 1;regfile_temp[11:6] = 0;regfile_temp[5:0] = 33;regfile_temp[16:12] = 4'b1010;end
 43,44:begin regfile_temp[16:12]  = 4'b0111;end
 42:begin input_data[4:0] = data_in[15:11];regfile_temp[16:12]  = 4'b0111;end
 46,47:begin regfile_temp[16:12]  = 4'b0111;end
 45:begin input_data[4:0] = data_in[15:11];regfile_temp[16:12]  = 4'b0111;end endcase end//下面部分可以正常运行                
 4'b1010:begin input_data[57] = 0;input_data[56] = 0;input_data[55] = 0;
 if(regfile_temp[11:6] == regfile_temp[5:0])begin case(input_file)
 32:regfile_temp[16:12] = 4'b0111;
 33:begin input_data[53:52] = 2'b00;input_data[50:49] = 2'b00;input_data[54] = 1;input_data[51] = 1;input_data[46] = 1;regfile_temp[16:12] = 4'b0000;end
 54:begin input_data[53:52] = 2'b01;input_data[50:49] = 2'b01;input_data[54] = 1;input_data[51] = 1;input_data[46] = 1;regfile_temp[16:12] = 4'b0000;end
 48:begin regfile_temp[16:12] = 4'b0111;end
 49:begin input_data[53:52] = 2'b10;input_data[50:49] = 2'b10;input_data[54] = 1;input_data[51] = 1;input_data[46] = 1;regfile_temp[16:12] = 4'b0000;end
 endcase end regfile_temp[11:6] = regfile_temp[11:6] +1;end
 4'b0110:begin case(input_file)
 1:begin input_data[11:10]=2'b01;input_data[15:12]=4'b0010;input_data[9:7] = 3'b001;input_data[47] = 1'b1;input_data[19]=1;input_data[18]=1'b1;end
 2:begin input_data[11:10]=2'b01;input_data[15:12]=4'b0000;input_data[9:7] = 3'b001;input_data[47] = 1'b1;input_data[19]=1;input_data[18]=1'b1;end
 3 :begin input_data[11:10]=2'b01;input_data[15:12]=4'b0100;input_data[9:7] = 3'b001;input_data[47] = 1'b1;input_data[19]=1;input_data[18]=1'b0;end
 4  :begin input_data[11:10]=2'b01;input_data[15:12]=4'b0101;input_data[9:7] = 3'b001;input_data[47]= 1'b1;input_data[19]=1;input_data[18]=1'b0;end
 6  :begin input_data[11:10]=2'b01;input_data[15:12]=4'b1001;input_data[9:7] = 3'b001;input_data[47] = 1'b1;input_data[19]=1;input_data[18]=1'b0;end
 5:begin input_data[11:10]=2'b01;input_data[15:12]=4'b1010;input_data[9:7] = 3'b001;                  input_data[19]=1;input_data[18]=1'b0;end
 7 :begin input_data[11:10]=2'b01;input_data[15:12]=4'b0110;input_data[9:7]= 3'b001;input_data[47] = 1'b1;input_data[19]=1;input_data[18]=1'b0;end
 8 :begin input_data[11:10]=2'b01;input_data[15:12]=4'b1011;input_data[9:7]= 3'b001;                  input_data[19]=1;input_data[18]=1'b1;end
 9 :begin input_data[11:10]=2'b01;input_data[15:12]=4'b0000;input_data[9:7]= 3'b000;input_data[47] = 1'b1;                           end
 10  :begin input_data[11:10]=2'b01;input_data[15:12]=4'b0100;input_data[9:7]= 3'b000;input_data[47] = 1'b1;                           end
 17  :begin input_data[11:10]=2'b01;input_data[15:12]=4'b0110;input_data[9:7]= 3'b000;input_data[47] = 1'b1;                           end
 18  :begin input_data[11:10]=2'b01;input_data[15:12]=4'b0111;input_data[9:7]= 3'b000;input_data[47] = 1'b1;                           end
 19   :begin input_data[11:10]=2'b01;input_data[15:12]=4'b0101;input_data[9:7]= 3'b000;input_data[47] = 1'b1;                           end
 20  :begin input_data[11:10]=2'b00;input_data[15:12]=4'b1111;input_data[9:7]= 3'b000;input_data[47] = 1'b1;input_data[21]=1;input_data[20]=1;input_data[32:28]=data_in[20:16];end
 21 :begin input_data[11:10]=2'b01;input_data[15:12]=4'b1111;input_data[9:7]= 3'b000;input_data[47] = 1'b1;                           end
 22 :begin input_data[11:10]=2'b01;input_data[15:12]=4'b1010;input_data[9:7]= 3'b000;input_data[47] = 1'b1;input_data[23]=1;input_data[22]=0;      end
 23  :begin input_data[11:10]=2'b00;input_data[15:12]=4'b1100;input_data[9:7]= 3'b000;input_data[47] = 1'b1;input_data[21]=1;input_data[20]=1;       end
 24  :begin input_data[11:10]=2'b00;input_data[15:12]=4'b1101;input_data[9:7]= 3'b000;input_data[47] = 1'b1;input_data[21]=1;input_data[20]=1;       end
 25 :begin input_data[11:10]=2'b01;input_data[15:12]=4'b0001;input_data[9:7]=3'b000;input_data[47] = 1'b1;                           end
 27  :begin input_data[11:10]=2'b01;input_data[15:12]=4'b0010;input_data[9:7]= 3'b000;input_data[47] = 1'b1;                           end
 28  :begin input_data[11:10]=2'b01;input_data[15:12]=4'b0011;input_data[9:7]= 3'b000;input_data[47] = 1'b1;                           end
 29  :begin input_data[11:10]=2'b01;input_data[15:12]=4'b1011;input_data[9:7]= 3'b000;input_data[47] = 1'b1;                           end
 30 :begin input_data[11:10]=2'b01;input_data[15:12]=4'b1101;input_data[9:7] = 3'b000;input_data[47] = 1'b1;                           end
 31 :begin input_data[11:10]=2'b01;input_data[15:12]=4'b1100;input_data[9:7]= 3'b000;input_data[47] = 1'b1;                           end
 endcase regfile_temp[16:12]=4'b0111;end
 4'b0111:begin input_data[47] = 0;input_data[46] = 1;case(input_file)
 46:begin input_data[53:52] = 2'b11;input_data[54] = 1'b1;end
 47:begin input_data[50:49] = 2'b11;input_data[51] = 1'b1;end
 45:;
 42:begin input_data[27:24] = 4'b1000;input_data[42:38] = data_in[20:16];input_data[43] = 1;end
 32:begin input_data[27:24] = 4'b0100;input_data[42:38] = data_in[15:11];input_data[43] = 1;end
 43:begin input_data[27:24] = 4'b0101;input_data[42:38] = data_in[15:11];input_data[43] = 1;end
 44:begin input_data[27:24] = 4'b0110;input_data[42:38] = data_in[15:11];input_data[43] = 1;end
 5:begin input_data[27:24] = 4'b0000;input_data[42:38] = data_in[20:16];input_data[23] = 1;input_data[22] = 0;input_data[43] = 1;end
 8:begin input_data[27:24] = 4'b0000;input_data[42:38] = data_in[20:16];input_data[23] = 1;input_data[22] = 1;input_data[43] = 1;end
 29:begin input_data[27:24] = 4'b0000;input_data[42:38] = data_in[15:11];input_data[23] = 1;input_data[22] = 1;input_data[43] = 1;end
 48:begin input_data[27:24] = 4'b0111;input_data[42:38] = data_in[15:11];input_data[43] = 1;end
 9,10,17,18,19,20,21,22,
 23,24,25,27,28,30,31:
 begin input_data[27:24] = 4'b0010;input_data[42:38] = data_in[15:11];input_data[43] = 1;end
 default:begin input_data[27:24] = 4'b0010;input_data[42:38] = data_in[20:16];input_data[43] = 1;end
 endcase regfile_temp[16:12] =4'b0000;end
 4'b0010:begin input_data[45] = 1;input_data[19]=1;input_data[18]=1'b1;input_data[37:33]=data_in[25:21];input_data[42:38]=data_in[20:16];
 input_data[11:10]=2'b01;input_data[15:12]  =4'b0010;input_data[9:7] = 3'b001;input_data[47] = 1;
 case(input_file) 41:begin input_data[62] = 1;input_data[61:60] = 2;regfile_temp[16:12] = 4'b0011;end
 38:begin input_data[62] = 0;input_data[61:60] = 2;regfile_temp[16:12] = 4'b0011;end
 16:begin input_data[61:60] = 3;regfile_temp[16:12] = 4'b0011;end
 36:begin input_data[61:60] = 1;input_data[62] = 1;regfile_temp[16:12] = 4'b0011;end
 41:begin input_data[61:60] = 2;input_data[62] = 1;regfile_temp[16:12] = 4'b0011;end
 37:begin input_data[61:60] = 1;input_data[62] = 0;regfile_temp[16:12] = 4'b0011;end
 39:begin input_data[61:60] = 3;input_data[59:58] = 1;regfile_temp[16:12] = 4'b0101;end
 40:begin input_data[61:60] = 3;input_data[59:58] = 2;regfile_temp[16:12] = 4'b0101;end
 26:begin input_data[59:58] = 3;regfile_temp[16:12] = 4'b0101;end endcase end
 4'b0011:begin input_data[27:24] = 4'b0001;input_data[43] = 1;input_data[46] = 1;if(input_file==16||input_file==41||input_file==38||input_file==36||input_file==37)regfile_temp[16:12] = 4'b0100;end
 4'b0100:begin input_data[43] = 0;ram_wena = 0;input_data[45] = 0;regfile_temp[16:12] = 4'b0000;end                
 4'b0101:begin ram_wena = 1;input_data[46] = 1;regfile_temp[16:12] = 4'b0100;end
 4'b1000:begin input_data[46] = 1;
 if(input_file==52 && (exc_temp[4] == 0 || exc_temp[5] == 1))
 begin input_data[44]=1'b1;input_data[47] = 1'b1;input_data[17]=1;input_data[11:10] = 2'b11;input_data[9:7] = 3'b011;input_data[15:12]  =4'b0010;input_data[37:33]=data_in[25:21];input_data[32:28]=data_in[20:16];end
 else if( (input_file==11 && exc_temp[5]== 1) || (input_file == 12 && exc_temp[5] == 0) )
 begin input_data[44]= 1'b1;input_data[47] = 1'b1;input_data[17]=1;input_data[11:10] = 2'b11;input_data[9:7] = 3'b011;input_data[15:12]  =4'b0010;input_data[37:33]=data_in[25:21];input_data[32:28]=data_in[20:16];end
 else if(input_file==51 && exc_temp[5]==1)regfile_temp[16:12] = 4'b1011;else regfile_temp[16:12] =4'b0000;end
 4'b1001:begin case(input_file)
 14:begin input_data[47] = 0;input_data[42:38]=5'b11111;input_data[6:5] = 2'b10;input_data[43] = 1;end
 35:begin input_data[43] = 0;input_data[6:5] = 2'b00;end
 13:begin input_data[43] = 0;input_data[6:5] = 2'b10;end
// module DataCompare4(input [3:0]iData_a,input [3:0]iData_b,input [2:0] iData,output reg [2:0]oData);
// always@(*)
// begin
//      if(iData_a[3]>iData_b[3])
//         oData=3'b100;
// else if((iData_a[3]<iData_b[3]))
//       oData=3'b010;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]>iData_b[2]))
//        oData=3'b100;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]<iData_b[2]))
//        oData=3'b010;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]>iData_b[1])))
//         oData=3'b100;           
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]<iData_b[1])))
//         oData=3'b010;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]==iData_b[1]))&&((iData_a[0]>iData_b[0])))
//        oData=3'b100; 
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]==iData_b[1]))&&((iData_a[0]<iData_b[0])))
//       oData=3'b010; 
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&(iData_a[1]==iData_b[1])&&(iData_a[0]==iData_b[0])&&iData==3'b100)
//        oData=3'b100;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&(iData_a[1]==iData_b[1])&&(iData_a[0]==iData_b[0])&&iData==3'b010)
//        oData=3'b010;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&(iData_a[1]==iData_b[1])&&(iData_a[0]==iData_b[0])&&iData==3'b001)
//       oData=3'b001;                                            
// end
// endmodule

 15:begin input_data[37:33]=data_in[25:21];input_data[43] = 0;input_data[6:5] = 2'b00;end endcase
// module DataCompare4(input [3:0]iData_a,input [3:0]iData_b,input [2:0] iData,output reg [2:0]oData);
// always@(*)
// begin
//      if(iData_a[3]>iData_b[3])
//         oData=3'b100;
// else if((iData_a[3]<iData_b[3]))
//       oData=3'b010;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]>iData_b[2]))
//        oData=3'b100;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]<iData_b[2]))
//        oData=3'b010;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]>iData_b[1])))
//         oData=3'b100;           
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]<iData_b[1])))
//         oData=3'b010;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]==iData_b[1]))&&((iData_a[0]>iData_b[0])))
//        oData=3'b100; 
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&((iData_a[1]==iData_b[1]))&&((iData_a[0]<iData_b[0])))
//       oData=3'b010; 
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&(iData_a[1]==iData_b[1])&&(iData_a[0]==iData_b[0])&&iData==3'b100)
//        oData=3'b100;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&(iData_a[1]==iData_b[1])&&(iData_a[0]==iData_b[0])&&iData==3'b010)
//        oData=3'b010;
// else if((iData_a[3]==iData_b[3])&&(iData_a[2]==iData_b[2])&&(iData_a[1]==iData_b[1])&&(iData_a[0]==iData_b[0])&&iData==3'b001)
//       oData=3'b001;                                            
// end
// endmodule

 input_data[16] = 1;input_data[46] = 1;input_data[44] = 1;regfile_temp[16:12] =4'b0000;end
 4'b1011:begin if(input_file == 50 && exc_temp[0] == 1&& exc_temp[1] == 1)
 begin input_data[67] = 1'b1;input_data[66:63] = 4'b1000;input_data[6:5] = 2'b11;end             
 else if(input_file == 53 && exc_temp[0] == 1&& exc_temp[2] == 1)
 begin input_data[67] = 1'b1; input_data[66:63] = 4'b1001; input_data[6:5] = 2'b11;end
 else if(input_file == 51 && exc_temp[0] == 1&& exc_temp[3] == 1)
 begin input_data[67] = 1'b1;input_data[66:63] = 4'b1101;input_data[6:5] = 2'b11;end
 else if(input_file == 34);input_data[46] = 1;input_data[44] = 1;regfile_temp[16:12] =4'b0000;end
endcase end end endmodule