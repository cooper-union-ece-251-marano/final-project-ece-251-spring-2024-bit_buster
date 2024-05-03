//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2023-02-07
//     Module Name: tb_mux2
//     Description: Test bench for 2 to 1 multiplexer
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_MUX2
`define TB_MUX2

`timescale 1ns/100ps
`include "mux2.sv"
`include "../clock/clock.sv"

module tb_mux2;
    parameter n = 32;  // 32 bit MUX
    logic [n-1:0] A, B;
    logic sel; 
    logic [n-1:0] C;

   // UUT instantiation
   mux2 #(.n(n)) uut(.A(A), .B(B), .sel(sel), .C(C));


    // Start test
    initial begin
        $dumpfile("tb_mux_2.vcd"); 
        $dumpvars(0, tb_mux2);    

        // Test case 1: set select low, input passed to output y
        sel = 0; A = 8'b10101010; B = 8'b01010101; #10;

        // Test case 2: set select high, input b passed to output y
        sel = 1; #10;

        // Test case 3: set select low, input a with different value
        sel = 0; A = 8'b11110000; B = 8'b00001111; #10;

        // Test case 4: set select high, input b with different value
        sel = 1; #10;

        // Test case 5: set select low, input a and b with complementary values
        sel = 0; A = 8'b11001100; B = ~A; #10;

        $finish;
    end

    // was going to include test number bc hard to read, but no time :(
    int test_number = 1;

    // Monitor output, made %0s intentionally so number wouldn't appear
    initial $monitor("Test%0s: Time=%0t A=%b B=%b sel=%b C=%b", test_number, $time, A, B, sel, C);



endmodule
`endif // TB_MUX2