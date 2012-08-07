/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Data Bus
 * License: MIT http://opensource.org/licenses/MIT
*/

interface data_bus(input logic clock, inout logic [DATA_BUS_WIDTH-1:0] data);

  parameter DATA_BUS_WIDTH = 8;

  wire [DATA_BUS_WIDTH-1:0] data_wire;

  logic [DATA_BUS_WIDTH-1:0] data;

  assign data_wire = data;

  modport reg_A     (inout data_wire, input clock);

  modport reg_B     (inout data_wire, input clock);

  modport reg_C     (inout data_wire, input clock);

  modport reg_D     (inout data_wire, input clock);

  modport reg_M     (inout data_wire, input clock);

  modport reg_XY    (inout data_wire, input clock);

  modport reg_J     (input data_wire, input clock);

  modport reg_INST  (input data_wire, input clock);

  modport alu       (output data_wire, input clock);

  modport mem       (inout data_wire, input clock);

endinterface
