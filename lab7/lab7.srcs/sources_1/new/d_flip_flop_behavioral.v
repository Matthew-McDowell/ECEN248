`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497 
// Engineer: Matthew McDowell
// 
// Create Date: 10/19/2020 03:03:07 PM
// Module Name: d_flip_flop_behavioral
// Project Name: lab7 
// 
//////////////////////////////////////////////////////////////////////////////////


module d_flip_flop_behavioral(

    output reg Q, //described in behavioral statement
    output wire notQ, //described in a dataflow statement
    input wire D,
    input wire Clk //clock signal
    );
    //describe behavior of D flip flop
    //posedge means positive(rising) edge
    always@(posedge Clk) //trigger when rising edge of Clk
        Q <= D; //non block assignment statement
    assign notQ = ~Q;
endmodule
