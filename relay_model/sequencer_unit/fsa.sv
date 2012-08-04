/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Finite State Automata module depends on clock to drive computer
 * License: MIT http://opensource.org/licenses/MIT
*/

module FSA (input logic .power(power_var), .run_stop(run_stop_var), 
                     .single_step(single_step_var), output logic .clock(clock_var));

// This is a 24-state machine where some instructions are aborted earlier
// Each posedge AND negedge clock causes FSA to move to the next state
// Use relays set up logically similar to clock circuit
// Each state has a corresponding output line 't'
// Output for that line is high when in the corresponding state
// Instructions take varying time units to complete
// Fetch-increment-execute
// These 't' outputs tell what time period the FSA is in 

// THESE RELAYS ARE NOT CORRECT

  Relay relayA (.control(A),   
                .in_0(V),
                .in_2(i),
                .out_lo_0(f),
                .out_hi_2(B));

  Relay relayB (.control(B),   
                .in_0(V),
                .in_2(f),
                .out_lo_0(g),
                .out_hi_2(C));

  Relay relayC (.control(C),   
                .in_0(V),
                .in_2(g),
                .out_lo_0(h),
                .out_hi_2(D));

  Relay relayD (.control(D),   
                .in_0(V),
                .in_2(g),
                .out_lo_0(i),
                .out_hi_2(A));

  initial begin
  end


  always @() begin
  end

endmodule
