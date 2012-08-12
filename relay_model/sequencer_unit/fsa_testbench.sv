/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: FSA Testbench
 * License: MIT http://opensource.org/licenses/MIT
*/

module FSATestBench ();

  logic clock, reset;
  wire logic [2:0] fsm_out;

  FSA sequencer (led_bus.sequencer, clock, reset, fsm_out);

  initial begin
    forever #1ms clock = ~clock;
  end

  initial begin
    $display("fsm = %b",fsm_out);
  $stop;
  end

endmodule
