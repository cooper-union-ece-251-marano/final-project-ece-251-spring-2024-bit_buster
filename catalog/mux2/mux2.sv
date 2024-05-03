//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2024-05-01
//     Module Name: mux2
//     Description: 2 to 1 multiplexer
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef MUX2
`define MUX2

`timescale 1ns/100ps

module mux2
    #(parameter n = 32)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [(n-1):0] A,
    input logic [(n-1):0] B,
    input logic sel,
    output logic [(n-1):0] C
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    assign C = (A & ~sel) | (B & sel); // if sel is 0 => C => A, otherwise, C => B.
endmodule

`endif // MUX2