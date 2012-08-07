/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Address Bus
 * License: MIT http://opensource.org/licenses/MIT
*/

interface address_bus(input logic clock, inout logic [ADDR_BUS_WIDTH-1:0] address);

  parameter ADDR_BUS_WIDTH = 8;

  wire [ADDR_BUS_WIDTH-1:0] address_wire;

  logic [ADDR_BUS_WIDTH-1:0] address;

  assign address_wire = address;

  modport reg_M     (output address_wire, input clock);

  modport reg_XY    (inout address_wire, input clock);

  modport reg_J     (output address_wire, input clock);

  modport reg_PC    (inout address_wire, input clock);

  modport reg_INC   (output address_wire, input clock);

  modport reg_16INC (input address_wire, input clock);

  modport mem       (input address_wire, input clock);

endinterface
