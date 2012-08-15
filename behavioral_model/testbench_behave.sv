/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: testbench_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 // This is the testbench that will directively test just the behavioral model of
 // Harry Porter's Relay Computer
 
 module testbench_behave;
	import output_struct_package::*;
	output_struct all_output[];
	output_struct from_comp;
	wire [($bits(output_struct)-1):0] returned_from_comp;
	logic [14:0][7:0] initial_memory; // filled by transaction
	
	logic clock = 1;
	logic loadMem = 0;
	logic loadMemComplete = 0;
	integer test_program_file, r = 0;
	
	assign from_comp = returned_from_comp;
	
	//instantiate behavioral module
	Harry_Porter_Comp #($bits(output_struct)) Relay_Comp(clock, loadMem, initial_memory, returned_from_comp, loadMemComplete);


    initial begin
      clock = 0;
      forever #5
	    if(loadMemComplete == 1)
        clock = ~clock;
    end
	
	// read the program in from a text file and fill the initial memory
	// then assert loadMem to load the initial memory into the DUT.
	// De-assert loadMem. When the DUT has the memory it will assert
	// loadMemCompleted which will start the clock above
	initial begin
		test_program_file = $fopen("test_progam_1.txt");
		assert(test_program_file != 0) else $fatal(" Test Program Could not be opened");
		
		int memLine = 0;
		while(!$feof(test_program_file))
		begin
			r = $fscanf(test_program_file, "%h \n", memory[memLine]);
			memLine = memLine + 1;
		end
		
		loadMem = 1;
		@(posedge loadMemComplete)
		#1 loadMem = 0;
		#2 $display( " %b ", initial_memory);
		#2 $display(" %b ", Relay_Comp.mem.memory);
        #500 $stop;
		
	end
	
	// receive output data into output_struct array 
	// for this behavioral testbench I want to see all of the changes within the system as they happen
	// so I am printing each one out as it is received. 
	int i = 0;
	always @(clock)
	begin
		all_output[i] = from_comp;
		if(!(all_ouput[i].Halt === 1 ) )
		begin
			print_output_struct(all_output[i]);
			i <= i+1;
		end
	end


 endmodule