//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2024-05-05
//     Module Name: sl2 
//     Description: shift left by 2 (multiply by 4)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef SL2
`define SL2

`timescale 1ns/100ps

module sl2
    #(parameter n = 32, i =16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [(31):0] A,
    output logic [(31):0] C
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    assign C = { {n{A[(i-1)]}}, A};
endmodule

`endif // SL2