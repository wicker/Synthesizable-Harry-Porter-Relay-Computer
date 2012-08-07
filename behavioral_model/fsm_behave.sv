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
  
  module fsm_behave(input clock, input logic [3:0] instruction_bits, output logic [23:0] outputState);
	
	// possible instruction classification codes
	enum logic [3:0] { 	mov_8 		= 4'b0000,
						alu 		= 4'b1000,
						setab 		= 4'b0100,
						inc_xy 		= 4'b1011,
						load_store	= 4'b1001,
						goto		= 4'b1100,
						mov16_halt_return_branch = 4'b1010} instruction_class;
						
						
	
	// states and outputs of the fsm
	typedef enum logic [23:0] { state_1 =	0'b000000000000000000000001,
						state_2 = 	0'b000000000000000000000010,
						state_3 = 	0'b000000000000000000000100,
						state_4 = 	0'b000000000000000000001000,
						state_5 = 	0'b000000000000000000010000,
						state_6 = 	0'b000000000000000000100000,
						state_7 = 	0'b000000000000000001000000,
						state_8 = 	0'b000000000000000010000000,
						state_9 = 	0'b000000000000000100000000,
						state_10 = 	0'b000000000000001000000000,
						state_11 =	0'b000000000000010000000000,
						state_12 =	0'b000000000000100000000000,
						state_13 =	0'b000000000001000000000000,
						state_14 =	0'b000000000010000000000000,
						state_15 =	0'b000000000100000000000000,
						state_16 =	0'b000000001000000000000000,
						state_17 =	0'b000000010000000000000000,
						state_18 =	0'b000000100000000000000000,
						state_19 =	0'b000001000000000000000000,
						state_20 =	0'b000010000000000000000000,
						state_21 =	0'b000100000000000000000000,
						state_22 =	0'b001000000000000000000000,
						state_23 =	0'b010000000000000000000000,
						state_24 =	0'b100000000000000000000000} stateAndOutput_t;
						
	stateAndOutput_t state, next_state;
	
	// update state on every clock edge Note: Harry Porter's Relay Computer's fsm did not have a clear signal
	always_ff @(posedge clock)
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
	endcase					
	end
  endmodule
