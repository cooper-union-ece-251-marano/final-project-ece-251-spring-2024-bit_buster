//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2023-02-07
//     Module Name: tb_signext
//     Description: Test bench for sign extender
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_SIGNEXT
`define TB_SIGNEXT

`timescale 1ns/100ps
`include "signext.sv"

module tb_sl2;
    parameter n = 32; // #bits for an operand
    parameter i = 16; // #bits for an immediate
    logic [(i-1):0] a;
    logic [(n-1):0] c;

   initial begin
        $dumpfile("signext.vcd");
        $dumpvars(0, uut);
        $monitor("time=%0t \t a=%b c=%b", $realtime, a, c);
    end

    initial begin
        // Positive number sign extension
        a <= #i'h1234;
        #10;

        // Negative number sign extension
        a <= #i'h8000;
        #10;

        // Maximum positive number sign extension
        a <= #i'h7FFF;
        #10;

        // Minimum negative number sign extension
        a <= #i'h8000;
        #10;

        // Zero sign extension
        a <= #i'h0000;
        #10;

        // Random positive number sign extension
        a <= #i'h6789;
        #10;

        // Random negative number sign extension
        a <= #i'hA432;
        #10;

        // Maximum positive number with added bits sign extension
        a <= #i'h7FFF;
        #10;

        // Minimum negative number with added bits sign extension
        a <= #i'h8000;
        #10;

        // random
        a <= #i'h0A1F;
        #10;
        a <= #i'hB2F0;
        #10;

        // Add more test cases if needed...
    end

    signext uut(
        .A(a), .C(c)
    );
endmodule
`endif // TB_SIGNEXT
