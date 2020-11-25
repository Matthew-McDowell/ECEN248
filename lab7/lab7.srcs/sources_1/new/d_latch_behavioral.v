`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497 
// Engineer: Matthew McDowell
// 
// Create Date: 10/19/2020 03:03:07 PM
// Module Name: d_latch_behavioral
// Project Name: lab7 
// 
//////////////////////////////////////////////////////////////////////////////////


module d_latch_behavioral(
    //declare ports
    output reg Q, // described in behavioral statement
    output wire notQ, // described in a dataflow statement
    input wire D, En // wires can drive regs
    );
    //describe behavior of D latch
    always@(En or D)
        if(En) // if En != 1'b0
            Q = D; //else Q=Q
    assign notQ = ~Q; //regs can drive wires
endmodule
