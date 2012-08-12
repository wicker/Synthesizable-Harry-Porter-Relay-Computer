/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: sequencer_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 /* This module represents the sequencer unit in Harry Porter's relay computer.
  * It contains the finite state machine, and the decode logic, and produces the control
  * signals for the entire computer. It takes as input the instruction register. It also
  * takes the clock as input and because the decode logic needs access to the data bus the
  * sequencer unit also needs to take the buses interface as input as well.
  */
  
 module Sequencer_Behave(	input clock, 
							input logic [7:0] instruction_reg,
							interface buses,
							interface control_signals);
						
	logic [23:0] fsmOutput;
			
	// instantiate the fsm and the decode logic units
	Fsm_Behave fsm(clock, control_signals.fsmInputpins, fsmOutput);
	Decode_Logic_Behave decoder(fsmOutput, instruction_reg, buses, control_signals);
			
 endmodule