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
    #(parameter n = 32)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [n-1:0] a,b 
    input logic [2;0] ctrl
    output logic [n-1:0] r 
    output logic zero
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @(*)begin
        case (ctrl[1:0])

        2'b000 r = a&b // AND
        2'b000 r = a|b // OR
        2'b000 r = a+b // ADD
        2'b000 r = ~(a+b) // NOR
        2'b001 r = a-b // SUB
        2'b000 r = a<<b // Shift Left
        2'b000 r = a>>b // Shift Right

        endcase
        assign zero=(r==0);
endmodule

`endif // ALU
