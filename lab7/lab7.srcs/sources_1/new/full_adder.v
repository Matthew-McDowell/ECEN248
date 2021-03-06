`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// UIN: 428004497
// Engineer: Matthew McDowell
// 
// Create Date: 10/04/2020 10:44:21 PM
// Module Name: full_adder
// Project Name: ECEN 248 LAB 5
//////////////////////////////////////////////////////////////////////////////////

/* This module describes the gate level model of *
* a full adder in Verilog */

module full_adder(S, Cout, A, B, Cin);

    /* declare output and input ports */
    // 1 bit wires
    output wire S, Cout;
    input wire A, B, Cin;

    /* declares internal nets */
    wire andBCin, andACin, andAB; // 1 bit wires

    /* use dataflow to describe the gate level activity */
    assign #6 S = A ^ B ^ Cin; //the hat (^) is for XOR
    assign #4 andAB = A & B; // the ampersand (&) is for and
    assign #4 andACin = A & Cin;
    assign #4 andBCin = B & Cin;
    assign Cout = andAB | andACin | andBCin; //pipe (|) is for or



    endmodule