/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: decode_logic_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 /* This module is the heart of the ISA used in Harry Poter's relay computer.
  * It takes the inputs from the fsm and the instruction register value as inputs and
  * produces the control signals for the entire computer. 
  */
  
	module Decode_Logic_Behave (input logic [23:0] input_from_fsm,
								input logic [7:0] inst_reg_value,
								interface control_signals);
								
	import state_definitions::*;
	
	always_comb
	begin
	unique case(input_from_fsm)
		// First 3 states are always the same set of control signals
		state_1:
			{control_signals.SelPC, control_signals.MemRead} = 2'b11;
		state_2:
			{control_signal.LdInst, control_signal.LdINC} = 2'b11;
		state_3:
			{control_signal.LdInst, control_signal.LdINC} = 2'b00;
		state_4: // instruction decode logic begins here
			begin
			end
		state_5:
		state_6:
		state_7:
		state_8:
		state_9:
		state_10:
		state_11:
		state_12:
		state_13:
		state_14:
		state_15:
		state_16:
		state_17:
		state_18:
		state_19:
		state_20:
		state_21:
		state_22:
		state_23:
		state_24:
		
	endcase
	end
	endmodule