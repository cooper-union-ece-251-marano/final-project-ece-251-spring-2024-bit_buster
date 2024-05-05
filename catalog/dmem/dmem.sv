//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2024-05-05
//     Module Name: dmem
//     Description: 32-bit RISC memory ("data" segment)
//
// Revision: 1.1
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef DMEM
`define DMEM

`timescale 1ns/100ps

module dmem #(parameter n = 32, parameter r = 6)(
    input  logic             clk, 
    input  logic             read_enable, 
    input  logic             write_enable,
    input  logic [n-1:0]     addr, 
    input  logic [n-1:0]     writedata,
    output logic [n-1:0]     readdata
);

    // ---------------- PORT DEFINITIONS ----------------
    // Add read and write control signals for clarity

    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    logic [n-1:0] RAM [0: (2**r - 1)];

    assign readdata = (read_enable) ? RAM[addr[n-1:r]] : 'z; // Tri-state output for reads

    always_ff @(posedge clk) begin
        if (write_enable) begin
            if (addr[n-1:r] >= 0 && addr[n-1:r] < 2**r) // Check for out-of-bounds address
                RAM[addr[n-1:r]] <= writedata;
            else
                $display("Warning: Attempted write to out-of-bounds address %h", addr);
        end
    end

endmodule

`endif // DMEM

