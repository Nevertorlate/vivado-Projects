`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 21:33:06
// Design Name: 
// Module Name: CU
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


module CU(
    // input
    input [5:0] opCode,
    input zero,
    // output
    output RegDst,
    output InsMemRW,
    output PCWre,
    output ExtSel,
    output DBDataSrc,
    output WR,
    output RD,
    output ALUSrcB,
    output ALUSrcA,
    output PCSrc,
    output reg[3:0] ALUop,
    output RegWre
    );

     // assign Reset=(opCode == 6'b110000)? 0 : 1;
    assign RegDst=(opCode == 6'b000000 || opCode == 6'b000010 || opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b011000)? 1 : 0;
    assign PCWre=(opCode == 6'b111111)? 0 : 1;
    assign ALUSrcB=(opCode == 6'b000001 || opCode==6'b010000 || opCode == 6'b100110 || opCode == 6'b100111 ) ? 1 : 0;
    assign DBDataSrc=(opCode == 6'b100111)? 1 : 0;
    assign InsMemRw = 1;
    assign RD=(opCode == 6'b100111)? 1 : 0;
    assign WR=(opCode == 6'b100110)? 1 : 0;
    assign ExtSel=(opCode == 6'b010000 || opCode == 6'b010000 || opCode == 6'b100111)? 0 : 1;
    assign PCSrc=(zero == 0 && opCode == 6'b110000)? 1:0;
    assign ALUSrcA =(opCode == 6'b011000)?1: 0;
    assign RegWre=(opCode==6'b100110 || opCode==6'b110000 || opCode==6'b111111 )? 0 : 1; 

    always @(opCode) begin
        case(opCode) 
            // add
            6'b000000 : ALUop = 4'b0000;
            // addi  
            6'b000001 : ALUop = 4'b0000;
            // sub
            6'b000010 :ALUop = 4'b0001;
            // ori
            6'b010000 :ALUop = 4'b1000;
            // and
            6'b010001 :ALUop = 4'b0100;
            // or
            6'b010010 :ALUop = 4'b1000;
            // sll
            6'b011000 :ALUop = 4'b0011;
            // sw
            6'b100110 : begin end
            // lw
            6'b100111 : begin end
            // beq
            6'b110000 : ALUop = 4'b0010;
            // halt
            6'b111111 : begin end
          default: begin
            $display (" no match");
           end
       endcase
    end
endmodule
