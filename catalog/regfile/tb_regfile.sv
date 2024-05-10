//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng 
// 
//     Create Date: 2024-05-10
//     Module Name: regfile
//     Description: 32-bit RISC register file
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef REGFILE_TB
`define REGFILE_TB

`timescale 1ns/100ps

module tb_regfile;

    // Parameters
    parameter n = 32;
    parameter r = 5;

    // Inputs
    logic clk;
    logic we3;
    logic [r-1:0] ra1, ra2, wa3;
    logic [n-1:0] wd3;

    // Outputs
    logic [n-1:0] rd1, rd2;

    // Instantiate the Register File
    regfile #(n, r) uut (
        .clk(clk),
        .we3(we3),
        .ra1(ra1),
        .ra2(ra2),
        .wa3(wa3),
        .wd3(wd3),
        .rd1(rd1),
        .rd2(rd2)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial stimulus
    initial begin
        // Initialize inputs
        we3 = 0;
        ra1 = 0;
        ra2 = 0;
        wa3 = 0;
        wd3 = 0;

        // Apply some inputs
        #10;
        we3 = 1;
        wa3 = 1;
        wd3 = 32'hDEADBEEF;
        #10;
        we3 = 0;
        ra1 = 1;
        ra2 = 1;

        // Display outputs
        #10;
        $display("rd1 = %h, rd2 = %h", rd1, rd2);

        // Additional test cases
        #10;
        we3 = 1;
        wa3 = 2;
        wd3 = 32'hABCDEFAB;
        #10;
        we3 = 0;
        ra1 = 2;
        ra2 = 1;

        // Display outputs
        #10;
        $display("rd1 = %h, rd2 = %h", rd1, rd2);

        // End simulation
        $finish;
    end

endmodule

`endif // REGFILE_TB
