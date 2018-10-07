module calculator( 
input [31:0]regf_data1,//输入数据ALU_A
input [31:0]regf_data2,//输入数据ALU_B
input [3:0] operation,//操作编号
output reg[31:0]alu_output_result,//alu输出结果送入Z寄存器
output reg zero,output reg carry,output reg negative);//正负号位//由于没有用到overflow位所以舍去此输出
reg [32:0]temp_regfile_alu;reg temp;
always@(*)begin
case(operation)
4'b0000:begin alu_output_result = regf_data1+regf_data2;temp_regfile_alu=regf_data1+regf_data2;carry=(temp_regfile_alu[32]==1)?1:0;zero=(alu_output_result==0)?1:0;negative= temp_regfile_alu[31];end
4'b0010:begin alu_output_result = regf_data1+regf_data2;zero=(alu_output_result==0)?1:0;negative=alu_output_result[31];end
4'b0001:begin alu_output_result = regf_data1-regf_data2;temp_regfile_alu = regf_data1-regf_data2;carry=temp_regfile_alu[32];zero=(alu_output_result==0)?1:0;negative=temp_regfile_alu[31];end
4'b0011:begin alu_output_result = regf_data1-regf_data2;negative=alu_output_result[31];zero=(alu_output_result==0)?1:0;end
4'b0100:begin alu_output_result = regf_data1 & regf_data2;negative=alu_output_result[31];zero=(alu_output_result==0)?1:0;end
4'b0101:begin alu_output_result = regf_data1 | regf_data2;negative=alu_output_result[31];zero=(alu_output_result==0)?1:0;end
4'b0110:begin alu_output_result = regf_data1 ^ regf_data2;negative=alu_output_result[31];zero=(alu_output_result==0)?1:0;end
4'b0111:begin alu_output_result = ~(regf_data1|regf_data2);negative=alu_output_result[31];zero=(alu_output_result==0)?1:0;end
4'b1000,4'b1001:begin alu_output_result={regf_data2[15:0],16'b0};negative=alu_output_result[31];zero=(alu_output_result==0)?1:0; end	
4'b1011:begin alu_output_result<=(regf_data1[31]~^regf_data2[31])?((regf_data1<regf_data2)?1:0):regf_data1[31];negative<=(regf_data1[31]~^regf_data2[31])?((regf_data1<regf_data2)?1:0):regf_data1[31];zero<=(regf_data1==regf_data2)?1:0;end
4'b1010:begin alu_output_result<=(regf_data1<regf_data2)?1:0;carry<=(regf_data1<regf_data2)?1:0;zero<=(regf_data1==regf_data2)?1:0;negative<= 1'b0;end
4'b1100,4'b1111,4'b1110,4'b1101:
begin if(operation[1]==1)
begin temp_regfile_alu[31:0] = regf_data2;carry = temp_regfile_alu[32-regf_data1];alu_output_result = temp_regfile_alu<< regf_data1[4:0];end
else if (operation[1]==0 && operation[0] == 1)
begin temp_regfile_alu[31:0]  = regf_data2;carry = temp_regfile_alu[regf_data1[4:0]-1'b1];alu_output_result  = temp_regfile_alu[31:0]>>regf_data1[4:0];end
else begin if(regf_data2[31])
begin temp_regfile_alu[31:0]=~regf_data2;carry=regf_data2[regf_data1[4:0]-1];alu_output_result=~(temp_regfile_alu[31:0]>>regf_data1[4:0] );end
else begin temp_regfile_alu[31:0]= regf_data2;carry=regf_data2[regf_data1[4:0]-1];alu_output_result=temp_regfile_alu[31:0]>>regf_data1[4:0];end end
zero<=(alu_output_result==0)?1:0;carry<=(regf_data1==0)?0:1;negative<=alu_output_result[31];end
default:begin alu_output_result=32'h00000000;end endcase end endmodule