//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng
// 
//     Create Date: 2024-05-05
//     Module Name: tb_regfile
//     Description: Test bench for register file
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_REGFILE
`define TB_REGFILE

`timescale 1ns/100ps
`include "regfile.sv"

module tb_regfile;
    parameter n = 32;

    // Define signals
    logic clk;
    logic we3;
    logic [4:0] ra1, ra2, wa3;
    logic [31:0] wd3;
    logic [31:0] rd1, rd2;

    // Instantiate regfile module
    regfile #(n) dut (
        .clk(clk),
        .we3(we3),
        .ra1(ra1),
        .ra2(ra2),
        .wa3(wa3),
        .wd3(wd3),
        .rd1(rd1),
        .rd2(rd2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a clock with period 10 time units
    end

    // Stimulus generation
    initial begin
        // Initialize inputs
        we3 = 1;
        ra1 = 5'b00000;
        ra2 = 5'b00000;
        wa3 = 5'b00001;
        wd3 = 32'hABCDEFF0;

        // Wait for a few clock cycles
        #10;

        // Assert read data correctness
        if (rd1 !== 32'h0) $fatal("Error: rd1 is not 0");
        if (rd2 !== 32'h0) $fatal("Error: rd2 is not 0");

        // Change input values
        ra1 = 5'b00001;
        ra2 = 5'b00000;
        wa3 = 5'b00001;
        wd3 = 32'h12345678;

        // Wait for a few clock cycles
        #10;

        // Assert read data correctness
        if (rd1 !== 32'hABCDEFF0) $fatal("Error: rd1 is not ABCDEFF0");
        if (rd2 !== 32'h0) $fatal("Error: rd2 is not 0");

        // Add more test cases if needed

        // Finish simulation
        $finish;
    end

endmodule
`endif // TB_REGFILE
