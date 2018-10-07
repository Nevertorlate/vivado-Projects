`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 21:04:30
// Design Name: 
// Module Name: decoder
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


module decoder(
    // input
    input [31:0] ins,
    // output
    output reg[5:0] opCode,
    output reg[4:0] rs,
    output reg[4:0] rt,
    output reg[4:0] rd,
    output reg[4:0] sa,
    output reg[15:0] immediate,
    output reg[31:0] ext_sa
    );

    always @(ins) begin
        opCode=ins[31:26];
        rs=ins[25:21];
        rt=ins[20:16];
        rd=ins[15:11];
        sa=ins[10:6];
        immediate=ins[15:0];
        ext_sa={ 27'b000000000000000000000000000 ,ins[10:6]};
    end
endmodule
