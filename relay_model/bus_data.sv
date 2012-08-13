/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Data Bus
 * License: MIT http://opensource.org/licenses/MIT
*/

interface Data_Bus();

  parameter DATA_BUS_WIDTH = 8;

  wire [DATA_BUS_WIDTH-1:0] data;

  modport reg_A     (inout data_wire);

  modport reg_B     (inout data_wire);

  modport reg_C     (inout data_wire);

  modport reg_D     (inout data_wire);

  modport reg_M1    (inout data_wire);

  modport reg_M2    (inout data_wire);

  modport reg_X     (inout data_wire);

  modport reg_Y     (inout data_wire);

  modport reg_J1    (input data_wire);

  modport reg_J2    (input data_wire);

  modport reg_INST  (input data_wire);

  modport memory    (inout data_wire);

endinterface
