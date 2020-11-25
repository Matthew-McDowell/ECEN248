`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497 
// Engineer: Matthew McDowell
// 
// Create Date: 10/19/2020 03:03:07 PM
// Module Name: d_flip_flop
// Project Name: lab7 
// 
//////////////////////////////////////////////////////////////////////////////////


module d_flip_flop(Q, notQ, Clk, D);
    //declare all ports
    output wire Q, notQ; //outputs of slave
    input wire Clk, D;
    wire notClk;
    wire Qm; //output of master
    //notQm is used in instantiation
    //but left unconnected
    wire notQm;
    assign #2 notClk = ~Clk;
    d_latch master (Qm, notQm, notClk, D);
    d_latch slave (Q, notQ, Clk, Qm);
endmodule
