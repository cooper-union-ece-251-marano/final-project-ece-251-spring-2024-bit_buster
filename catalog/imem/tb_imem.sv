//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2024-05-05
//     Module Name: tb_imem
//     Description: Test bench for instruction memory
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_IMEM
`define TB_IMEM

`timescale 1ns/100ps
`include "imem.sv"

module tb_imem;

parameter int n = 32; // Bit length of registers/memory
parameter int r = 6;  // Address width (64=2**6 memory slots in imem)

logic [n-1:0] readdata;
logic [r-1:0] imem_addr;

// Test Bench Initialization
initial begin
    $dumpfile("imem.vcd");
    $dumpvars(0, uut);
    $monitor("time=%0t \t imem_addr=%b readdata=%h", $realtime, imem_addr, readdata);

    // Sequential Test Cases
    repeat (4) begin
        #10 imem_addr = {$random} % (1 << r); // Random Address Generation
    end

    // Finish Simulation
    #100;
    $finish;
end

// Instantiate Instruction Memory Module
imem #(
    .n(n),
    .r(r)
) uut (
    .addr(imem_addr),
    .readdata(readdata)
);

endmodule

`endif // TB_IMEM
