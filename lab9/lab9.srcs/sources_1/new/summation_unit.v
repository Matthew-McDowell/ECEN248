`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 03:34:00 PM
// Design Name: 
// Module Name: summation_unit
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


module summation_unit(S,P,C);

    output wire[3:0]S;
    input wire[3:0] P, C;
    assign S = P ^ C;
endmodule
