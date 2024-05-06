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
`timescale 1ns/100ps

module cpu_tb;

  // Parameters
  parameter DATA_WIDTH = 32;
  parameter ADDR_WIDTH = 5;

  // Inputs
  logic clk = 0;
  logic reset = 0;
  logic [(DATA_WIDTH-1):0] instr = 32'h01234567;
  logic [(DATA_WIDTH-1):0] readdata = 32'h89ABCDEF;

  // Outputs
  logic [(DATA_WIDTH-1):0] pc;
  logic memwrite, aluout;
  logic [(DATA_WIDTH-1):0] writedata;

  // Instantiate CPU
  cpu #(DATA_WIDTH) cpu_inst (
    .clk(clk),
    .reset(reset),
    .pc(pc),
    .instr(instr),
    .memwrite(memwrite),
    .aluout(aluout),
    .writedata(writedata),
    .readdata(readdata)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Reset generation
  initial begin
    #20 reset = 1;
    #10 reset = 0;
    #100 $finish;
  end

endmodule
