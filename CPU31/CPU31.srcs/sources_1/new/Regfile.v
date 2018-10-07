`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 20:55:42
// Design Name: 
// Module Name: Regfile
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


module Regfile(
    input CLK,
    input Wre,
    // input CLR,
    input [4:0] RdReg1addr,
    input [4:0] RdReg2addr,
    input [4:0] WrRegaddr,
    input [31:0] indata,
    output [31:0] reg1dataOut,
    output [31:0] reg2dataOut
    );
    reg     [31:0]  register [31:0];             // 寄存器宽度32位，共31个，R1 -Rr31
   integer  i;                                // 变量

    assign reg1dataOut = (RdReg1addr== 0)? 0 : register[RdReg1addr];   // 读寄存器1数据
    assign reg2dataOut = (RdReg2addr== 0)? 0 : register[RdReg2addr];   // 读寄存器2数据

    // psedge?
    always @(negedge CLK ) begin
        if ((WrRegaddr != 0) && (Wre == 1))     // $0寄存器不能修改
          register[WrRegaddr] <= indata;        // 写寄存器，非阻塞赋值"<="
    end

        initial begin
            for (i=1; i<32; i=i+1) begin
                    register[i] <= 0;                     // 寄存器清0，非阻塞赋值"<="
            end
        end

endmodule
