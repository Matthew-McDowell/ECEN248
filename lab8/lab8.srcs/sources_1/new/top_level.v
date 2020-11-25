`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UIN: 248004497
// Engineer: Matthew McDowell
// 
// Create Date: 10/26/2020 11:50:30 AM
// Module Name: top_level
// Project Name: lab8
//
//////////////////////////////////////////////////////////////////////////////////


module top_level(LEDs, SWs, BTNs, FastClk);
    output wire [3:0] LEDs;
    input wire [1:0] SWs, BTNs;
    input wire FastClk;
   
    wire [3:0] Clocks;
    reg SlowClk; // always block for mux
    wire Carry2;
   
    // behavioral description which selects between four available clock signals
    always@(*) // combinational logic
        case(SWs) // SWs is 2 bit bus
            // blocking statments
            2'b00: SlowClk = Clocks[0];
            2'b01: SlowClk = Clocks[1];
            2'b10: SlowClk = Clocks[2];
            2'b11: SlowClk = Clocks[3];
        endcase
   
    // wire up Carry2 to LEDs[3]
    assign Carry2 = LEDs[3];
   
    // instantiate up_counter
    up_counter up_c0(LEDs[2:0], Carry2, BTNs[0], SlowClk, BTNs[1]);
   
    // instantiate clock divider.
    clock_divider clk_div0(
        .ClkOut(Clocks),
        .ClkIn(FastClk)
    );

endmodule
