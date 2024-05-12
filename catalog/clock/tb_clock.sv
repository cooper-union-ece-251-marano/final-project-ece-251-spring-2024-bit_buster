//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
// Create Date: 2024-05-01 
// Module Name: tb_clock
// Description: Test bench for clock generator
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef TB_CLOCK
`define TB_CLOCK

`timescale 1ns/100ps
`include "clock.sv"

module tb_clock;
    // Signals
    wire clk;
    logic enable;

    // Initial block for simulation setup
    initial begin
        // Dump VCD file for waveform viewing
        $dumpfile("clock.vcd");
        $dumpvars(0, tb_clock);
        
        // Monitor the signals
        $monitor("time=%0t \t enable=%b clk=%b", $realtime, enable, clk);
    end

    // Stimulus block
    initial begin
        // Test case 1: Enable clock for a short duration
        enable = 0;
        #10 enable = 1; // Enable clock after 10 time units
        #30 enable = 0; // Disable clock after 30 time units

        // Test case 2: Enable clock for a longer duration
        #50 enable = 1; // Enable clock after 50 time units
        #150 enable = 0; // Disable clock after 150 time units

        // Test case 3: Enable clock multiple times
        #200 enable = 1; // Enable clock after 200 time units
        #210 enable = 0; // Disable clock after 210 time units
        #220 enable = 1; // Enable clock after 220 time units
        #240 enable = 0; // Disable clock after 240 time units

        // Test case 4: Enable clock continuously
        #300 enable = 1; // Enable clock after 300 time units
        // Clock remains enabled

        // Finish simulation
        $finish;
    end

    // Instantiate clock generator module
    clock uut(
        .ENABLE(enable),
        .CLOCK(clk)
    );
endmodule

`endif // TB_CLOCK
