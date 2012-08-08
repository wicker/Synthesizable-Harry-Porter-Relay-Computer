/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: fsm_testbench_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 module Fsm_Testbench_Behave();
 
   logic [3:0] instruction_bits;
   logic [23:0] outputState;
   logic clock;
   
   parameter CLOCK_WIDTH = 20;
   
   Fsm_Behave fsm(.*);
   
   initial
   begin
   $display("4 MSB of instruction    current state    next state     output");
   $monitor($time, "   %b    %b    %b    %h", instruction_bits, fsm.state.name, fsm.next_state.name, outputState);
   end
 
   // Free running clock
  initial
  begin
	clock = 1'b0;
	forever #CLOCK_WIDTH clock = ~clock;
  end
  
  initial 
  begin
	// Mov-8 classed instructions (8 clocks each)
	repeat(8) @(posedge clock) instruction_bits <= 4'b0000; 
	
	// AlU classed instructions (8 clocks each)
	repeat(8) @(posedge clock) instruction_bits <= 4'b1000;
	
	// Setab/ Load immediate instructions (8 clocks each)
	repeat(8) @(posedge clock) instruction_bits <= 4'b0100;
	
	// Load / Store instruction (12 clocks)
	repeat(12) @(posedge clock) instruction_bits <= 4'b1001;
	
	// Mov-16 / Halt / Return / Branch (12 clocks)
	repeat(12) @(posedge clock) instruction_bits <= 4'b1010;
	
	// Inc instruction (14 clocks)
	repeat(14) @(posedge clock) instruction_bits <= 4'b1011;
	
	// GOTO classed instructions (24 clock cycles)
	repeat(26) @(posedge clock) instruction_bits <= 4'b1100;
	$stop;
  end
  
  endmodule