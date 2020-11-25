`timescale 1ns/ 1ps

//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497 
// Engineer: Matthew McDowell 
// 
// Create Date: 10/11/2020 07:43:40 PM
// Module Name: two_one_mux
// Project Name: lab6

//////////////////////////////////////////////////////////////////////////////////

module two_four_decoder(
  input wire [1:0] W,
  input wire En,
  output reg [3:0] Y
  );
  
   always@(En or W)
	  begin
	    if(En==1'b01)
		   case(W)
			  2'b00: Y=4'b0001;
			  2'b01: Y=4'b0010;
			  2'b10: Y=4'b0100;
			  2'b11: Y=4'b1000;
			endcase
		 else
         Y=4'b0000;
     end
endmodule	

