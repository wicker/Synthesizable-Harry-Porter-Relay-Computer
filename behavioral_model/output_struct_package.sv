/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: output_struct_package.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 package output_struct_package;
 
	typedef struct packed {
	logic LdA, LdB, LdC, LdD, LdM1, LdM2, LdX, LdY, LdJ1, LdJ2, LdInst, LdPC, LdInc, LdXY, LdCond,
			SelA, SelB, SelC, SelD, SelM1, SelM2, SelX, SelY, SelM, SelXY, SelJ, SelPC, 
			SelInc, MemRead, MemWrite, Halt, carry, sign, zero;
	logic [2:0] alu_function_code;
	logic [23:0] fsm_state;
	logic [7:0] instruction_reg;
	logic [7:0] dataBus;
	logic [15:0] addressBus;} output_struct;
 
 endpackage
