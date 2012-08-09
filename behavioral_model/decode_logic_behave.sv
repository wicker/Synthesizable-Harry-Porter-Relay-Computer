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
	paramter ALU = 4'b1000;
	parameter MOV_8 = 2'b00;
	parameter SETAB = 2'b01;
	
	wire [1:0] inst_reg_msb2;
	wire [3:0] inst_reg_msb4;
	wire [2:0] alu_function;
	wire [2:0] movR1, movR2;
	wire alu_reg_to_load;
	
	import state_definitions::*;
	
	assign inst_reg_msb2 = inst_reg_value[7:6];
	assign inst_reg_msb4 = inst_reg_value[7:4];
	assign alu_function = instr_reg_value[2:0];
	assign {movR1,movR2} = inst_reg_value[5:0];
	assign alu_reg_to_load = inst_reg_value[3];
	
	enum logic[2:0] {A, B, C, D, M1, M2, X, Y} RegisterToMove;
	enum logic {AluLoadA, AluLoadD};
	
	always_comb
	begin
	unique case(input_from_fsm)
		// First 3 states are always the same set of control signals
		state_1:
			{control_signals.SelPC, control_signals.MemRead} = 2'b11;
		state_2:
			{control_signals.LdInst, control_signal.LdINC} = 2'b11;
		state_3:
			{control_signals.LdInst, control_signal.LdINC} = 2'b00;
		state_4: // instruction decode logic begins here
			begin
				if(inst_reg_msb4 == ALU) // ALU 
					begin
						control_signals.AluFunctionCode = alu_function;
					end
				else
					begin
						control_signals.AluFucntionCode = '1; // nop for alu module
					end
				if(inst_reg_msb2 == SETAB)
				begin
				/////////////////////////////////////*******This is where I stopped, SETTAB INSTRUCTION
				end
			end
		state_5:
			begin
				{control_signals.SelInc, control_signals.LdPC} = 2'b11;
				if(inst_reg_msb2 == Mov_8) // Mov-8 instruction
				begin
					case(movR1)
						A:	control_signals.LdA = 1;
						B:	control_signals.LdB = 1;
						C:	control_signals.LdC = 1;
						D:	control_signals.LdD = 1;
						M1:	control_signals.LdM1 = 1;
						M2:	control_signals.LdM2 = 1;
						X:	control_signals.LdX = 1;
						Y:	control_signals.LdY = 1;
					endcase
					case(movR2)
						A:	control_signals.SelA = 1;
						B:	control_signals.SelB = 1;
						C:	control_signals.SelC = 1;
						D:	control_signals.SelD = 1;
						M1:	control_signals.SelM1 = 1;
						M2:	control_signals.SelM2 = 1;
						X:	control_signals.SelX = 1;
						Y:	control_signals.SelY = 1;
					endcase
				end
				else if(inst_reg_msb4 == ALU) // ALU instruction
				begin
					case(alu_reg_to_load)
					AluLoadA:
						control_signals.LdA = 1;
					AluLoadD:
						control_signals.LdD = 1;
				end
			end
		state_6:
			begin
				control_signals.LdPC = 0;
				if(inst_reg_msb2 == '0) // Mov-8 instruction
				begin
					case(movR1)
						A:	control_signals.LdA = 0;
						B:	control_signals.LdB = 0;
						C:	control_signals.LdC = 0;
						D:	control_signals.LdD = 0;
						M1:	control_signals.LdM1 = 0;
						M2:	control_signals.LdM2 = 0;
						X:	control_signals.LdX = 0;
						Y:	control_signals.LdY = 0;
					endcase
				end
				else if(inst_reg_msb4 == ALU) // ALU instruction
				begin
					case(alu_reg_to_load)
					AluLoadA:
						control_signals.LdA = 0;
					AluLoadD:
						control_signals.LdD = 0;
				end
			end
		state_7:
			begin
				control_signals.AluFunctionCode = '1;
				if(inst_reg_msb2 == '0) // Mov-8 instruction
				begin
					case(movR2)
						A:	control_signals.SelA = 0;
						B:	control_signals.SelB = 0;
						C:	control_signals.SelC = 0;
						D:	control_signals.SelD = 0;
						M1:	control_signals.SelM1 = 0;
						M2:	control_signals.SelM2 = 0;
						X:	control_signals.SelX = 0;
						Y:	control_signals.SelY = 0;
					endcase
				end
			end
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