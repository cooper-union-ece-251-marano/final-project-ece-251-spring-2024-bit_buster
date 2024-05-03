//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: tb_adder
//     Description: Test bench for simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ADDER
`define TB_ADDER

`timescale 1ns/100ps
`include "adder.sv"

module tb_adder;
    parameter n = 32;
    logic [(n-1):0] a, b, c;

   initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, uut);
        $monitor("a = 0x%0h b = 0x%0h y = 0x%0h", a, b, c);
    end

    initial begin
        a <= #n'hFFFFFFFF;
        b <= #n'hFFFFFFFF;

        // tests
        a = $random; b = $random;
        a = 32'hFFFFFFFF; b = 32'h00000001; #10;  
        a = 32'h80000000; b = 32'h80000000; #10;  
        a = 32'h00000001; b = 32'h00000001; #10;  
    end

    adder uut(
        .A(a), .B(b), .C(c)
    );
endmodule
`endif // TB_ADDER