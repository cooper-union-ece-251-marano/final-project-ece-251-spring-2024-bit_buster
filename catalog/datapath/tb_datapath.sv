//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng
// 
//     Create Date: 2024-05-05
//     Module Name: tb_datapath
//     Description: Test bench for datapath
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_DATAPATH
`define TB_DATAPATH

`timescale 1ns/100ps
`include "datapath.sv"

module tb_datapath;
    parameter n = 32;

    // Declare signals
    logic clk, reset;
    logic memtoreg, pcsrc, alusrc, regdst, regwrite, jump;
    logic [2:0] alucontrol;
    logic zero;
    logic [n-1:0] pc, instr, aluout, writedata, readdata;

    // Instantiate datapath module
    datapath #(n) dut (
        .clk(clk),
        .reset(reset),
        .memtoreg(memtoreg),
        .pcsrc(pcsrc),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .alucontrol(alucontrol),
        .zero(zero),
        .pc(pc),
        .instr(instr),
        .aluout(aluout),
        .writedata(writedata),
        .readdata(readdata)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
    end

    // Stimulus generation
    initial begin
        // Wait for some time
        #100;

        // Provide input values for testing
        memtoreg = 1;
        pcsrc = 0;
        alusrc = 1;
        regdst = 1;
        regwrite = 1;
        jump = 0;
        alucontrol = 3'b010;
        instr = 32'b01010101010101010101010101010101;

        // Wait for simulation to finish
        #1000;
        $finish;
    end
    
    // Stimulus generation
    initial begin
        // Wait for some time
        #100;

        // Test case 1
        $display("Test Case 1:");
        memtoreg = 1;
        pcsrc = 0;
        alusrc = 1;
        regdst = 1;
        regwrite = 1;
        jump = 0;
        alucontrol = 3'b010;
        instr = 32'b01010101010101010101010101010101;
        #10; // Wait for some cycles

        // Test case 2
        $display("Test Case 2:");
        memtoreg = 0;
        pcsrc = 1;
        alusrc = 0;
        regdst = 0;
        regwrite = 0;
        jump = 1;
        alucontrol = 3'b011;
        instr = 32'b10101010101010101010101010101010;
        #10; // Wait for some cycles

        // Test case 3
        $display("Test Case 3:");
        memtoreg = 1;
        pcsrc = 0;
        alusrc = 1;
        regdst = 1;
        regwrite = 1;
        jump = 0;
        alucontrol = 3'b001;
        instr = 32'b11111111111111111111111111111111;
        #10; // Wait for some cycles

        // Test case 4
        $display("Test Case 4:");
        memtoreg = 0;
        pcsrc = 0;
        alusrc = 1;
        regdst = 1;
        regwrite = 1;
        jump = 1;
        alucontrol = 3'b100;
        instr = 32'b00000000000000000000000000000000;
        #10; // Wait for some cycles

        // Wait for simulation to finish
        #1000;
        $finish;
    end


endmodule
`endif // TB_DATAPATH
