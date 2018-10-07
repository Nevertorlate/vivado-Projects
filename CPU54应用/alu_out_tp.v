`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 22:21:28
// Design Name: 
// Module Name: alu_out_tp
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


module alu_tp( 
input [31:0] a,
input [31:0] b,
input [3:0] aluc,
output reg [31:0] r,
output reg zero,
output reg carry,
output reg negative,
output reg overflow);
reg [32:0]data_out;
always@(aluc or a or b)
begin
case(aluc) 
4'b0000:
begin 
data_out=a+b;
zero=(data_out==0)?1:0;
carry=data_out[32];
overflow=0;
negative=0;
end
4'b0010:
begin
data_out=a+b;
zero=(data_out==0)?1:0;
carry=0;
negative=data_out[32];
if(a<0&&b<0)
  begin overflow=data_out[31]; end
else if((a<0&&b>0)||(a>0&&b<0))
  overflow=0;
else if(a>0&&b>0)
  begin overflow=data_out[31] ;end
end


4'b0001:
begin 
data_out=a-b;
zero=(data_out==0)?1:0;
overflow=0;
carry=(a<b)?1:0;
negative=data_out[31];
end
4'b0011:
begin 
data_out=a-b;
zero=(data_out==0)?1:0;
carry=0;
if((a<0&&b<0)||(a>0&&b>0))
  begin negative=data_out[32];overflow=0; end
else if(a<0&&b>0)
  begin negative=1;overflow=data_out[31]; end
else if(a>0&&b<0)
  begin negative=0;overflow=data_out[31];end
end
4'b0100:
begin
data_out=a&b;
zero=(data_out==0)?1:0;
carry=0;
negative=data_out[31];
overflow=0;
end
4'b0101:
begin 
data_out=a|b;
zero=(data_out==0)?1:0;
carry=0;
negative=data_out[31];
overflow=0;
end
4'b0110:
begin
data_out=a^b;
zero=(data_out==0)?1:0;
carry=0;
negative=data_out[31];
overflow=0;
end
4'b0111:
begin 
data_out=~(a|b);
zero=(data_out==0)?1:0;
carry=0;
negative=data_out[31];
overflow=0;
end
4'b1001:
begin
data_out[32]=0;
data_out[31:0]={b[15:0],16'b0};
zero=(data_out==0)?1:0;
carry=0;
negative=data_out[31];
overflow=0;
end
4'b1000:
begin 
data_out[32]=0;
data_out[31:0]={b[15:0],16'b0};
zero=(data_out==0)?1:0;
carry=0;
negative=data_out[31];
overflow=0;
end
4'b1011:
begin 
data_out=(a<b)?1:0;
zero=(data_out==0)?1:0;
carry=0;
negative=data_out[31];
overflow=0;
end
4'b1010:
begin 
data_out=(a<b)?1:0;
zero=(data_out==0)?1:0;
carry=0;
if(a-b<0)
  negative=1;
else
  negative=0;
overflow=0;
end
4'b1100:
begin 
data_out=b>>>(a-1);
carry=data_out[0];
data_out=b>>>a;
zero=(data_out==0)?1:0;
overflow=0;
negative=data_out[31];
end
4'b1111:
begin 
data_out=b<<(a);
zero=(data_out==0)?1:0;
carry=data_out[32];
negative=data_out[31];
overflow=0;
end
4'b1110:
begin 
data_out=b<<(a);
zero=(data_out==0)?1:0;
carry=data_out[32];
negative=data_out[31];
overflow=0;
end
4'b1101:
begin 
data_out=b>>(a-1);
carry=data_out[0];
data_out=b>>a;
zero=(data_out==0)?1:0;
overflow=0;
negative=data_out[31];
end
default:
begin
data_out=0;
carry=0;
data_out=0;
zero=0;
overflow=0;
negative=0;
end
endcase
r=data_out[31:0];
end
endmodule

