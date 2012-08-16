/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: testbench_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 `include sequencer_behave.sv
 `include register_unit_behave.sv
 `include program_control_unit_behave.sv
 `include output_struct_package.sv
 `include memory_behave.sv
 `include interfaces_behave.sv
 `include Harry_Porters_relay_comp_behave.sv
 `include fsm_behave.sv
 `include decode_logic_behave.sv
 `include coverage_checker_behave.sv
 `include alu_behave.sv
 
 // This is the testbench that will directively test just the behavioral model of
 // Harry Porter's Relay Computer
 
 module testbench_behave;
   
	import output_struct_package::*;
	import coverage_checker_class_package::*;
	
	output_struct all_output[];
	output_struct from_comp;
	wire [($bits(output_struct)-1):0] returned_from_comp;
	logic [14:0][7:0] initial_memory = '0; // filled by transaction
	string Throw_away_comments;
	logic clock = 1;
	logic loadMem = 0;
	logic loadMemComplete;
	integer test_program_file, sf;
	int memLine = 0;
	coverage_checker check;
	
	
	assign from_comp = {>>{returned_from_comp}};
	
	//instantiate behavioral module
	Harry_Porter_Comp #($bits(output_struct)) Relay_Comp(clock, loadMem, initial_memory, returned_from_comp, loadMemComplete);


    initial begin
      clock = 0;
      forever #5
	    if(loadMemComplete === 1 && (from_comp.Halt === 0 | from_comp.Halt === 'x))
        clock = ~clock;
    end
	
	// read the program in from a text file and fill the initial memory
	// then assert loadMem to load the initial memory into the DUT.
	// De-assert loadMem. When the DUT has the memory it will assert
	// loadMemCompleted which will start the clock above
	initial begin
	  string str;
	  logic [14:0] i = 0;
	test_program_file = $fopen("test_program_2.txt", "r");
    while ($fgets(str, test_program_file)) begin
      sf = $sscanf(str, "%b ", initial_memory[i][7:0]);
      i = i + 1;
      end
  $fclose (test_program_file);
		loadMem = 1;
		@(posedge loadMemComplete)
		#1 loadMem = 0;
		#2 $display( " %p ", initial_memory);
		#2 $display(" %p ", Relay_Comp.mem.memory);
    //check.print_tallies();
    #1000 $stop;
		
	end
	
	// receive output data into output_struct array 
	// for this behavioral testbench I want to see all of the changes within the system as they happen
	// so I am printing each one out as it is received. 
	
	always @(from_comp.fsm_state)
	begin
	  static int i = 0;
		all_output[i] = from_comp;
		if(!(from_comp.Halt === 1 ) )
		begin
			print_output_struct(from_comp);
//			if(from_comp.instruction_reg !== 'x)
//      			check.insert_results(from_comp);
			i <= i+1;
		end
		else $display("HALT WAS HIT");
	end


 endmodule