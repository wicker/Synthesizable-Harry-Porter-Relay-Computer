/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Adder unit test bench
 * License: MIT http://opensource.org/licenses/MIT
*/

module AdderUnitTestBench ();

  logic [7:0] b, c, adder_out;
  logic carry, clock;

  initial begin
    clock = 0;
    forever #2ns clock = ~clock;
  end

  EightBitAdderUnit adder (clock, b, c, adder_out, carry);

  initial begin
    b = 8'b0;
    c = 8'b1;
    #20
    $display("sum: %b, carry: %b",adder_out,carry);
  end

endmodule
