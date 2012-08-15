/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: scoreboard_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
package coverage_checker_class_package;
	
	import output_struct_package::*;	
	
	class coverage_checker;
	int instructions_encountered[string];
	int registers_loaded[string];
	int registers_selected[string];
	
	typedef enum logic [7:0] { 	ALU_ADD_TO_A = 	8'b10000000,
						ALU_INC_TO_D =	8'b10001001,
						ALU_AND_TO_A =	8'b10000010,
						ALU_OR_TO_D =	8'b10001011,
						ALU_XOR_TO_A = 	8'b10000100,
						ALU_NOT_TO_D =	8'b10001101,
						ALU_SHL_TO_A =	8'b10000110,
						ALU_NOP_TO_D =	8'b10001111,
						MOV_8_FROM_A =  8'b00000???,
						MOV_8_TO_A = 	8'b00???000,
						MOV_8_FROM_B =  8'b00001???,
						MOV_8_TO_B = 	8'b00???001,
						MOV_8_FROM_C =  8'b00010???,
						MOV_8_TO_C = 	8'b00???010,
						MOV_8_FROM_D =  8'b00011???,
						MOV_8_TO_D = 	8'b00???011,
						MOV_8_FROM_M1 =  8'b00100???,
						MOV_8_TO_M1 = 	8'b00???100,
						MOV_8_FROM_M2 =  8'b00101???,
						MOV_8_TO_M2 = 	8'b00???101,
						MOV_8_FROM_X =  8'b00110???,
						MOV_8_TO_X = 	8'b00???110,
						MOV_8_FROM_Y =  8'b00111???,
						MOV_8_TO_Y = 	8'b00???111,
						SETAB_TO_A_POS = 8'b0100????,
						SETAB_TO_A_NEG = 8'b0101????,
						SETAB_TO_B_POS = 8'b0110????,
						SETAB_TO_B_NEG = 8'b0111????,
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
						GOTO_BNZ =  8'b11100010,
						DONT_CARE = 8'bxxxxxxxx } Instructions_To_Test;
	typedef enum { A, B, C, D, M1, M2, X, Y, J1, J2, XY, M, J, Inc } Registers_To_Test;
	
	function new();
	  
	endfunction
	
	function void print_tallies();
	   Registers_To_Test LdReg, Selreg;
	   Instructions_To_Test inst;
	   
	   int i;
		$display(" Counts on instructions: ");
		foreach(instructions_encountered[inst])
		begin
			$write(" %s : %d \t", inst, instructions_encountered[inst]);
		end
		
		$display("\n Counts on Registers That were loaded");
		foreach(registers_loaded[Ldreg])
		begin
			$write(" %s : %d \t", Ldreg, registers_loaded[Ldreg]);
		end
		
		$display("\n Counts on Registers That were selected");
		foreach(registers_selected[Selreg])
		begin
			$write(" %s : %d \t", Selreg, registers_selected[Selreg]);
		end
		
		$display("");
		
	endfunction
	
	function void insert_results(input output_struct to_enter);
    Instructions_To_Test instruction = Instructions_To_Test'(to_enter.instruction_reg);
//    int result = registers_loaded.exists("LdInc");
  //  $display("result = %b",result);
  
		
		if(instruction != DONT_CARE)
		begin
		  instructions_encountered[instruction.name] = 1;
		end
		 
		
			if(to_enter.LdA === 1)begin registers_loaded["A"] = 1; end
			if(to_enter.LdB === 1)begin registers_loaded["B"] = 1; end
		  if(to_enter.LdC === 1) begin registers_loaded["C"] = 1; end
		  if(to_enter.LdD === 1)begin registers_loaded["D"] = 1; end
		  if(to_enter.LdM1 === 1)begin registers_loaded["M1"] = 1; end
      if(to_enter.LdM2 === 1)begin registers_loaded["M2"] = 1; end
      if(to_enter.LdX === 1)begin registers_loaded["X"] = 1; end
		  if(to_enter.LdY === 1)begin registers_loaded["Y"] = 1; end
		  if(to_enter.LdJ1 === 1)begin registers_loaded["J1"] = 1; end
      if(to_enter.LdJ2 === 1)begin registers_loaded["J2"] = 1; end
		  if(to_enter.LdXY === 1)begin registers_loaded["XY"] = 1;	end  
		  if(to_enter.LdInc === 1)begin registers_loaded["Inc"] = 1; end
		
	  		if(to_enter.SelA === 1)begin registers_selected["A"] = 1; end
			if(to_enter.SelB === 1)begin registers_selected["B"] = 1; end
		  if(to_enter.SelC === 1) begin registers_selected["C"] = 1; end
		  if(to_enter.SelD === 1)begin registers_selected["D"] = 1; end
		  if(to_enter.SelM1 === 1) begin registers_selected["M1"] = 1; end
      if(to_enter.SelM2 === 1)begin registers_selected["M2"] = 1; end
      if(to_enter.SelX === 1)begin registers_selected["X"] = 1; end
		  if(to_enter.SelY === 1)begin registers_selected["Y"] = 1; end
		  if(to_enter.SelM === 1)begin registers_loaded["M"] = 1; end
		  if(to_enter.SelXY === 1)begin registers_loaded["XY"] = 1; end
		  if(to_enter.SelJ === 1)begin registers_loaded["J"] = 1;		  end
		  if(to_enter.SelInc === 1)begin registers_loaded["Inc"] = 1; end
		
	endfunction
	endclass
endpackage