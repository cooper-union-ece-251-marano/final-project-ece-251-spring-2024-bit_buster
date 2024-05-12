//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2024-05-05
//     Module Name: tb_cpu
//     Description: Test bench for CPU
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_CPU
`define TB_CPU

`timescale 1ns/100ps
`include "cpu.sv"

module tb_cpu;
    parameter n = 32;

    // Inputs
    logic clk, reset;
    logic [n-1:0] instr;
    logic memwrite;
    logic [n-1:0] readdata;

    // Outputs
    logic [n-1:0] pc;
    logic [n-1:0] aluout;
    logic [n-1:0] writedata;

    // Instantiate CPU
    cpu #(n) cpu_inst (
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
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Stimulus generation and monitoring
    initial begin
        // Provide stimulus values
        // Assign values to clk, reset, instr, memwrite, and readdata

        // Monitor outputs
        $monitor("Time=%0t, PC=%h, ALUout=%h, Writedata=%h", $time, pc, aluout, writedata);
    end

endmodule

`endif // TB_CPU
