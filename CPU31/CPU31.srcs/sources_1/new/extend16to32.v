`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 20:59:52
// Design Name: 
// Module Name: extend16to32
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


module extend16to32(
    // input
    input [15:0] extendee,
    input ExtSel,
    // output
    output reg[31:0] result
    );

    integer i;
    // assign result[15:0] = extendee[15:0];
    // assign result[32:16] = 0;

    always @(ExtSel or extendee) begin
            for(i = 0; i < 16; i = i + 1) begin
                result[i] <= extendee[i];
            end 
            // ÓÐ·ûºÅÊý
            if(ExtSel) begin
                for(i = 16; i < 32; i = i + 1) begin
                    result[i] = extendee[15];
                end 
            end else begin 
                for(i = 16; i < 32; i = i + 1) begin
                    result[i] = 0;
                end
            end
    end

endmodule
