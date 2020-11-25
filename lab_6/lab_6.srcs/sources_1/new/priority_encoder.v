`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497 
// Engineer: Matthew McDowell 
// 
// Create Date: 10/11/2020 07:43:40 PM
// Module Name: two_one_mux
// Project Name: lab6

//////////////////////////////////////////////////////////////////////////////////


module priority_encoder(
    input wire [3:0] W, //inputs/outputs
    output wire zero,
    output reg [1:0] Y
);

    assign zero = (W == 4'b0000); //catch zero case

always@(W) //logic
    begin
        casex(W)
            4'b0001: Y = 2'b00;
            4'b001X: Y = 2'b01;
            4'b01XX: Y = 2'b10;
            4'b1XXX: Y = 2'b11;
            default: Y = 2'bXX;
        endcase
    end
endmodule
