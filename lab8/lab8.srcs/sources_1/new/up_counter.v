`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497
// Engineer: Matthew McDowell
// 
// Create Date: 10/26/2020 11:50:30 AM
// Design Name: 
// Module Name: up_counter
// Project Name: lab8
//
//////////////////////////////////////////////////////////////////////////////////


module up_counter(Count,Carry2,En,Clk,Rst);

    output reg [2:0] Count; //outputs
    output wire Carry2;
    
    input wire En, Clk, Rst; //inputs
    
    wire [2:0] Carry, Sum; //additional needed wires
    
    Threebit_counter UC1(Sum,Carry2,Count,En); //instantiate TBC
    
    always@(posedge Clk or posedge Rst)
        if(Rst) //if Rst == 1'b1
            Count <= 0; //reset
        else //otherwise, latch sum
            Count <= Sum;
endmodule

module Threebit_counter(Sum,Carry2,Count,En);
//declare variables
    input wire En;
    input wire [2:0]Count;
    output wire [2:0]Sum;
    output wire Carry2;
    wire [2:0] Carry;
    
    //instantiate and wire up HAs
    half_adder ha1(Sum[0], Carry[0], En, Count[0]);
    half_adder ha2(Sum[1], Carry[1], Carry[0], Count[1]);
    half_adder ha3(Sum[2], Carry[2], Carry[1], Count[2]);
    
    //wire up carry2
    assign Carry2 = Carry[2];
    
endmodule