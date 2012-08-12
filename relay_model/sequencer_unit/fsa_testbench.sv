/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: FSA Testbench
 * License: MIT http://opensource.org/licenses/MIT
*/

module FSATestBench ();

  logic clock, reset;
  wire logic [22:0] fsm_out, fsm_out_prime;

  FSA sequencer (clock, V, reset, fsm_out, fsm_out_prime);

  initial begin
    clock = 0;
    forever #1ms clock = ~clock;
  end

  always @(posedge clock) begin
    $display("fsm       = %b\nfsm_prime = %b",fsm_out,fsm_out_prime);
    $stop;
  end


endmodule
