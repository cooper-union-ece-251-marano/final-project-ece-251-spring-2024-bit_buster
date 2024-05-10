//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lindsey R
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2023-02-07
//     Module Name: tb_aludec
//     Description: Test bench for simple behavorial ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ALUDEC
`define TB_ALUDEC

`timescale 1ns/100ps

module tb_aludec;

    // Parameters
    parameter n = 32;
    parameter r = 6;s

    // Inputs
    logic [(r-1):0] funct;
    logic [1:0] aluop;

    // Outputs
    logic [2:0] alucontrol;

    // Instantiate the ALU Decoder
    aludec #(n, r) uut (
        .funct(funct),
        .aluop(aluop),
        .alucontrol(alucontrol)
    );

    // Stimulus
    initial begin
        // Test Case 1: aluop = 00 (addi), funct = 100000 (add)
        aluop = 2'b00;
        funct = 6'b100000;
        #10;
        $display("Test Case 1: aluop = %b, funct = %b, alucontrol = %b", aluop, funct, alucontrol);

        // Test Case 2: aluop = 01 (subi), funct = 100010 (sub)
        aluop = 2'b01;
        funct = 6'b100010;
        #10;
        $display("Test Case 2: aluop = %b, funct = %b, alucontrol = %b", aluop, funct, alucontrol);

        // Test Case 3: aluop = 00 (addi), funct = 101010 (slt)
        aluop = 2'b00;
        funct = 6'b101010;
        #10;
        $display("Test Case 3: aluop = %b, funct = %b, alucontrol = %b", aluop, funct, alucontrol);

        // Test Case 4: aluop = 00 (addi), funct = 100100 (and)
        aluop = 2'b00;
        funct = 6'b100100;
        #10;
        $display("Test Case 4: aluop = %b, funct = %b, alucontrol = %b", aluop, funct, alucontrol);

        // Test Case 5: aluop = 01 (subi), funct = 100101 (or)
        aluop = 2'b01;
        funct = 6'b100101;
        #10;
        $display("Test Case 5: aluop = %b, funct = %b, alucontrol = %b", aluop, funct, alucontrol);

        // Test Case 6: aluop = 00 (addi), funct = 100111 (nor)
        aluop = 2'b00;
        funct = 6'b100111;
        #10;
        $display("Test Case 6: aluop = %b, funct = %b, alucontrol = %b", aluop, funct, alucontrol);

        // Test Case 7: aluop = 01 (subi), funct = 011000 (mult)
        aluop = 2'b01;
        funct = 6'b011000;
        #10;
        $display("Test Case 7: aluop = %b, funct = %b, alucontrol = %b", aluop, funct, alucontrol);

        // Test Case 8: aluop = 00 (addi), funct = 010000 (move hi)
        aluop = 2'b00;
        funct = 6'b010000;
        #10;
        $display("Test Case 8: aluop = %b, funct = %b, alucontrol = %b", aluop, funct, alucontrol);

        // Test Case 9: aluop = 01 (subi), funct = 010001 (move lo)
        aluop = 2'b01;
        funct = 6'b010001;
        #10;
        $display("Test Case 9: aluop = %b, funct = %b, alucontrol = %b", aluop, funct, alucontrol);

        // End simulation
        $finish;
    end

endmodule

`endif // ALUDEC
