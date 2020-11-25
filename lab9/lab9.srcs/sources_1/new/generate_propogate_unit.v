`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 11:30:38 PM
// Design Name: 
// Module Name: generate_propogate_unit
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
module generate_propogate_unit(G, P, X, Y);
    output wire [3:0] G, P;
    input wire [3:0] X, Y;
    
    assign G = X & Y;
    assign P = X ^ Y;
endmodule