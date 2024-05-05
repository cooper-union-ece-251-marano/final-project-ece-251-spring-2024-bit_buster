//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2024-05-05
//     Module Name: tb_sl2
//     Description: Test bench for shift left by 2 (multiply by 4)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_SL2
`define TB_SL2

`timescale 1ns/100ps
`include "sl2.sv"

module tb_sl2;
    parameter n = 32;
    logic [(n-1):0] a, c;

    initial begin
        $dumpfile("sl2.vcd");
        $dumpvars(0, tb_sl2); // Changed "uut" to "tb_sl2"
        //$monitor("a = %0b (0x%0h)(%0d) y = %0b (0x%0h)(%0d) ", a, a, a, y, y, y);
        $monitor("time=%0t \t a=%b c=%b",$realtime, a, c);
    end

    initial begin
        a <= #n'h0000000F;
        #10; // Wait for some simulation time before changing inputs

        // Test case 1: Shift left a value with the LSB set to 1
        a <= #n'h00000001; // Input value: 0000 0000 0000 0000 0000 0000 0000 0001
        #10; // Wait for simulation time to propagate
        // Expected output: 0000 0000 0000 0000 0000 0000 0000 0100
        // Explanation: 0000 0000 0000 0000 0000 0000 0000 0001 << 2 = 0000 0000 0000 0000 0000 0000 0000 0100

        // Test case 2: Shift left a value with all bits set to 1
        a <= #n'hFFFFFFFF; // Input value: 1111 1111 1111 1111 1111 1111 1111 1111
        #10; // Wait for simulation time to propagate
        // Expected output: 1111 1111 1111 1111 1111 1111 1111 1100
        // Explanation: 1111 1111 1111 1111 1111 1111 1111 1111 << 2 = 1111 1111 1111 1111 1111 1111 1111 1100

        // Test case 3: Shift left a value with alternating bits
        a <= #n'hAAAAAAAA; // Input value: 1010 1010 1010 1010 1010 1010 1010 1010
        #10; // Wait for simulation time to propagate
        // Expected output: 1010 1010 1010 1010 1010 1010 1010 1000
        // Explanation: 1010 1010 1010 1010 1010 1010 1010 1010 << 2 = 1010 1010 1010 1010 1010 1010 1010 1000

        // Test case 4: Shift left a value with MSB set to 1
        a <= #n'h80000000; // Input value: 1000 0000 0000 0000 0000 0000 0000 0000
        #10; // Wait for simulation time to propagate
        // Expected output: 0000 0000 0000 0000 0000 0000 0000 0000
        // Explanation: 1000 0000 0000 0000 0000 0000 0000 0000 << 2 = 0000 0000 0000 0000 0000 0000 0000 0000
    end

    sl2 uut(
        .A(a), .C(c)
    );
endmodule

`endif // TB_SL2
