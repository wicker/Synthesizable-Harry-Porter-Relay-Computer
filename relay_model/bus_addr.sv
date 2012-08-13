/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Address Bus
 * License: MIT http://opensource.org/licenses/MIT
*/

interface Addr_Bus();

  parameter ADDR_BUS_WIDTH = 8;

  wire [ADDR_BUS_WIDTH-1:0] addr;

  modport reg_M     (output addr_wire, input clock);

  modport reg_XY    (inout addr_wire, input clock);

  modport reg_J     (output addr_wire, input clock);

  modport reg_PC    (inout addr_wire, input clock);

  modport reg_INC   (output addr_wire, input clock);

  modport 16_INC    (input addr_wire, input clock);

  modport mem       (input addr_wire, input clock);

endinterface
