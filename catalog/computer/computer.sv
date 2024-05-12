//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineers: Grace Tseng <grace.tseng@cooper.edu>
// Engineers: Lindsey Rodriguez
// 
//     Create Date: 2023-02-07
//     Module Name: computer
//     Description: 32-bit RISC
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef COMPUTER
`define COMPUTER

`timescale 1ns/100ps

`include "../cpu/cpu.sv"
`include "../imem/imem.sv"
`include "../dmem/dmem.sv"

module computer 
    #(parameter n = 32)(
    
    input  logic           clk, reset, 
    output logic [(n-1):0] writedata, dataadr, 
    output logic           memwrite
);
    
    logic [(n-1):0] pc, instr, readdata;

    // Internal components

    // RISC CPU
    cpu mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
    
    // Instruction memory ("text segment") in main memory
    imem imem(pc[7:2], instr);
   
    // Data memory ("data segment") in main memory
    dmem dmem(clk, memwrite, dataadr, writedata, readdata);

endmodule
`endif // COMPUTER
