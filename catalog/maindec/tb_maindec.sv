//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2024-05-05
//     Module Name: tb_maindec
//     Description: Test bench for simple behavorial main decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps
`include "maindec.sv"

module tb_maindec;

    // Define parameters
    parameter n = 32;

    // Define signals
    logic [5:0] op;
    logic memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump;
    logic [1:0] aluop;

    // Instantiate maindec module
    maindec #(n) dut (
        .op(op),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .branch(branch),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .aluop(aluop)
    );

    // Stimulus
    initial begin
        // Test case 1: ADD instruction
        op = 6'b000000;
        #10; // Wait for 10 time units
        $display("Test case 1: op = %b, memtoreg = %b, memwrite = %b, branch = %b, alusrc = %b, regdst = %b, regwrite = %b, jump = %b, aluop = %b", op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
        
        // Test case 2: LW instruction
        op = 6'b100011;
        #10;
        $display("Test case 2: op = %b, memtoreg = %b, memwrite = %b, branch = %b, alusrc = %b, regdst = %b, regwrite = %b, jump = %b, aluop = %b", op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
        
        // Test case 3: BEQ instruction
        op = 6'b000100;
        #10;
        $display("Test case 3: op = %b, memtoreg = %b, memwrite = %b, branch = %b, alusrc = %b, regdst = %b, regwrite = %b, jump = %b, aluop = %b", op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
        
        // Add more test cases below
        
        // Test case 4: SW instruction
        op = 6'b101011;
        #10;
        $display("Test case 4: op = %b, memtoreg = %b, memwrite = %b, branch = %b, alusrc = %b, regdst = %b, regwrite = %b, jump = %b, aluop = %b", op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);

        // Test case 5: J instruction
        op = 6'b000010;
        #10;
        $display("Test case 5: op = %b, memtoreg = %b, memwrite = %b, branch = %b, alusrc = %b, regdst = %b, regwrite = %b, jump = %b, aluop = %b", op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);

        // Test case 6: ADDI instruction
        op = 6'b001000;
        #10;
        $display("Test case 6: op = %b, memtoreg = %b, memwrite = %b, branch = %b, alusrc = %b, regdst = %b, regwrite = %b, jump = %b, aluop = %b", op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);

        // Test case 7: JAL instruction
        op = 6'b000011;
        #10;
        $display("Test case 7: op = %b, memtoreg = %b, memwrite = %b, branch = %b, alusrc = %b, regdst = %b, regwrite = %b, jump = %b, aluop = %b", op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);

        // Finish simulation
        $finish;
    end

endmodule
