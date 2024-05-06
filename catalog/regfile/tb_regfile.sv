//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: tb_regfile
//     Description: Test bench for simple behavorial register file
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_REGFILE
`define TB_REGFILE

`timescale 1ns/100ps

module tb_regfile;

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 5;

    // Inputs
    logic clk = 0;
    logic we3 = 1;
    logic [ADDR_WIDTH-1:0] ra1, ra2, wa3;
    logic [DATA_WIDTH-1:0] wd3;

    // Outputs
    logic [DATA_WIDTH-1:0] rd1, rd2;

    // Instantiate regfile
    regfile #(.n(DATA_WIDTH), .r(ADDR_WIDTH)) dut (
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

    // Testbench stimulus
    initial begin
        // Perform write operation
        we3 = 1;
        wa3 = 2;
        wd3 = 32'h12345678;
        ra1 = 2;
        ra2 = 3;
        #10;
        // Perform read operation
        we3 = 0;
        ra1 = 2;
        ra2 = 3;
        #10;
        // End simulation after stimulus
        $finish;
    end

endmodule
`endif // TB_REGFILE
