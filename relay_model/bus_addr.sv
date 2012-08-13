/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Address Bus
 * License: MIT http://opensource.org/licenses/MIT
*/

interface Addr_Bus();

  parameter ADDR_BUS_WIDTH = 8;

  wire [ADDR_BUS_WIDTH-1:0] addr;

  modport reg_M     (output addr, input clock);

  modport reg_XY    (inout addr, input clock);

  modport reg_J     (output addr, input clock);

  modport reg_PC    (inout addr, input clock);

  modport reg_INC   (output addr, input clock);

  modport INC16     (input addr, input clock);

  modport mem       (input addr, input clock);

endinterface
