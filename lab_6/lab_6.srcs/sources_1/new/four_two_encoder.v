`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497 
// Engineer: Matthew McDowell 
// 
// Create Date: 10/11/2020 07:43:40 PM
// Module Name: two_one_mux
// Project Name: lab6

//////////////////////////////////////////////////////////////////////////////////

module four_two_encoder(
    input wire [3:0] W,
    output wire zero,
    output reg [1:0] Y
    );
    
    /*can mix levels of abstraction!*/
    assign zero = (W == 4'b0000); //a zero test! notice the use of == rather than =
    
    /*behavioral portion*/
    always@(W)
        begin
            case(W)
                4'b0001: Y = 2'b00; //W[0] lit
                4'b0010: Y = 2'b01; //W[1] lit
                4'b0100: Y = 2'b10; //W[2] lit
                4'b1000: Y = 2'b11; //W[3] lit
                default: Y = 2'bXX; //default covers cases not listed!
                                    //2'bXX means 2 bits of don't cares!
            endcase //designates the end of a case statement
        end
        
endmodule