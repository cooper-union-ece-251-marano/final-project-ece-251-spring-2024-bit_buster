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
`ifndef _alu
`define _alu

`timescale 1ns/100ps

module alu #(parameter n = 32)(
    input logic [n-1:0] a,          
    input logic [n-1:0] b,          
  input logic [2:0] alu_ctrl,    

    output logic [n-1:0] result, 
    output logic fZ              // zero flag
);

always @(*) begin
  case(alu_ctrl)
        3'b000: result = a + b;         // Add
        3'b001: result = a - b;         // Subtract
        3'b010: result = a & b;         // AND
        3'b011: result = a | b;         // OR
          3'b100: result = ~(a | b);    // NOR
        3'b101: result = a << b;        // Shift left
        3'b110: result = a >> b;        // Shift right 
        3'b111: begin                   // SLT
                    if (a < b) begin
                        result = 1;
                    end else begin
                        result = 0;
                    end
                end
        default: result = 32'b0;    // Default to 0
    endcase

    fZ = (result == 32'b0) ? 1'b1 : 1'b0;
end

endmodule

`endif // ALU
