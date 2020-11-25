`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// UIN: 428004497
// Engineer: Matthew McDowell
// 
// Create Date: 10/04/2020 10:44:21 PM
// Module Name: four_bit_mux
// Project Name: ECEN 248 LAB 5
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/* This module connects four 1 bit, 2:1 MUXs together to *
* create a single 4 bit, 2:1 MUX */

module four_bit_mux(Y, A, B, S);

/* declare output and input ports */
output wire [3:0] Y;
input wire [3:0] A, B;
input wire S;

/* instantiate user defined modules */
two_one_mux MUX0(Y[0], A[0], B[0], S);
two_one_mux MUX1(Y[1], A[1], B[1], S);
two_one_mux MUX2(Y[2], A[2], B[2], S);
two_one_mux MUX3(Y[3], A[3], B[3], S);


endmodule
