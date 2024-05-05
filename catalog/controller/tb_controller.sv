//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lindsey R
// Engineer: Grace Tseng <grace.tseng@cooper.edu> (added test cases + made them display)
// 
//     Create Date: 2023-02-07
//     Module Name: tb_controller
//     Description: Test bench for controller
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_CONTROLLER
`define TB_CONTROLLER

`timescale 1ns/100ps

module controller_tb;

    parameter N = 32;

    // Define signals 
    logic [5:0] op;
    logic [5:0] funct;
    logic zero;
    logic memtoreg;
    logic memwrite;
    logic pcsrc;
    logic alusrc;
    logic regdst;
    logic regwrite;
    logic jump;
    logic [2:0] alucontrol;

    // Instantiate controller module
    controller #(N) dut (
        .op(op),
        .funct(funct),
        .zero(zero),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .pcsrc(pcsrc),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .alucontrol(alucontrol)
    );

    // Clock generation
    logic clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Test case 1
        op = 6'b000000;
        funct = 6'b000000;
        zero = 1'b0;
        #10;

        // Display results for Test Case 1
        $display("Test case 1 results:");
        $display("op = %h", op);
        $display("funct = %h", funct);
        $display("zero = %b", zero);
        // Display values of other signals as needed

        // Test case 2
        op = 6'b010101;
        funct = 6'b000000;
        zero = 1'b1;
        #10;

        // Display results for Test Case 2
        $display("Test case 2 results:");
        $display("op = %h", op);
        $display("funct = %h", funct);
        $display("zero = %b", zero);
        // Display values of other signals as needed

        // Test case 3
        op = 6'b100000;
        funct = 6'b000000;
        zero = 1'b0;
        #10;

        // Display results for Test Case 3
        $display("Test case 3 results:");
        $display("op = %h", op);
        $display("funct = %h", funct);
        $display("zero = %b", zero);
        // Display values of other signals as needed

        #10 $finish; // Finish simulation after 10 time units
    end

endmodule

`endif // TB_CONTROLLER
