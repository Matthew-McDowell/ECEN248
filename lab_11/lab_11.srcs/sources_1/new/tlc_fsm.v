//`timescale 1ns/1ps
//`default_nettype none

`define one_sec     50000000
`define three_sec   150000000
`define thirty_sec  1500000000
`define fifteen_sec 750000000

//`define one_sec 1
//`define three_sec 3
//`define thirty_sec 30
//`define fifteen_sec 15

module tlc_fsm(
    output reg [2:0] state, 		//output for debugging
    output reg RstCount,			//use an always block
    output reg [1:0] highwaySignal, farmSignal,
    input wire [30:0] Count, 		//use n for wire size 
    input wire Clk, Rst 			//clock and reset
);

//defining binary for each state
parameter 	Srst = 3'b000,
            S0 = 3'b001,
          	S1 = 3'b010,
         	S2 = 3'b011,
          	S3 = 3'b100,
            S4 = 3'b101,
            S5 = 3'b110;

//binary assignment to colors
parameter 	green  = 2'b00,
          		yellow = 2'b01,
          		red    = 2'b10;

    /*intermediate nets*/
    reg [3:0] nextState;

    //used to describe next logic state
    always@(state or Count)
        case(state)
            Srst: nextState = S0;
            S0: begin
                if(Count == `one_sec)		//if count reached
                    nextState = S1; 		//transition
                     else //otherwise
                    nextState = S0; 		//remain in current state
            end
            S1: begin
                if(Count == `thirty_sec)		//if count reached
                    nextState = S2; 		//transition
                else //otherwise
                    nextState = S1; 		//remain in current state
            end
                S2: begin
                if(Count == `three_sec)		//if count reached
                    nextState = S3; 		//transition
                else //otherwise
                    nextState = S2; 		//remain in current state
            end
                S3: begin
                if(Count == `one_sec)		//if count reached
                    nextState = S4; 		//transition
                else //otherwise
                    nextState = S3; 		//remain in current state
                end
                S4: begin
                if(Count == `fifteen_sec)	//if count reached and farmSensor is high
                    nextState = S5; 		//transition
                else 				//otherwise
                    nextState = S4;
                end
            S5: begin
                if(Count == `three_sec)		//if count reached
                    nextState = S0; 		//transition
                else //otherwise
                    nextState = S5; 		//remain in current state
            end
                default: //avoid latches
                    nextState = Srst;
            endcase

//output logic for each state
    always@(state or Count)
        case(state)
            Srst : begin			//starting state for the system
                highwaySignal = red;
                farmSignal    = red;
                RstCount = 1;
            end
            S0: begin				//what the lights are in S0
                highwaySignal = red;
                farmSignal    = red;                
                if(Count == `one_sec)		//if count reached
                    RstCount = 1; 		//reset counter
                else 				//otherwise
                    RstCount = 0; 		//let counter run
            end
            S1: begin			//what the lights are in S1_A
                highwaySignal = green;
                farmSignal    = red;                
                if(Count == `thirty_sec)		//if count reached
                    RstCount = 1; 		//reset counter
                else 				//otherwise
                    RstCount = 0; 		//let counter run
            end
            S2: begin				//what the lights are in S2
                highwaySignal = yellow;
                farmSignal    = red;                
                if(Count == `three_sec)		//if count reached
                    RstCount = 1; 		//reset counter
                else 				//otherwise
                    RstCount = 0; 		//let counter run
            end
            S3: begin				//what the lights are in S3
                highwaySignal = red;
                farmSignal    = red;                
                if(Count == `one_sec)		//if count reached
                    RstCount = 1; 		//reset counter
                else 				//otherwise
                    RstCount = 0; 		//let counter run
            end
            S4: begin			//what the lights are in S4_B
                highwaySignal = red;
                farmSignal    = green;                
                if(Count == `fifteen_sec)	//if count reached
                    RstCount = 1; 		//reset counter
                else 				//otherwise
                    RstCount = 0; 		//let counter run
            end
            S5: begin				//what the lights are in S5
                highwaySignal = red;
                farmSignal    = yellow;                
                if(Count == `three_sec)		//if count reached
                    RstCount = 1; 		//reset counter
                else 				//otherwise
                    RstCount = 0; 		//let counter run
            end
                default: begin 			//avoid latches!
                highwaySignal = red;
                farmSignal    = red;                
                RstCount = 1; 
                end
        endcase

    //setting up the clock
    always@(posedge Clk)
        if(Rst)
            state <= Srst;
        else
            state <= nextState;

endmodule 