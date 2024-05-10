//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng
// 
//     Create Date: 2024-05-05
//     Module Name: tb_regfile
//     Description: Test bench for register file
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef TB_REGFILE
`define TB_REGFILE

`timescale 1ns/100ps

`include "regfile.sv"

module tb_regfile;

    // Signals
    logic clk;                      // Clock signal
    logic we3;                      // Write enable for register file
    logic [4:0] ra1, ra2, wa3;      // Read and write addresses
    logic [31:0] wd3;               // Write data
    logic [31:0] rd1_exp, rd2_exp;  // Expected read data
    logic [31:0] rd1, rd2;          // Actual read data

    // Instantiate the register file
    regfile rf (
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

    // Initialize signals
    initial begin
        clk = 0;
        we3 = 1; // Enable writing to the register file
        ra1 = 5; // Read address 1
        ra2 = 10; // Read address 2
        wa3 = 3; // Write address
        wd3 = 32'hABCD1234; // Write data
        rd1_exp = 32'h00000000; // Expected read data for address 5
        rd2_exp = 32'h00000000; // Expected read data for address 10

        // Wait for some time
        #10;

        // Display initial state
        $display("Initial state:");
        $display("Read Address 1: %d, Read Address 2: %d, Write Address: %d", ra1, ra2, wa3);
        $display("Write Data: %h", wd3);

        // Provide some time for the register file to update
        #20;

        // Read data from the register file
        rd1 = rf.rd1;
        rd2 = rf.rd2;

        // Check if read data matches expected values
        if (rd1 !== rd1_exp) begin
            $display("Test case failed: Read data mismatch for Read Address 1!");
        end else begin
            $display("Test case passed: Read data matched for Read Address 1.");
        end

        if (rd2 !== rd2_exp) begin
            $display("Test case failed: Read data mismatch for Read Address 2!");
        end else begin
            $display("Test case passed: Read data matched for Read Address 2.");
        end

        // Finish simulation
        $finish;
    end

endmodule

`endif // TB_REGFILE
