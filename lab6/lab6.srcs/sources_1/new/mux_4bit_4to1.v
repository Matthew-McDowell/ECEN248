`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497 
// Engineer: Matthew McDowell 
// 
// Create Date: 10/11/2020 07:43:40 PM
// Module Name: two_one_mux
// Project Name: lab6

//////////////////////////////////////////////////////////////////////////////////


module mux_4bit_4to1(Y,A,B,C,D,S);

    /*declare output and input ports*/
    output reg [3:0] Y; //output is a 4 bit wide reg
    input wire [3:0] A,B,C,D; //4 bit wide input wires
    input wire [1:0] S; //S is a 2 bit wire
    
    always@(*) //new Verilog trick * means when anything changes
        case(S) //selection based on S
            2'b00: Y = A; //when S == 2'b00
            2'b01: Y = B; //when S == 2'b01
            2'b10: Y = C; //when S == 2'b10
            2'b11: Y = D; //when S == 2'b11
        endcase; 


endmodule
