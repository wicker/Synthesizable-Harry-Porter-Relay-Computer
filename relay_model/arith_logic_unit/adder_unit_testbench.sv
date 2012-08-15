/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Adder unit test bench
 * License: MIT http://opensource.org/licenses/MIT
*/

module AdderUnitTestBench ();

  logic [7:0] b, c, adder_out;
  logic carry;

  wire V; logic V_var;

  initial begin
    V_var = 1;
  end

  EightBitAdderUnit adder (V, b, c, adder_out, carry);

  initial begin
    b = 8'b0;
    c = 8'b1;
    #1
    $display("sum: %b, carry: %b",adder_out,carry);
    b = 8'b1;
    c = 8'b1;
    #1
    $display("sum: %b, carry: %b",adder_out,carry);
  end

endmodule
