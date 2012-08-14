/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Data Bus
 * License: MIT http://opensource.org/licenses/MIT
*/

interface Data_Bus();

  parameter DATA_BUS_WIDTH = 8;

  wire [DATA_BUS_WIDTH-1:0] data;

  modport reg_A     (inout data);

  modport reg_B     (inout data);

  modport reg_C     (inout data);

  modport reg_D     (inout data);

  modport reg_M1    (inout data);

  modport reg_M2    (inout data);

  modport reg_X     (inout data);

  modport reg_Y     (inout data);

  modport reg_J1    (input data);

  modport reg_J2    (input data);

  modport reg_INST  (input data);

  modport memory    (inout data);

  modport reg_CCR   (input data);

endinterface
