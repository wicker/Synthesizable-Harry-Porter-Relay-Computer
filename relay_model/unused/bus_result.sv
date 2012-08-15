/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Result Bus
 * License: MIT http://opensource.org/licenses/MIT
*/

interface Result_Bus();

  parameter RESULT_BUS_WIDTH = 8;

  wire [RESULT_BUS_WIDTH-1:0] alu_result;

  modport reg_M     (output address);

  modport reg_XY    (inout address);

  modport reg_J     (output address);

  modport reg_PC    (inout address);

  modport reg_INC   (output address);

  modport INC16     (input address);

  modport mem       (input address);

endinterface
