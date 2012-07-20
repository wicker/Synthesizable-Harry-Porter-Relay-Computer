/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: alu_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 module Alu_Behave (  input logic [7:0] b, 
                      input logic [7:0] c,
                      input logic [2:0] function_code,
                      output logic [7:0] result,
                      output logic sign,
                      output logic carry,
                      output logic zero);
                      
  parameter ADD = 3'b000;
  parameter INC = 3'b001;
  parameter AND = 3'b010;
  parameter OR =  3'b011;
  parameter XOR = 3'b100;
  parameter NOT = 3'b101;
  parameter SHL = 3'b110;
  parameter NOP = 3'b111;
  
  always_comb
  begin
    unique case(function_code)
      ADD: result = b + c;
      INC: result = b + 1;
      AND: result = b & c;
      OR:  result = b | c;
      XOR: result = b ^ c;
      NOT: result = ~b;
      SHL: result = {b[6:0],b[7]};
      NOP: ; // do nothing
    endcase
  
  set_flags(b, c, result);
  end
  
  task set_flags(input [7:0] b, c, result);
  
    // set carry bit
    if(function_code == ADD)
      // carry out in add when operands have same sign and result has a different sign
     if(b[7] == c[7] && result[7] != b[7]) 
        carry = 1;
      else
        carry = 0;
        // carry out in inc when highest possible possitive number increments to -1 
    else if(function_code == INC)
      if(b[7] == 0 && result[7] == 1)
        carry = 1;
    else
        carry = 0;
    else
      carry = 0;
    
    if(result == 0)
      zero = 1;
    else
      zero = 0;
      
    sign = result[7];
  
  endtask

 endmodule