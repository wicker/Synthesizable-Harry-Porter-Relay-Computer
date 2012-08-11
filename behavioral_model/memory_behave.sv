/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: memory_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 // Model of the 32kbyte memory used in Harry Porter's Relay Computer
 
 module memory(	input logic [14:0][7:0] initial_memory, 
				input logic loadMem,
				interface control_signals,
				interface buses);
 
	// Although there are 16 bits of address the top bit is ignored because only 15 bits are used to access 32k
	logic [14:0][7:0] memory;
	logic [14:0] address;
	logic [7:0] data;
		
		assign buses.dataBusPins = (control_signals.WriteMempin) ? data : 'z;
	
	always@(posedge loadMem)
	begin
		memory = initial_memory;
	end
	
	always_comb
	begin
		address = buses.addressBusPins[14:0];
		if(control_signals.ReadMempin)
		begin
			data = memory[address][7:0];
		end
		else if(control_signals.WriteMempin)
		begin
			memory[address][7:0] = data;
		end
	end
 
 endmodule