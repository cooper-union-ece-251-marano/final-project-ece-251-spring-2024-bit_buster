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
`ifndef ALUDEC
`define ALUDEC

`timescale 1ns/100ps

module aludec
    #(parameter n = 32)
    //
    // ---------------- PORT DEFINITIONS ----------------
    //

    input [5:0] = control signals
    output [2,0] = ctrl 

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @(*) begin
        
        case(op)
        
            2'b000 r = a&b // AND
            2'b000 r = a|b // OR
            2'b000 r = a+b // ADD
            2'b000 r = ~(a+b) // NOR
            2'b001 r = a-b // SUB
            2'b000 r = a<<b // Shift Left
            2'b000 r = a>>b // Shift Right
        

endmodule

`endif // ALUDEC