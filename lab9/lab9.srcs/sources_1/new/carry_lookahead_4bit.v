`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 11:47:42 PM
// Design Name: 
// Module Name: carry_lookahead_4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module carry_lookahead_4bit(Cout,S,X,Y,Cin);

    output wire Cout;
    output wire[3:0]S;
    input wire[3:0]X,Y;
    input wire Cin;
    wire [3:0]genP,genG;
    wire [4:1]C;
    assign C[0] = Cin;

    generate_propogate_unit gu1(genG, genP, X, Y);
    carry_lookahead_unit cu1(C,genG,genP,Cin);
    summation_unit su1(S,genP,C);
    assign Cout = C[4];
endmodule
