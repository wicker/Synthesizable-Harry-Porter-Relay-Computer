/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: state_definitions_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 // Package so state definitions can be in the unit scope so all modules
 // can access the inumerated definitions of the states.
 package state_definitions;
   	// states and outputs of the fsm
	typedef enum logic [23:0] { state_1 =	24'b000000000000000000000001,
						state_2 = 	24'b000000000000000000000010,
						state_3 = 	24'b000000000000000000000100,
						state_4 = 	24'b000000000000000000001000,
						state_5 = 	24'b000000000000000000010000,
						state_6 = 	24'b000000000000000000100000,
						state_7 = 	24'b000000000000000001000000,
						state_8 = 	24'b000000000000000010000000,
						state_9 = 	24'b000000000000000100000000,
						state_10 = 	24'b000000000000001000000000,
						state_11 =	24'b000000000000010000000000,
						state_12 =	24'b000000000000100000000000,
						state_13 =	24'b000000000001000000000000,
						state_14 =	24'b000000000010000000000000,
						state_15 =	24'b000000000100000000000000,
						state_16 =	24'b000000001000000000000000,
						state_17 =	24'b000000010000000000000000,
						state_18 =	24'b000000100000000000000000,
						state_19 =	24'b000001000000000000000000,
						state_20 =	24'b000010000000000000000000,
						state_21 =	24'b000100000000000000000000,
						state_22 =	24'b001000000000000000000000,
						state_23 =	24'b010000000000000000000000,
						state_24 =	24'b100000000000000000000000} stateAndOutput_t;
		endpackage
 
 
