`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 20:53:40
// Design Name: 
// Module Name: PC
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


module PC(
    // input
    input clk,
    input reset,
    input PCWre,
    input [31:0] nextPC,
    // output
    output reg[31:0] curPC
    );

    // 上升沿触发
    always @(posedge clk or negedge reset) begin 
        if(reset == 0) begin
            curPC <= 0; // Reset,指令地址初值为0
        end else if(PCWre) begin
            curPC <= nextPC; // 下一指令地址
        end

        //在控制台输出，便于debug
        $display("curPC: ", curPC, "nextPC:", nextPC);

    end


endmodule
