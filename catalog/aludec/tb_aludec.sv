//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lindsey R
// Engineer: Grace Tseng <grace.tseng@cooper.edu> (made test cases display)
// 
//     Create Date: 2023-02-07
//     Module Name: tb_aludec
//     Description: Test bench for simple behavorial ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALUDEC
`define ALUDEC

`timescale 1ns/1ns

module alu_decoder_tb;

    logic [2:0] alu_control;
    logic [5:0] alu_opcode;

    // Instantiate 
    alu_decoder uut(
      .alu_control(alu_control),
        .alu_opcode(alu_opcode)
    );

    initial begin
        
    // Test cases
        alu_control = 3'b000; // Test Add 
        #10;
        $display("Test case: Add, alu_control = %b", alu_control);
        
        alu_control = 3'b001; // Test Subtract 
        #10;
        $display("Test case: Subtract, alu_control = %b", alu_control);
        
        alu_control = 3'b010; // Test AND 
        #10;
        $display("Test case: AND, alu_control = %b", alu_control);
        
        alu_control = 3'b011; // Test OR 
        #10;
        $display("Test case: OR, alu_control = %b", alu_control);
        
        alu_control = 3'b100; // Test XOR 
        #10;
        $display("Test case: XOR, alu_control = %b", alu_control);
        
        alu_control = 3'b101; // Test Shift left 
        #10;
        $display("Test case: Shift left, alu_control = %b", alu_control);
        
        alu_control = 3'b110; // Test Shift right 
        #10;
        $display("Test case: Shift right, alu_control = %b", alu_control);
        
        alu_control = 3'b111; // Test Set on less than 
        #10;
        $display("Test case: Set on less than, alu_control = %b", alu_control);

        // End simulation
        $finish;
    end

endmodule
`endif // ALUDEC
