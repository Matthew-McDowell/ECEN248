`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497
// Engineer: Matthew McDowell
// 
// Create Date: 10/04/2020 05:51:42 PM
// Module Name: four_bit_alu
// Project Name: ECEN 248 LAB 5 
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module four_bit_alu(
 output wire [3:0] Result, // 4 bit output
    output wire Overflow, // 1 bit signal for overflow
    input wire [3:0] opA, opB, // 4 bit operands
    input wire [1:0] ctrl //2 bit operation select
    );
    
    wire [3:0]andAB;
    wire [3:0]Sum;
    wire [3:0]Cout;
    
    assign andAB = opA & opB;
    
    /* Instantiate add/sub modules */
    add_sub adder0(Sum, Cout, opA, opB, ctrl);
    
    /* Instantiate 4-bit 2:1 MUX modules */
    four_bit_mux MUX0(Result, andAB, Sum, ctrl);

    assign Overflow  = Cout & ctrl;
endmodule
