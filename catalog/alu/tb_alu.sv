//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineers: Grace Tseng <grace.tseng@cooper.edu>
// Engineers: Lindsey R
//
//     Create Date: 2025-05-10
//     Module Name: tb_alu
//     Description: Test bench for simple behavioral ALU
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef _alu_tb
`define _alu_tb

`timescale 1ns/100ps

module tb_alu;

parameter N = 32;

logic [N-1:0] a, b;
logic [2:0] alu_ctrl;
logic [N-1:0] result;
logic fZ;

// Instantiate ALU
alu #(.n(N)) uut (
    .a(a),
    .b(b),
    .alucontrol(alu_ctrl),
    .result(result),
    .zero(fZ)
);

// Clock generation
logic clk;
always #5 clk = ~clk;

// Test stimulus
initial begin
    clk = 0;
    // Test Add
    a = 32'h12345678;
    b = 32'h87654321;
    alu_ctrl = 3'b010; // Addition
    #10;
    $display("Test Add: a = %h, b = %h, alu_ctrl = %b, result = %h, zero = %b", a, b, alu_ctrl, result, fZ);

    // Test Subtract
    a = 32'h87654321;
    b = 32'h12345678;
    alu_ctrl = 3'b110; // Subtraction
    #10;
    $display("Test Subtract: a = %h, b = %h, alu_ctrl = %b, result = %h, zero = %b", a, b, alu_ctrl, result, fZ);

    // Test AND
    a = 32'habcdef00;
    b = 32'h00ff00ff;
    alu_ctrl = 3'b000; // Bitwise AND
    #10;
    $display("Test AND: a = %h, b = %h, alu_ctrl = %b, result = %h, zero = %b", a, b, alu_ctrl, result, fZ);

    // Test OR
    a = 32'habcdef00;
    b = 32'h00ff00ff;
    alu_ctrl = 3'b001; // Bitwise OR
    #10;
    $display("Test OR: a = %h, b = %h, alu_ctrl = %b, result = %h, zero = %b", a, b, alu_ctrl, result, fZ);

    // Test XOR
    a = 32'habcdef00;
    b = 32'h00ff00ff;
    alu_ctrl = 3'b111; // Bitwise XOR
    #10;
    $display("Test XOR: a = %h, b = %h, alu_ctrl = %b, result = %h, zero = %b", a, b, alu_ctrl, result, fZ);

    // Test Shift left
    a = 32'habcdef00;
    b = 5;
    alu_ctrl = 3'b011; // Shift left
    #10;
    $display("Test Shift left: a = %h, b = %h, alu_ctrl = %b, result = %h, zero = %b", a, b, alu_ctrl, result, fZ);

    // Test Shift right
    a = 32'habcdef00;
    b = 5;
    alu_ctrl = 3'b100; // Shift right
    #10;
    $display("Test Shift right: a = %h, b = %h, alu_ctrl = %b, result = %h, zero = %b", a, b, alu_ctrl, result, fZ);

    // Test Set on less than
    a = 32'h12345678;
    b = 32'habcdef00;
    alu_ctrl = 3'b101; // Set on less than
    #10;
    $display("Test Set on less than: a = %h, b = %h, alu_ctrl = %b, result = %h, zero = %b", a, b, alu_ctrl, result, fZ);

    // End simulation
    #10 $finish;
end

endmodule


`endif // ALUTB
