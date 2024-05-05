//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: tb_computer
//     Description: Test bench for a single-cycle MIPS computer
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_COMPUTER
`define TB_COMPUTER

`timescale 1ns/100ps

module computer_tb;

    parameter n = 32;

    logic clk;
    logic reset;
    logic [(n-1):0] writedata;
    logic [(n-1):0] dataadr;
    logic memwrite;

    // Instantiate 
    computer #(N) comp (
        .clk(clk),
        .reset(reset),
        .writedata(writedata),
        .dataadr(dataadr),
        .memwrite(memwrite)
    );

    // Clock 
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset 
    initial begin
        reset = 1;
        #10;
        reset = 0;
    end

endmodule
`endif // TB_COMPUTER