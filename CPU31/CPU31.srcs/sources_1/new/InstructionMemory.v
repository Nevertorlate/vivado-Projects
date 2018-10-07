`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 21:18:45
// Design Name: 
// Module Name: InstructionMemory
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

module InstructionMemory(
    input [31:0] Iaddr, // 指令存储器地址输入端口
    // input [31:0] IDataIn,  // 指令存储器数据输入端口（指令代码输入端口）
    input RW,      // 指令存储器读写控制信号，为1写，为0读
    output reg[31:0] IDataOut // 指令存储器数据输出端口（指令代码输出端口）
    );

    reg[7:0] storage [127:0];

     always @(RW or Iaddr ) begin
           if(RW == 1) begin //write
            /* 本次实验不需要用到写指令功能
               storage[Iaddr] <= IDataIn[7:0];
               storage[Iaddr + 1] <= IDataIn[15:8];
               storage[Iaddr + 2] <= IDataIn[23:16];
               storage[Iaddr + 3] <= IDataIn[31:24];
            */
               end
           else begin // read
               IDataOut[7:0] <= storage[Iaddr + 3];
               IDataOut[15:8] <= storage[Iaddr + 2];
               IDataOut[23:16] <= storage[Iaddr + 1];
               IDataOut[31:24] <= storage[Iaddr];
                end  
       end

       initial begin
            $readmemb("F:/ECOP_Experiment/CPU/CPU.srcs/sources_1/new/ins.txt",storage);
       end


endmodule
