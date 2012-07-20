/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: 3-8 bit function decoder
 * License: MIT http://opensource.org/licenses/MIT
*/

module 3to8Decoder (input [2:0] f1, f2, f3, output [7:0] function);

  // 
  // 3-to-8 Function Decoder
  // 

  reg fctn_code [2:0];
  
  enum logic [7:0] {ADD = 8'b10000000,
                    INC = 8'b01000000,
                    AND = 8'b00100000,
                    OR  = 8'b00010000,
                    XOR = 8'b00001000,
                    NOT = 8'b00000100,
                 SHIFTL = 8'b00000010,
                   NULL = 8'b00000001) function;

  case (function)

       ADD    : 
       INC    : 
       AND    : 
       OR     : 
       XOR    : 
       NOT    : 
       SHIFTL : 
       NULL   : 

endmodule 
