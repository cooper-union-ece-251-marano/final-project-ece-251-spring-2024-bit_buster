//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lindsey
// Engineer: Grace
// 
//     Create Date: 2024-05-05
//     Module Name: controller
//     Description: 32-bit RISC-based CPU controller (MIPS)
//
// Revision: 1.0
// 
//////////////////////////////////////////////////////////////////////////////////
`ifndef CONTROLLER
`define CONTROLLER

`timescale 1ns/100ps

`include "../maindec/maindec.sv"
`include "../aludec/aludec.sv"

module controller
    #(parameter n = 32)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [5:0] op, funct,
    input  logic zero,
    output logic memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump,
    output logic [2:0] alucontrol
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [1:0] aluop;
    logic       branch;
    
    // CPU main decoder
    maindec md(
      op, 
      memtoreg, 
      memwrite, 
      branch, 
      alusrc, 
      regdst, 
      regwrite, 
      jump, 
      aluop);
      
    aludec  ad(
      funct,
      aluop,
      alucontrol
      );

  assign pcsrc = branch & zero;

endmodule

`endif // CONTROLLER
