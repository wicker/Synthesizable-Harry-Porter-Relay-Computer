/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: fsm_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 /* This module is the behavior model of the finite state machine used in the sequencer
  * unit of Harry Porter's Relay computer. It takes four inputs from the decode logic to determine
  * how many states are necessary to complete the instruction. It outputs one bit high per state.
  * I.E. in the first state the first output line is high, in the second state the second output
  * line is high, and so on...
  */
 `ifndef INCLUDE_STATE_DEF
	`include "state_definitions_behave.sv"
	`define INCLUDE_STATE_DEF
`endif 
  module Fsm_Behave(input clock, input logic [3:0] instruction_bits, output logic [23:0] outputState);
	
	import state_definitions::*;
	
	// possible instruction classification codes
	enum logic [3:0] { 	mov_8 		= 4'b0000,
						alu 		= 4'b1000,
						setab 		= 4'b0100,
						inc_xy 		= 4'b1011,
						load_store	= 4'b1001,
						goto		= 4'b1100,
						mov16_halt_return_branch = 4'b1010} instruction_class;
						
	stateAndOutput_t state, next_state;
	
	// update state on every clock edge Note: Harry Porter's Relay Computer's fsm did not have a clear signal
	always_ff @(clock)
	begin
			state <= next_state;
	end
	
	// outputs depend only on the state (Moore machine)
	// The state machine simply sends one signal high to represent what state it is in.
	// because I coded the states as a one-hot implementation the output can come directly from
	// the state itself because the enumerated type has the same base type as the outputState output
	always_comb 
	begin
	outputState <= state; 
	end
	
	// Implement next state logic
	always_comb
	begin
	unique case(state)
		state_1:	next_state <= state_2;
		state_2:	next_state <= state_3;
		state_3:	next_state <= state_4;
		state_4:	next_state <= state_5;
		state_5:	next_state <= state_6;
		state_6:	next_state <= state_7;
		state_7:	next_state <= state_8;
		state_8:
				if(instruction_bits inside {mov_8, alu, setab})
					next_state <= state_1;
				else
					next_state <= state_9;
		state_9:	next_state <= state_10;
		state_10:	next_state <= state_11;
		state_11:	next_state <= state_12;
		state_12:	
				if(instruction_bits inside {load_store, mov16_halt_return_branch})
					next_state <= state_1;
				else
					next_state <= state_13;
		state_13:	next_state <= state_14;
		state_14:	
				if(instruction_bits == inc_xy)
					next_state <= state_1;
				else // must be goto (only instruction class that goes to 24 clock cylces)
					next_state <= state_15;
		state_15:	next_state <= state_16;
		state_16:	next_state <= state_17;
		state_17:	next_state <= state_18;
		state_18:	next_state <= state_19;
		state_19:	next_state <= state_20;
		state_20:	next_state <= state_21;
		state_21: 	next_state <= state_22;
		state_22:	next_state <= state_23;
		state_23:	next_state <= state_24;
		state_24:	next_state <= state_1;
		default: next_state <= state_1;
	endcase					
	end
  endmodule
