//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: alu
//     Description: 32-bit RISC-based CPU alu (MIPS)
//
// Revision: 1.0
// see https://github.com/Caskman/MIPS-Processor-in-Verilog/blob/master/ALU32Bit.v
//////////////////////////////////////////////////////////////////////////////////

`ifndef ALU
`define ALU

`timescale 1ns/100ps

module alu 
#(parameter n = 32) 
(
    input logic clk,
    input logic [n-1:0] a, b,
    input logic [2:0] alucontrol,
    output logic [n-1:0] result,
    output logic zero
);

    logic [n-1:0] condinvb, sum;
    logic [2*n-1:0] HiLo;
    logic [n-1:0] tot;
    logic [2*n-1:0] next_HiLo;

    assign zero = (result == 32'b0);
    assign condinvb = alucontrol[2] ? ~b : b;
    assign sumSlt = a + condinvb + alucontrol[2];

    initial begin
        HiLo = 64'b0;
    end

    always_comb begin
        case (alucontrol)
            3'b011: begin // Multiplication
                next_HiLo = {32'b0, a * b}; 
            end
            default: begin 
                next_HiLo = HiLo;
            end
        endcase
    end

    always_comb begin
        case (alucontrol)
            3'b000: begin // Bitwise AND
                result = a & b;
            end
            3'b001: begin // Bitwise OR
                result = a | b;
            end
            3'b010: begin // Addition
                result = a + b;
            end
            3'b100: begin // Move From LO
                result = HiLo[n-1:0];
            end
            3'b101: begin // Move From HI
                result = HiLo[2*n-1:n];
            end
            3'b110: begin // Subtraction
                result = tot;
            end
            3'b111: begin // Set on Less Than
                result = tot[n-1];
            end
            default: begin // Default case
                result = 32'b0;
            end
        endcase
    end

    // Update HiLo at every positive clock edge if there is a change
    always_ff @(posedge clk) begin
        if (alucontrol == 3'b011) begin
            HiLo <= next_HiLo; // Update HiLo only on multiplication
        end
    end

endmodule

`endif // ALU
