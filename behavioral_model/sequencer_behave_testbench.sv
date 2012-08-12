/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: sequencer_behave_testbench.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 /* This module is a testbench to test the sequencer unit in the behavior model of Harry Porter's
  * relay computer. This will be a directive test and will test all on the instructions know to see
  * that the desired control signals are produced. It will instantiate the buses interface, and the 
  * control_signals interface needed inside of the sequencer unit and will generate the clock as well.
  * It will then pass these interfaces and the instruction into the sequencer unit. 
  */
  
  `ifndef INCLUDED
    `include "interfaces_behave.sv"
    `define INCLUDED
  `endif
  
  module Sequencer_Testbench();
	
	logic clock;
	logic initialize;
	logic [7:0] instruction_reg;
	controlSignals control_signals(initialize);
	buses buses();
	
	parameter CLOCK_WIDTH = 20;
	
	Sequencer_Behave sequencer( .*);
	
	logic [36:0]out;
	
	enum logic [7:0] { 	ALU_ADD_TO_A = 	8'b10000000,
						ALU_INC_TO_D =	8'b10001001,
						ALU_AND_TO_A =	8'b10000010,
						ALU_OR_TO_D =	8'b10001011,
						ALU_XOR_TO_A = 	8'b10000100,
						ALU_NOT_TO_D =	8'b10001101,
						ALU_SHL_TO_A =	8'b10000110,
						ALU_NOP_TO_D =	8'b10001111,
						MOV_8_A_TO_B = 	8'b00000001,
						MOV_8_B_TO_C = 8'b00001010,
						MOV_8_C_TO_D = 8'b00010011,
						MOV_8_D_TO_M1 = 8'b00011100,
						MOV_8_M1_TO_M2 = 8'b00100101,
						MOV_8_M2_TO_X = 8'b00101110,
						MOV_8_X_TO_Y = 8'b00110111,
						MOV_8_Y_TO_A = 8'b00111000,
						SETAB_TO_A =	8'b01001010,
						SETAB_TO_B =	8'b01100010,
						LOAD_A = 		8'b10010000,
						LOAD_B = 		8'b10010001,
						LOAD_C = 		8'b10010010,
						LOAD_D = 		8'b10010011,
						STORE_A = 		8'b10011000,
						STORE_B = 		8'b10011001,
						STORE_C = 		8'b10011010,
						STORE_D = 		8'b10011011,
						INC_XY_INST =    8'b10110000,
            RETURN_BRANCH_INST =   8'b10101010,
            MOV_16_M_TO_PC =  8'b10100000,
            MOV_16_J_TO_PC =  8'b10100100,
            MOV_16_M_TO_XY =  8'b10101100,
            MOV_16_J_TO_XY =  8'b10101000, 
            HALT_INST = 8'b10101110,
            GOTO_SETM = 8'b11000000,
            GOTO_JUMP = 8'b11100110,
            GOTO_CALL = 8'b11100111,
            GOTO_BNEG = 8'b11110000,
            GOTO_BNC =  8'b11101000,
            GOTO_BZ =   8'b11100100,
            GOTO_BNZ =  8'b11100010 } Instructions_To_Test;
	
	// generate free running clock
	initial
	begin
		clock = 1'b0;
		forever #CLOCK_WIDTH clock = ~clock;
	end
	
	always_comb
	begin
    out[0] =  control_signals.LdApin;
    out[1] =  control_signals.LdBpin;
		out[2] =  control_signals.LdCpin;
		out[3] =  control_signals.LdDpin;
		out[4] =  control_signals.LdM1pin;
		out[5] = 	control_signals.LdM2pin;
    out[6] =		control_signals.LdXpin;
		out[7] = 	control_signals.LdYpin;
		out[8] = 	control_signals.LdJ1pin;
		out[9] = 	control_signals.LdJ2pin;
		out[10] = 	control_signals.LdInstpin;
		out[11] = 	control_signals.LdPCpin;
		out[12] = 	control_signals.LdINCpin;
		out[13] = 	control_signals.SelApin;
		out[14] = 	control_signals.SelBpin;
		out[15] = 	control_signals.SelCpin;
		out[16] = 	control_signals.SelDpin;
		out[17] = 	control_signals.SelM1pin;
		out[18] = 	control_signals.SelM2pin;
		out[19] = 	control_signals.SelXpin;
		out[20] = 	control_signals.SelYpin;
		out[21] = 	control_signals.LdXYpin;
		out[22] = 	control_signals.SelMpin;
		out[23] = 	control_signals.SelXYpin;
		out[24] = 	control_signals.SelJpin;
		out[25] = 	control_signals.SelPCpin;
		out[26] = 	control_signals.SelINCpin;
		out[27] = 	control_signals.MemReadpin;
		out[28] =  control_signals.MemWritepin;
		out[29] =  control_signals.Haltpin;
		out[32:30] = control_signals.AluFunctionCodepins;
		out[36:33] = control_signals.fsmInputpins;
	end
	
	//monitor control signals and fsm state
	initial 
	begin
		$display("Time    instruction		current fsm state  	  control_signals     data bus for setab inst");
		$monitor($time, "   %b  %b    %p    %b	", clock, instruction_reg, sequencer.fsm.state.name, out);
	end
	
	// provide stimulus to sequencer
	initial
	begin
		@(clock) instruction_reg = ALU_ADD_TO_A;
		repeat (7) @(clock);
		@(clock) instruction_reg = ALU_INC_TO_D;
		repeat(7) @(clock);
		@(clock) instruction_reg = ALU_AND_TO_A;
		repeat(7) @(clock);
		@(clock) instruction_reg = ALU_OR_TO_D;
		repeat(7) @(clock);
		@(clock) instruction_reg = ALU_XOR_TO_A;
		repeat(7) @(clock);
		@(clock) instruction_reg = ALU_NOT_TO_D;
		repeat(7) @(clock);
		@(clock) instruction_reg = ALU_SHL_TO_A;
		repeat(7) @(clock);
		@(clock) instruction_reg = ALU_NOP_TO_D;
		repeat(7) @(clock);
		@(clock) instruction_reg = MOV_8_A_TO_B;
		repeat(7) @(clock);
		@(clock) instruction_reg = MOV_8_B_TO_C;
		repeat(7) @(clock);
		@(clock) instruction_reg = MOV_8_C_TO_D;
		repeat(7) @(clock);
		@(clock) instruction_reg = MOV_8_D_TO_M1;
		repeat(7) @(clock);
		@(clock) instruction_reg = MOV_8_M1_TO_M2;
		repeat(7) @(clock);
		@(clock) instruction_reg = MOV_8_M2_TO_X;
		repeat(7) @(clock);
		@(clock) instruction_reg = MOV_8_X_TO_Y;
		repeat(7) @(clock);
		@(clock) instruction_reg = MOV_8_Y_TO_A;
		repeat(7) @(clock);
		@(clock) instruction_reg = SETAB_TO_A;
		repeat(7) @(clock);
		@(clock) instruction_reg = SETAB_TO_B;
		repeat(8) @(clock);
		@(clock) instruction_reg = LOAD_A;
		repeat(10) @(clock);
		@(clock) instruction_reg = LOAD_B;
		repeat(11) @(clock);
		@(clock) instruction_reg = LOAD_C;
		repeat(11) @(clock);
		@(clock) instruction_reg = LOAD_D;
		repeat(11) @(clock);
		@(clock) instruction_reg = STORE_A;
		repeat(11) @(clock);
		@(clock) instruction_reg = STORE_B;
		repeat(11) @(clock);
		@(clock) instruction_reg = STORE_C;
		repeat(11) @(clock);
		@(clock) instruction_reg = STORE_D;
		repeat(11) @(clock);
		@(clock) instruction_reg = INC_XY_INST;
		repeat(13) @(clock);
		@(clock) instruction_reg = RETURN_BRANCH_INST;
		repeat(11) @(clock);
		@(clock) instruction_reg = MOV_16_M_TO_PC;
		repeat(11) @(clock);
		@(clock) instruction_reg = MOV_16_J_TO_PC;
		repeat(11) @(clock);
		@(clock) instruction_reg = MOV_16_M_TO_XY;
		repeat(11) @(clock);
		@(clock) instruction_reg = MOV_16_J_TO_XY;
		repeat(11) @(clock);
		@(clock) instruction_reg = GOTO_SETM;
		repeat(23) @(clock);
		@(clock) instruction_reg = GOTO_JUMP;
		repeat(23) @(clock);
		@(clock) instruction_reg = GOTO_CALL;
		repeat(23) @(clock);
		@(clock) instruction_reg = GOTO_BNEG;
		repeat(23) @(clock);
		@(clock) instruction_reg = GOTO_BNC;
		repeat(23) @(clock);
		@(clock) instruction_reg = GOTO_BZ;
		repeat(23) @(clock);
		@(clock) instruction_reg = GOTO_BNZ;
		repeat(23) @(clock);
		@(clock) instruction_reg = HALT_INST;
		repeat(11) @(clock);
	
		
		@(negedge clock) $stop;
	end
	
  endmodule