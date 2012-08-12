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
								interface buses,
								interface control_signals);
	parameter ALU = 4'b1000;
	parameter MOV_8 = 2'b00;
	parameter SETAB = 2'b01;
	parameter LOAD_OR_STORE = 4'b1001;
	parameter INC = 4'b1011;
	parameter MOV_16 = 4'b1010;
	parameter HALT = 8'b10101110;
	parameter RETURN_BRANCH = 8'b10101010;
	parameter GOTO = 2'b11;
	
	wire [1:0] inst_reg_msb2;
	wire [3:0] inst_reg_msb4;
	wire [2:0] alu_function;
	wire [2:0] movR1, movR2;
	wire alu_reg_to_load;
	wire [4:0] Immediate;
	wire setab_reg_to_load;
	wire load_or_store_bit;
	wire [1:0] reg_to_load_or_store;
	wire M_or_J_bit;
	wire copy, z0, z1, cy, s;
	wire GOTO_M_or_J;
	wire Call_or_Goto;
	wire PC_or_XY;
	
	logic [7:0] data;
	
	import state_definitions::*;
	
	assign inst_reg_msb2 = inst_reg_value[7:6];
	assign inst_reg_msb4 = inst_reg_value[7:4];
	assign alu_function = inst_reg_value[2:0];
	assign {movR1,movR2} = inst_reg_value[5:0];
	assign alu_reg_to_load = inst_reg_value[3];
	assign Immediate = inst_reg_value[4:0];
	assign setab_reg_to_load = inst_reg_value[5];
	assign buses.dataBusPins = (((inst_reg_msb2 == SETAB) && (state_4 | state_5 | state_6)) ||
							((inst_reg_value == HALT) && (state_8)))? data : 'z;
	assign load_or_store_bit = inst_reg_value[3];
	assign reg_to_load_or_store = inst_reg_value[1:0];
	assign M_or_J_bit = inst_reg_value[2];
	assign {s, cy, z1, z0} = inst_reg_value[4:0];
	assign GOTO_M_or_J = inst_reg_value[5];
	assign Call_or_Goto = inst_reg_value[2:0];
	assign PC_or_XY = inst_reg_value[3];
	
	
	enum logic[2:0] {A, B, C, D, M1, M2, X, Y} RegisterToMove;
	enum logic {AluLoadA, AluLoadD} AluRegToLoad;
	enum logic {SetabLoadA, SetabLoadB} SetabRegToLoad;
	enum logic {Load, Store} LoadOrStore;
	//enum logic [1:0] {A, B, C, D} RegToLoadOrStore;
	enum logic {M, J} RegFromMov_16;
	enum logic {Mbit, Jbit} M_or_J;
	enum logic [2:0] { Call = 3'b111, Goto = 3'b110}CallOrGoto;
	enum logic {PC, XY}PC_OR_XY_SEL;
	
	always_comb
	begin
	unique case(input_from_fsm)
		// First 3 states are always the same set of control signals
		state_1:
			{control_signals.SelPC, control_signals.MemRead} = 2'b11;
		state_2:
			{control_signals.LdInst, control_signals.LdINC} = 2'b11;
		state_3:
			{control_signals.LdInst, control_signals.LdINC} = 2'b00;
		state_4: // instruction decode logic begins here
			begin
			  {control_signals.SelPC, control_signals.MemRead} = 2'b00;
				if(inst_reg_msb4 == ALU) // ALU 
					begin
						control_signals.AluFunctionCode = alu_function;
					end
				else
					begin
						control_signals.AluFunctionCode = '1; // nop for alu module
					end
				if(inst_reg_msb2 == SETAB)
				begin
					 // Sign extend the immediate and place on the data bus
					data = {Immediate[4], Immediate[4], Immediate[4] , Immediate[4:0]};
				end
				//send control signals to the fsm to tell it which instruction we have now
				if(inst_reg_msb2 == MOV_8 | inst_reg_msb2 == SETAB)
					control_signals.fsmInput = {inst_reg_msb2, 2'b00};
				else
					control_signals.fsmInput = inst_reg_msb4;
			end
		state_5:
			begin
				{control_signals.SelINC, control_signals.LdPC} = 2'b11;
				if(inst_reg_msb2 == MOV_8) // Mov-8 instruction
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
					endcase
				end
				else if(inst_reg_msb2 == SETAB)
				begin
					case(setab_reg_to_load)
					SetabLoadA:
						control_signals.LdA = 1;
					SetabLoadB:
						control_signals.LdB = 1;
					endcase
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
						endcase
				end
				else if(inst_reg_msb2 == SETAB)
				  case(setab_reg_to_load)
				  SetabLoadA:
						control_signals.LdA = 0;
					SetabLoadB:
						control_signals.LdB = 0;
				  endcase
			end
		state_7:
			begin
				control_signals.AluFunctionCode = '1;
				control_signals.SelINC = 0;
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
			begin
				if(inst_reg_msb4 == LOAD_OR_STORE)
				begin
				case(load_or_store_bit)
				Load:
					{control_signals.MemRead, control_signals.SelM} = 2'b11;
				Store:
				begin
					control_signals.SelM = 1;
					case(reg_to_load_or_store)
							A: control_signals.SelA = 1;
							B: control_signals.SelB = 1;
							C: control_signals.SelC = 1;
							D: control_signals.SelD = 1;
					endcase
				end
				endcase
			end
				else if (inst_reg_msb4 == INC)
				begin
				 { control_signals.SelXY, control_signals.LdINC} = 2'b11;
				end
				else if (inst_reg_msb4 == MOV_16)
				begin
					case (inst_reg_value)
					HALT:
						begin
							data = '0;
							control_signals.LdPC = 1;
						end
					RETURN_BRANCH:
						begin
							{control_signals.SelXY, control_signals.LdPC} = 2'b11;
						end
					default: // regular mov_16
						begin
							case (M_or_J_bit)
							Mbit:
							begin
							control_signals.SelM = 1;
							  case(PC_or_XY)
							   PC:
							     control_signals.LdPC = 1;
							   XY:
							     control_signals.LdXY = 1;
							  endcase
							end
							Jbit:
							begin
							control_signals.SelJ = 1;
								case(PC_or_XY)
							   PC:
							     control_signals.LdPC = 1;
							   XY:
							     control_signals.LdXY = 1;
							  endcase
							end
							endcase
						end
					endcase
				end 
				else if (inst_reg_msb2 == GOTO)
					{control_signals.SelPC, control_signals.MemRead} = 2'b11;
			end
		state_9:
			begin
				if(inst_reg_msb4 == LOAD_OR_STORE)
				begin
					case (load_or_store_bit)
					Load:
						case(reg_to_load_or_store)
							A: control_signals.LdA = 1;
							B: control_signals.LdB = 1;
							C: control_signals.LdC = 1;
							D: control_signals.LdD = 1;
						endcase
					Store:
					   control_signals.MemWrite = 1;
					endcase
				end
				else if (inst_reg_msb4 == INC)
				begin
				 control_signals.LdINC = 0;
				end
				else if (inst_reg_msb4 == MOV_16)
				begin
					case (inst_reg_value)
					HALT:
						begin
							data = '0;
							control_signals.LdPC = 0;
							control_signals.Halt = 1;
						end
					RETURN_BRANCH:
						begin
							control_signals.LdPC = 0;
						end
					default: // regular mov_16
						begin
							case (M_or_J_bit)
							Mbit:
							begin
								case(PC_or_XY)
							   PC:
							     control_signals.LdPC = 0;
							   XY:
							     control_signals.LdXY = 0;
							  endcase
							end
							Jbit:
							begin
								case(PC_or_XY)
							   PC:
							     control_signals.LdPC = 0;
							   XY:
							     control_signals.LdXY = 0;
							  endcase
							end
							endcase
						end
					endcase
				end 
				else if (inst_reg_msb2 == GOTO)
				begin
					case (GOTO_M_or_J)
					M:
						control_signals.LdM1 = 1;
					J:
						control_signals.LdJ1 = 1;
					endcase
					control_signals.LdINC = 1;
				end
			end
		state_10:
		begin
			if(inst_reg_msb4 == LOAD_OR_STORE)
				begin
					case(load_or_store_bit)
					 Load:
						case(reg_to_load_or_store)
							A: control_signals.LdA = 0;
							B: control_signals.LdB = 0;
							C: control_signals.LdC = 0;
							D: control_signals.LdD = 0;
						endcase
					Store:
					 control_signals.MemWrite = 0;
					endcase 
				end
			else if (inst_reg_msb4 == INC)
				 control_signals.SelXY = 0;
			else if (inst_reg_msb4 == MOV_16)
			  {control_signals.SelM, control_signals.SelJ, control_signals.SelXY} = 3'b000;
			else if (inst_reg_msb2 == GOTO)
			begin
					case (GOTO_M_or_J)
					M:
						control_signals.LdM1 = 0;
					J:
						control_signals.LdJ1 = 0;
					endcase
				control_signals.LdINC = 0;
			end
		end
		state_11:
		begin
			if(inst_reg_msb4 == LOAD_OR_STORE)
				begin
					case(load_or_store_bit)
					Load:
						{control_signals.MemRead, control_signals.SelM} = 2'b00;
					Store:
					begin
						control_signals.SelM = 0;
						case(reg_to_load_or_store)
							A: control_signals.SelA = 0;
							B: control_signals.SelB = 0;
							C: control_signals.SelC = 0;
							D: control_signals.SelD = 0;
						endcase
					end
					endcase
				end
			else if (inst_reg_msb4 == INC)
				begin
					{control_signals.SelINC, control_signals.LdXY} = 2'b11;
				end
			else if (inst_reg_msb2 == GOTO)
				{control_signals.SelPC, control_signals.MemRead} = 2'b00;
		end
		state_12:
		begin
			if (inst_reg_msb4 == INC)
			begin
				control_signals.LdXY = 0;
		  end
			else if (inst_reg_msb2 == GOTO)
				{control_signals.SelINC, control_signals.LdPC} = 2'b11;
		end
		state_13:
			if (inst_reg_msb4 == INC)
				control_signals.SelINC = 0;
				
			else if (inst_reg_msb2 == GOTO)
				control_signals.LdPC = 0;
				
		state_14:
			control_signals.SelINC = 0;
		state_15:
			{control_signals.SelPC, control_signals.MemRead} = 2'b11;
		state_16:
		begin
			case (GOTO_M_or_J)
					M:
						control_signals.LdM2 = 1;
					J:
						control_signals.LdJ2 = 1;
			endcase
			control_signals.LdINC = 1;
		end
		state_17:
		begin
			case (GOTO_M_or_J)
					M:
						control_signals.LdM2 = 0;
					J:
						control_signals.LdJ2 = 0;
			endcase
			control_signals.LdINC = 0;
		end
		state_18:
			{control_signals.SelPC, control_signals.MemRead} = 2'b00;
		state_19:
		begin
			if(Call_or_Goto == Call)
			  begin
				//control_signals.LdXY;
				end
			{control_signals.SelINC, control_signals.LdPC} = 2'b11;
		end
		state_20:
			control_signals.LdPC = 0;
		state_21:
			control_signals.SelINC = 0;
		state_22:
			if((Call_or_Goto == Goto) |
				(z0 && (control_signals.zeropin == 0)) |
				(z1 && control_signals.zeropin) |
				(cy && (control_signals.carrypin == 0)) |
				(s && control_signals.signpin))
					{control_signals.SelJ, control_signals.LdPC} = 2'b11;
		state_23:
			control_signals.LdPC = 0;
		state_24:
			control_signals.SelJ = 0;
		
	endcase
	end
	endmodule