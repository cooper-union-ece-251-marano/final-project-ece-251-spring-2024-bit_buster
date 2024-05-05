//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: aludec
//     Description: 32-bit RISC ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`define ALU_DECODER

`timescale 1ns/1ns

module alu_decoder (
  input logic [2:0] alu_control,
    output logic [5:0] alu_opcode
);


always_comb begin
    case (alu_control)
        3'b000: alu_opcode = 6'b0000; // Add
        3'b001: alu_opcode = 6'b0001; // Subtract
        3'b010: alu_opcode = 6'b0010; // AND
        3'b011: alu_opcode = 6'b0011; // OR
        3'b100: alu_opcode = 6'b0100; // XOR
        3'b101: alu_opcode = 6'b0101; // Shift left
        3'b110: alu_opcode = 6'b0110; // Shift right
        3'b111: alu_opcode = 6'b0111; // SLT (Set on less than)
        default: alu_opcode = 6'b0000; // Default to Add
    endcase
end

endmodule
