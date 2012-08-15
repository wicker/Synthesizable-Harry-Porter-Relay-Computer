/* Author: Maisee Brown
 * Modified for relay model by Jenner Hanni
 * Project: Harry Porter Relay Computer 
 * File: memory_relay.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 // Model of the 32kbyte memory used in Harry Porter's Relay Computer
 
 module Memory (input logic [14:0][7:0] initial_memory, 
				input logic loadMem,
				Ctrl_Bus control,
				Data_Bus data_bus,
				Addr_Bus addr_bus,
                                LED_Bus led,
                                output logic loadMemComplete);
 
	// Although there are 16 bits of address the top bit is ignored 
        // because only 15 bits are used to access 32k
	logic [14:0][7:0] memory;
	logic [14:0] address;
	logic [7:0] data;

 	// logic loadMemComplete = 0;
		
 	assign data_bus.data = (control.mem_write) ? data : 'z;
	
	always_comb
	begin
                if (loadMem) begin
			memory = initial_memory;
			loadMemComplete = 1;
		end
                else begin 
			address = addr.address[14:0];
			if(control.mem_read)
			begin
				data = memory[address][7:0];
			end
			else if(control.mem_write)
			begin
				memory[address][7:0] = data;
			end
		end
	end
 
 endmodule
