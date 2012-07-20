/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: alu_testbench_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
`define PrintList $display("\t    time    function_code   b                  c                    result             carry       zero       sign");
 module Alu_TestBench_Behave ();
   
   logic [7:0] b, c, result;
   logic [2:0] function_code;
   logic zero, carry, sign;
   logic Clock;
   
   parameter CLOCK_WIDTH = 20;
   
   Alu_Behave ALU(.*);

// initialize variables
initial 
begin
  function_code = 0;
  b = 0;
  c = 0;
end

// Free running clock
initial
  begin
  Clock = 1'b0;
  forever #CLOCK_WIDTH Clock = ~Clock;
end  

// Monitor inputs and outputs
  initial
  begin
    `PrintList
  $monitor($time, "   %b                   %b     %b     %b          %b           %b             %b  ", function_code, b, c, result, carry, zero, sign);
  end
  
  initial
  begin
    @(posedge Clock) 
    begin
      $display("Testing ADD function with no carry, no zero, positive sign");
      `PrintList
      function_code = 0;
      b = 1;
      c = 1; 
    end
    @(posedge Clock)
    begin
      $display("Testing ADD function with carry, no zero, negative sign");
      `PrintList
      function_code = 0;
      b = 8'b01111111;
      c = 1; 
    end
    @(posedge Clock)
    begin
      $display("Testing ADD function no carry, zero, positive sign");
      `PrintList
      function_code = 0;
      b = 0;
      c = 0; 
    end
    @(posedge Clock)
    begin
      $display("Testing ADD function -1 + 2 no carry, not zero, positive sign");
      `PrintList
      function_code = 0;
      b = 8'b11111111;
      c = 2; 
    end
    @(posedge Clock)
    begin
      $display("Testing ADD function 1 + (-2) no carry, not zero, negative sign");
      `PrintList
      function_code = 0;
      b = 1;
      c = 8'b11111110; 
    end
    @(posedge Clock)
    begin
      $display("Testing ADD function 2 + (-2) no carry, zero, positive sign");
      `PrintList
      function_code = 0;
      b = 2;
      c = 8'b11111110; 
    end
    @(posedge Clock)
    begin
      $display("Testing INC function 2 -> 3 no carry, not zero, positive sign");
      `PrintList
      function_code = 1;
      b = 2;
      c = 2; // should not affect operation
    end
    @(posedge Clock)
    begin
      $display("Testing INC function -2 -> -1 no carry, not zero, negative sign");
      `PrintList
      function_code = 1;
      b = 8'b11111110;
      c = 2; // should not affect operation
    end
    @(posedge Clock)
    begin
      $display("Testing INC function -1 -> 0 no carry, zero, positive sign");
      `PrintList
      function_code = 1;
      b = 8'b11111111;
      c = 8'b11111110; // should not affect operation 
    end
    @(posedge Clock)
    begin
      $display("Testing INC function 011111111 -> -1  carry, not zero, negative sign");
      `PrintList
      function_code = 1;
      b = 8'b01111111;
      c = 8'b11111110; // should not affect operation 
    end
    @(posedge Clock)
    begin
      $display("Testing AND function 00001111 & 10101010 = 00001010  no carry, not zero, positive sign");
      `PrintList
      function_code = 2;
      b = 8'b00001111;
      c = 8'b10101010; 
    end
    @(posedge Clock)
    begin
      $display("Testing AND function 11111111 & 10101010 = 10101010  no carry, not zero, negative sign");
      `PrintList
      function_code = 2;
      b = 8'b11111111;
      c = 8'b10101010; 
    end
    @(posedge Clock)
    begin
      $display("Testing AND function 11111111 & 00000000 = 00000000  no carry, zero, negative sign");
      `PrintList
      function_code = 2;
      b = 8'b11111111;
      c = 8'b00000000;  
    end
    @(posedge Clock)
    begin
      $display("Testing OR function 11111111 & 00000000 = 11111111  no carry, not zero, negative sign");
      `PrintList
      function_code = 3;
      b = 8'b11111111;
      c = 8'b00000000;  
    end
    @(posedge Clock)
    begin
      $display("Testing OR function 00000000 & 00000000 = 00000000  no carry, zero, positive sign");
      `PrintList
      function_code = 3;
      b = 8'b00000000;
      c = 8'b00000000;  
    end
    @(posedge Clock)
    begin
      $display("Testing OR function 01111111 & 00000000 = 01111111  no carry, not zero, positive sign");
      `PrintList
      function_code = 3;
      b = 8'b01111111;
      c = 8'b00000000;  
    end
    @(posedge Clock)
    begin
      $display("Testing XOR function 00001111 & 00000000 = 00001111  no carry, not zero, positive sign");
      `PrintList
      function_code = 4;
      b = 8'b00001111;
      c = 8'b00000000; 
    end
    @(posedge Clock)
    begin
      $display("Testing XOR function 11110000 & 00001111 = 11111111  no carry, not zero, negative sign");
      `PrintList
      function_code = 4;
      b = 8'b11110000;
      c = 8'b00001111; 
    end
    @(posedge Clock)
    begin
      $display("Testing XOR function 11110000 & 11110000 = 00000000  no carry, zero, positive sign");
      `PrintList
      function_code = 4;
      b = 8'b11110000;
      c = 8'b00001111; 
    end
    @(posedge Clock)
    begin
      $display("Testing NOT function 00000000 -> 11111111 no carry, not zero, negative sign");
      `PrintList
      function_code = 5;
      b = 8'b00000000;
      c = 8'b11111110; // should not affect operation 
    end
    @(posedge Clock)
    begin
      $display("Testing NOT function 11111111 -> 00000000 no carry, zero, positive sign");
      `PrintList
      function_code = 5;
      b = 8'b11111111;
      c = 8'b11111110; // should not affect operation 
    end
    @(posedge Clock)
    begin
      $display("Testing NOT function 11111110 -> 00000001 no carry, not zero, positive sign");
      `PrintList
      function_code = 5;
      b = 8'b11111110;
      c = 8'b11111110; // should not affect operation 
    end
    @(posedge Clock)
    begin
      $display("Testing SHL function 00000001 -> 00000010 no carry, not zero, positive sign");
      `PrintList
      function_code = 6;
      b = 8'b00000001;
      c = 8'b00000001; // should not affect operation 
    end
    @(posedge Clock)
    begin
      $display("Testing SHL function 11000000 -> 10000001 no carry, not zero, negative sign");
      `PrintList
      function_code = 6;
      b = 8'b11000000;
      c = 8'b00000001; // should not affect operation 
    end
    @(posedge Clock)
    begin
      $display("Testing SHL function 00000000 -> 00000000 no carry, zero, positive sign");
      `PrintList
      function_code = 6;
      b = 8'b00000000;
      c = 8'b00000001; // should not affect operation 
    end
    @(posedge Clock)
    begin
      $display("Testing NOP function nothing should change except function_code");
      `PrintList
      function_code = 7;
      b = 8'b00000001;
      c = 8'b00000001; // should not affect operation 
    end
    repeat(4)@(posedge Clock);
    $stop;
  end
   
 endmodule