//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu> (from HW2)
// Engineer: Lindsey R
// 
//     Create Date: 2023-02-07
//     Module Name: tb_dff
//     Description: Test bench for 32 bit D flip flop
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_DFF
`define TB_DFF

`timescale 1ns/100ps
`include "dff.sv"
`include "../clock/clock.sv"

module tb_dff;
    parameter n = 32;      // Testing an 32-bit dff
    logic clk, reset;       // Clock and reset 
    logic [n-1:0] q;         // Data input for the DFF
    logic [n-1:0] qn;       // Output from the DFF

    // UUT
    dff #(.n(n)) uut (
        .clk(clk),
        .reset(reset),
        .q(q),
        .qn(qn)
    );

    // Clock generation process
    initial clk = 0;
    always #5 clk = ~clk;  // Generate a clock of 100MHz

    // Test 
    initial begin
        // Initialize signals
        reset = 1;          // Start with reset high
        q = 0;              // Data is 0
        #10;                // Wait
        
        // Deassert reset and loop through all possible data combinations
        reset = 0;  
        for (int i = 0; i < 2**n; i = i + 1) begin
            q = i;  
            #10;            // Wait for the next positive edge
        end
        
        // Assert and deassert reset
        #10 reset = 1;      // Assert reset
        #10 reset = 0;      // Deassert reset

        // Finish simulation
        #20 $finish;
    end

    // Monitor output
    initial begin
        $dumpfile("tb_dff.vcd");  // name of dump file for waveform gen
        $dumpvars(0, tb_dff);     // dump vars in the tb
        $monitor("Time = %0t, reset = %b, q = %b, qn = %b", $time, reset, q, qn);
    end

endmodule
`endif