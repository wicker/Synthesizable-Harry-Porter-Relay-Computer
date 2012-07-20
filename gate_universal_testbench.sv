/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Testbench for 1-bit logic block which implements four logic 
 * functions at once.
 * License: MIT http://opensource.org/licenses/MIT
*/

module UniversalGateTestBench;

  UniversalGateBlock GateBlock( b, c, NOT, OR, AND, XOR );
 
  reg Clock, Clear, b_var, c_var;

  //
  // set up monitor
  // 

  initial begin
    $display("b   c    NOT   OR    AND    XOR");
    forever @(posedge Clock) begin
      #1
      $display("%b %b %b %b %b %bi",b,c,NOT,OR,AND,XOR);
    end
  end

  // 
  // Create free running clock
  // 

  initial begin 
    Clock = 0;
    forever #10ms Clock = ~Clock;
  end

  // 
  // Continuous assign statement
  // 

  assign b = b_var;
  assign c = c_var;

  // 
  // Generate combinations after waiting for reset
  // 

  initial begin
    Clear = 1;
    repeat (2) @(negedge Clock);
    Clear = 0;

    repeat (1) @(negedge Clock); {b_var,c_var} = 2'b00;
    repeat (1) @(negedge Clock); {b_var,c_var} = 2'b01;
    repeat (1) @(negedge Clock); {b_var,c_var} = 2'b10;
    repeat (1) @(negedge Clock); {b_var,c_var} = 2'b11;
   
  end

endmodule
