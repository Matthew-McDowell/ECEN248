`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497 
// Engineer: Matthew McDowell
// 
// Create Date: 10/19/2020 03:03:07 PM
// Module Name: sr_latch
// Project Name: lab7 
// 
//////////////////////////////////////////////////////////////////////////////////


module sr_latch(Q, notQ, En, S, R);
    //declare all ports
    output wire Q, notQ;
    input wire En, S, R;
    //intermediate nets
    //nandSEN is the ouput of NAND(S,En)
    //nandREN is the output of NAND(R,En)
    wire nandSEN, nandREN;
    assign nandSEN = ~(S&En);
    assign nandREN = ~(R&En);
    //delay of nand() is 2ns
    nand #4 nand0(Q, nandSEN, notQ);
    nand #4 nand1(notQ, nandREN, Q);
endmodule
