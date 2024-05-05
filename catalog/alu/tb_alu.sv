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
`ifndef TB_ALU
`define TB_ALU

`timescale 1ns/100ps

module alu_tb;

    // Parameters
    parameter N = 32; // Width of input vectors

    // Inputs
    reg [N-1:0] a, b;
    reg [2:0] ctrl;
    
    // Outputs
    wire [N-1:0] r;
    wire zero;

    // Instantiate the ALU
    alu #(N) alu_inst(
        .a(a),
        .b(b),
        .ctrl(ctrl),
        .r(r),
        .zero(zero)
    );

    // Test bench stimulus
    initial begin
        $display("Starting ALU test bench...");
        
        // Test cases
        // You can modify or add test cases as needed
        
        // Test case 1: AND operation
        a = 8'b10101010;
        b = 8'b11001100;
        ctrl = 3'b000;
        #10;
        $display("Test case 1: a = %b, b = %b, ctrl = %b, r = %b, zero = %b", a, b, ctrl, r, zero);
        
        // Test case 2: ADD operation
        a = 8'b10101010;
        b = 8'b11001100;
        ctrl = 3'b010;
        #10;
        $display("Test case 2: a = %b, b = %b, ctrl = %b, r = %b, zero = %b", a, b, ctrl, r, zero);
        
        // Add more test cases as needed
        
        $finish; // End simulation
    end

endmodule