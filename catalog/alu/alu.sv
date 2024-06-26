//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineers: Grace Tseng <grace.tseng@cooper.edu>
// Engineers: Lindsey Rodriguez
//
//     Create Date: 2024-05-10
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
    input logic [n-1:0] scra, scrb,
    input logic [2:0] alucontrol,
    output logic [n-1:0] result,
    output logic zero
);

    logic [n-1:0] sum, tot;
    logic [2*n-1:0] osc, next;

    assign zero = (result == 32'b0);

    initial begin
        osc = {(2*n){1'b0}};
    end

    always_ff @(posedge clk) begin
        case (alucontrol)
            3'b011: begin // Multiplication
                next <= {32'b0, scra * scrb}; 
            end
            default: begin 
                next <= osc;
            end
        endcase
    end

    always_ff @(posedge clk) begin
        case (alucontrol)
            3'b000: begin // Bitwise AND
                result <= scra & scrb;
            end
            3'b001: begin // Bitwise OR
                result <= scra | scrb;
            end
            3'b010: begin // Addition
                result <= scra + scrb;
            end
            3'b100: begin 
                result <= osc[n-1:0];
            end
            3'b101: begin 
                result <= osc[2*n-1:n];
            end
            3'b110: begin // Sub
                result <= tot;
            end
            3'b111: begin // Set on Less Than
                result <= tot[n-1];
            end
            default: begin // Default case
                result <= 32'b0;
            end
        endcase
    end


    always_ff @(posedge clk) begin
        osc <= (alucontrol == 3'b011) ? next : osc;
    end

endmodule

`endif // ALU
