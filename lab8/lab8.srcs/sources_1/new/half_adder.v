`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497
// Engineer: Matthew McDowell
// 
// Create Date: 10/26/2020 11:50:30 AM
// Module Name: half_adder
// Project Name: lab8
//
//////////////////////////////////////////////////////////////////////////////////

module half_adder(S, Cout, A, B);

output wire S, Cout; //outputs
input wire A, B; //inputs

assign S = A ^ B; //A or B gate
assign Cout = A & B; //A and B gate

endmodule