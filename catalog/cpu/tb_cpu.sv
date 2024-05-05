//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: tb_cpu
//     Description: Test bench for cpu
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_CPU
`define TB_CPU

`timescale 1ns/100ps

module cpu_tb;

    // Parameters
    parameter N = 32;

    // Inputs
    logic clk, reset;
    logic [N-1:0] instr;

    // Outputs
    logic [N-1:0] pc, aluout, writedata, readdata;
    logic memwrite;

    // Instantiate the CPU module
    cpu #(
        .n(N)
    ) uut (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instr(instr),
        .memwrite(memwrite),
        .aluout(aluout),
        .writedata(writedata),
        .readdata(readdata)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        reset = 1;
        #10 reset = 0;
    end

    // Stimulus generation
    initial begin
        // Wait for initial reset to complete
        #20;

        // Send some sample instructions
        instr = 32'h00001000; // Example instruction
        #10;
        instr = 32'h00002000; // Another example instruction
        #10;
        // Add more instructions as needed

        // End simulation
        #100 $finish;
    end

endmodule

`endif