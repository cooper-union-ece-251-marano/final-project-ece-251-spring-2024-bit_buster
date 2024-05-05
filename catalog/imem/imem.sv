//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2024-05-05
//     Module Name: imem
//     Description: 32-bit RISC memory (instruction "text" segment)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef IMEM
`define IMEM

`timescale 1ns/100ps

module imem #(
    parameter int n = 32,
    parameter int r = 6
) (
    // Port Definitions
    input logic [r-1:0] addr,
    output logic [n-1:0] readdata
);

    // Memory Array Declaration
    logic [n-1:0] RAM[0:2**r-1];

    // Initialize Memory with Values from File
    initial begin
        $readmemh("mult-prog_exe", RAM);
    end

    // Assign Output Data from Memory
    assign readdata = RAM[addr];

endmodule

`endif // IMEM
