//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: tb_cpu
//     Description: Test bench for cpu
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_CPU
`define TB_CPU

`timescale 1ns/100ps

module computer_tb;

    parameter n = 32;

    // Define test signals
    logic clk;
    logic reset;
    logic [n-1:0] writedata;
    logic [n-1:0] dataadr;
    logic memwrite;

    // Instantiate computer module
    computer #(n) comp (
        .clk(clk),
        .reset(reset),
        .writedata(writedata),
        .dataadr(dataadr),
        .memwrite(memwrite)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset initialization
    initial begin
        reset = 1;
        #10;
        reset = 0;
    end

    // Stimulus generation and assertion checks
    // Example test case: Assert that memwrite is low initially
    initial begin
        // Wait for some time to ensure initialization
        #100;

        // Assertion to check memwrite initially low
        assert(memwrite == 0)
            else $error("Test case failed: memwrite is not low initially");

        // Display result of the assertion
        $display("Test case 1: memwrite is low initially. memwrite = %b", memwrite);

        // Add more test cases as needed

        // Finish simulation after a certain time
        #1000;
        $finish;
    end

endmodule

`endif 