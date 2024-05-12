//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu> (from HW2)
//
// 
//     Create Date: 2024-05-01
//     Module Name: dff
//     Description: 32 bit D flip flop
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef DFF
`define DFF

`timescale 1ns/100ps

module dff
    #(parameter n = 32)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic clk, reset,
    input  logic [(n-1):0] q,
    output logic [(n-1):0] qn
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @(posedge clk or posedge reset) begin
        if (reset) qn <= {n{1'b0}}; // if reset is active, reset the output to all zeros
        else qn <= q; // capture the data input at the positive clock edge
    end
endmodule

`endif // DFF