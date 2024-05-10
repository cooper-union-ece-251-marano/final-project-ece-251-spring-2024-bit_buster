//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2023-02-07
//     Module Name: signext
//     Description: 16 to 32 bit sign extender
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef SIGNEXT
`define SIGNEXT

`timescale 1ns/100ps

module signext
    (
    input  logic [(15):0] A,
    output logic [(31):0] C
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    assign C = {{(16){A[15]}}, A}; // rewritten
endmodule

`endif // SIGNEXT