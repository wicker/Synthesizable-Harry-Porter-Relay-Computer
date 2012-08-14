/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: memory_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 // Model of the 32kbyte memory used in Harry Porter's Relay Computer
 
 module memory(	input logic [14:0][7:0] initial_memory, 
				input logic loadMem,
				interface control_signals,
				interface buses,
				output logic loadMemComplete);
 
	// Although there are 16 bits of address the top bit is ignored because only 15 bits are used to access 32k
	logic [14:0][7:0] memory;
	logic [14:0] address;
	logic [7:0] data;
		
		assign buses.dataBusPins = !(control_signals.MemReadpin === 1) ? 'z: data;
	
	always_comb
	begin
		address = buses.addressBusPins[14:0];
  if(control_signals.MemReadpin === 1)
	begin
		data = memory[address][7:0];
		$display( "Inside ReadMem data = %b memory[address] = %d address = %h",data, memory[address], address);
		$display(" dataBusPins = %h" , buses.dataBusPins);
		
	end
	else if(control_signals.MemWritepin === 1)
	begin
		memory[address] = data;
	end
	else if(loadMem)
	begin
		memory = initial_memory;
		loadMemComplete = 1;
	end
 end
 endmodule
