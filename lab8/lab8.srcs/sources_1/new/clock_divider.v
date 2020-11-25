`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497
// Engineer: Matthew McDowell
// 
// Create Date: 10/26/2020 11:50:30 AM
// Module Name: clock_divider
// Project Name: lab8
//
//////////////////////////////////////////////////////////////////////////////////


module clock_divider(ClkOut, ClkIn);

    output wire [3:0] ClkOut; //output
    input wire ClkIn; //input
    
    parameter n = 26; //time parameter
    
    reg [n:0] Count; //count
    
    always@(posedge ClkIn)
        Count <= Count +1; //count++
        
     assign ClkOut[3:0] = Count[n:n-3]; //update ClkOut
      
      initial begin
         Count <= 0; //reset count
    end
endmodule
