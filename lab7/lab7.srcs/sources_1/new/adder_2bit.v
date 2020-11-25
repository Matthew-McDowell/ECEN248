`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 428004497
// Engineer: Matthew McDowell
// 
// Create Date: 10/04/2020 10:44:21 PM
// Module Name: adder_2bit
// Project Name: ECEN 248 LAB 5
//////////////////////////////////////////////////////////////////////////////////


module adder_2bit(Carry, Sum, A, B);
    input wire [1:0] A;
    input wire [1:0] B;
    output wire [1:0] Sum;
    output wire Carry;
    wire w1;
    full_adder u1(Sum[0],w1,A[0],B[0],1'b0);
    full_adder u2(Sum[1],Carry,A[1],B[1],w1);
endmodule
