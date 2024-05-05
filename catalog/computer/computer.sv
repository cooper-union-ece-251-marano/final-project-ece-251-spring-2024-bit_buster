//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
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

module computer #(parameter n = 32)(
    
    input  logic           clk, reset, 
    output logic [(n-1):0] writedata, dataadr, 
    output logic           memwrite
);
    
    logic [(n-1):0] pc, instr, readdata;

    // Internal components

    // CPU
    cpu mips(
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instr(instr),
        .memwrite(memwrite),
        .dataadr(dataadr),
        .writedata(writedata),
        .readdata(readdata)
    );
    
    // Instruction memory ("text segment") in main memory
    imem imem(pc[7:2], instr);
   
    // Data memory ("data segment") in main memory
    dmem dmem(
        .clk(clk),
        .memwrite(memwrite),
        .dataadr(dataadr),
        .writedata(writedata),
        .readdata(readdata)
    );

endmodule
`endif // COMPUTER