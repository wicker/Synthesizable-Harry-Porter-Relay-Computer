/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Address Bus
 * License: MIT http://opensource.org/licenses/MIT
*/

interface addr_bus(input logic clock, inout logic [ADDR_BUS_WIDTH-1:0] address);

  parameter ADDR_BUS_WIDTH = 8;

  wire [ADDR_BUS_WIDTH-1:0] addr_wire;

  logic [ADDR_BUS_WIDTH-1:0] addr;

  assign addr_wire = address;

  modport reg_M     (output addr_wire, input clock);

  modport reg_XY    (inout addr_wire, input clock);

  modport reg_J     (output addr_wire, input clock);

  modport reg_PC    (inout addr_wire, input clock);

  modport reg_INC   (output addr_wire, input clock);

  modport 16_INC    (input addr_wire, input clock);

  modport mem       (input addr_wire, input clock);

endinterface
