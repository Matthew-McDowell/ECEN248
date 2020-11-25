`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497
// Engineer: Matthew McDowell
// 
// Create Date: 10/04/2020 05:51:42 PM
// Module Name: two_one_mux
// Project Name: ECEN 248 LAB 5 
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module two_one_mux(Y, A, B, S ); //define module name and its interface

    /* declare output and input ports */
    output wire Y; //declar output of type wire
    input wire A,B,S; //declar inputs of type wire

    /* declare internal nets */
    wire notS; //inverse of S
    wire andA; //output of and0 gate
    wire andB; // output of and1 gate

    /* instantiate gate level modules */
    not not0(notS, S);
    and and0(andA, notS, A);
    and and1(andB, S, B);
    or or0(Y, andA, andB);

    endmodule // designate end of module
