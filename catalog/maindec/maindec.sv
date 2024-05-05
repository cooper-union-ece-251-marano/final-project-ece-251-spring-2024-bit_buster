//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Grace Tseng <grace.tseng@cooper.edu>
// 
//     Create Date: 2023-02-07
//     Module Name: maindec
//     Description: 32-bit RISC-based CPU main decoder (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef MAINDEC
`define MAINDEC

`timescale 1ns/100ps

module maindec
    #(parameter n = 32)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [5:0] op,
    output logic       memtoreg, memwrite,
    output logic       branch, alusrc,
    output logic       regdst, regwrite,
    output logic       jump,
    output logic [1:0] aluop
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [8:0] controls; // 9-bit control vector

    // controls has 9 logical signals
    assign {regwrite, regdst, alusrc, branch, memwrite,
            memtoreg, jump, aluop} = controls;

    always @* begin
        case(op)
            // R-type instructions
            6'b000000: 
                case (op[5:0])
                    6'b100000: controls = 9'b110000010; // ADD
                    6'b100010: controls = 9'b110000100; // SUB
                    6'b100100: controls = 9'b110000110; // AND
                    6'b100101: controls = 9'b110000111; // OR
                    6'b000000: controls = 9'b110001000; // SLL
                    6'b000010: controls = 9'b110001001; // SRL
                    6'b101010: controls = 9'b110001010; // SLT
                    default:    controls = 9'bxxxxxxxxx; // illegal operation
                endcase
            // I-type instructions
            6'b001000: controls = 9'b101000000; // ADDI
            6'b001010: controls = 9'b101000010; // SUBI
            6'b100011: controls = 9'b101001000; // LW
            6'b101011: controls = 9'b001010000; // SW
            // J-type instructions
            6'b000010: controls = 9'b000000100; // J
            6'b000011: controls = 9'b000000101; // JAL
            // Other instructions
            6'b000100: controls = 9'b000100001; // BEQ
            default:   controls = 9'bxxxxxxxxx;   // illegal operation
        endcase
    end

endmodule

`endif // MAINDEC
