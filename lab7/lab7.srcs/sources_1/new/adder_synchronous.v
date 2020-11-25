`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// UIN: 428004497
// Engineer: Matthew McDowell
// 
// Create Date: 10/19/2020 4:49:00 PM
// Module Name: adder_synchronous
// Project Name: ECEN 248 LAB 7
//////////////////////////////////////////////////////////////////////////////////


module adder_synchronous(Carry_reg, Sum_reg, Clk, A, B);
    //outputs
    output reg Carry_reg;
    output reg [1:0] Sum_reg;
    //inputs
    input wire Clk;
    input wire [1:0] A,B;

    reg [1:0] A_reg, B_reg;
    wire Carry;
    wire [1:0] Sum;
    
    //instantiation of 2bit adder
    adder_2bit u1(Carry,Sum,A,B);   
    
    //reg storage
    always@(posedge Clk)
        begin
            A_reg <= A;
            B_reg <= B;
            Carry_reg <= Carry;
            Sum_reg <= Sum;
        end
endmodule
