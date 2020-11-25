`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 03:41:38 PM
// Design Name: 
// Module Name: carry_lookahead_unit
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


module carry_lookahead_unit(C,G,P,C0);

    output wire[4:1] C;
    input wire[3:0] G,P;
    input wire C0;

    assign 
       C[1] = G[0] | (P[0] & C0),
       C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C0),
       C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C0),
       C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C0);
endmodule

