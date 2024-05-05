//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: tb_alu
//     Description: Test bench for simple behavorial ALU
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef _alu_tb
`define _alu_tb

`timescale 1ns/100ps

module alu_tb;

parameter N = 32;

logic [N-1:0] a, b;
logic [2:0] alu_ctrl;
logic [N-1:0] result;
logic fZ;

// Instantiate 
alu #(.n(N)) uut (
    .a(a),
    .b(b),
    .alu_ctrl(alu_ctrl),
    .result(result),
    .fZ(fZ)
);

initial begin
    // Test Add
    a = 32'h12345678;
    b = 32'h87654321;
    alu_ctrl = 3'b000; 
    #10;

    // Test Subtract
    a = 32'h87654321;
    b = 32'h12345678;
    alu_ctrl = 3'b001; 
    #10;

    // Test AND
    a = 32'habcdef00;
    b = 32'h00ff00ff;
    alu_ctrl = 3'b010; 
    #10;

    // Test OR
    a = 32'habcdef00;
    b = 32'h00ff00ff;
    alu_ctrl = 3'b011; 
    #10;

    // Test XOR
    a = 32'habcdef00;
    b = 32'h00ff00ff;
    alu_ctrl = 3'b100; 
    #10;

    // Test Shift left
    a = 32'habcdef00;
    b = 5;
    alu_ctrl = 3'b101; 
    #10;

    // Test Shift right
    a = 32'habcdef00;
    b = 5;
    alu_ctrl = 3'b110; 
    #10;

    // Test Set on less than
    a = 32'h12345678;
    b = 32'habcdef00;
    alu_ctrl = 3'b111; 
    #10;

    // End simulation
    #10 $finish;
end

endmodule

`endif // ALUTB
