`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497 
// Engineer: Matthew McDowell
// 
// Create Date: 10/19/2020 03:03:07 PM
// Module Name: d_latch
// Project Name: lab7 
// 
//////////////////////////////////////////////////////////////////////////////////


module d_latch(Q, notQ, En, D);
    //declare all ports
    output wire Q, notQ;
    input wire En, D;
    //intermediate nets
    //nandSEN is the ouput of NAND(S,En)
    //nandREN is the output of NAND(R,En)
    wire nandDEN, nandnotDEN, notD;
    assign #2 notD = ~D;
    assign nandDEN = ~(D&En);
    assign nandnotDEN = ~(notD&En);
    //delay of nand() is 2ns
    nand #2 nand0(Q, nandDEN, notQ);
    nand #2 nand1(notQ, nandnotDEN, Q);
endmodule
