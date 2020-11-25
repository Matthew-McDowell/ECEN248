`timescale 1ns / 1ps
`default_nettype none

module generate_propagate_unit(G, P, X, Y);

output wire [3:0] G, P; // declare output wires
input wire [3:0] X, Y; // declare input wires

assign #2 G = X & Y; // G = X and Y
assign #2 P = X ^ Y; // P = X xor Y

endmodule

module carry_lookahead_unit(C, G, P, C0);

output wire [4:1] C; // c4 c3 c2 c1
input wire [3:0] G, P; // declare input wires
input wire C0;

// internal logic assignments
assign #4 C[1] = G[0] || C0 & P[0];
assign #4 C[2] = G[1] || (P[1] & G[0]) || (P[1] & P[0] & C0);
assign #4 C[3] = G[2] || (P[2] & G[1]) || (P[2] & P[1] & G[0]) || (P[2] & P[1] & P[0] & C0);
assign #4 C[4] = G[3] || (P[3] & G[2]) || (P[3] & P[2] & G[1]) || (P[3] & P[2] & P[1] & G[0]) || (P[3] & P[2] & P[1] & P[0] & C0);

endmodule

module summation_unit(S, P, C);

output wire [3:0] S; //delclare output wires
input wire [3:0] P, C; // declare input wires

assign #2 S = P ^ C; // S = P xor C

endmodule

module carry_lookahead_4bit(Cout, S, X, Y, Cin);
  // Ports are wires because we are using structual
  output wire Cout; // C4 for a 4-bit adder
  output wire [3:0] S; // final 4-bit sum vector
  input wire [3:0] X, Y; // the 4-bit addends
  input wire Cin; // input carry

  // Intermediete wires
  wire [3:0] G, P;
  wire [4:0] C;
  assign C[0] = Cin;

  // generate_propagate_unit(G, P, X, Y);
  generate_propagate_unit gpu(G, P, X, Y);

  // carry_lookahead_unit (C, G, P, C0);
  carry_lookahead_unit clu(C[4:1], G, P, Cin);

  // summation_unit (S, P, C);
  summation_unit su(S, P, C[3:0]);

  // Assign Cout to wire C
  assign Cout = C[4];

endmodule