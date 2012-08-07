/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Control bus - this stands in for load and select switches
 * License: MIT http://opensource.org/licenses/MIT
*/

interface ctrk_bus(input logic clock, [CTRL_BUS_WIDTH:0] loadsel);

  parameter CTRL_BUS_WIDTH = 27;

  wire [CTRL_BUS_WIDTH-1:0] loadsel;
  logic [CTRL_BUS_WIDTH-1:0] loadsel;

  assign loadsel_wire = loadsel;

  modport reg_A     (input load, select, clock);

  modport reg_B     (input load, select, clock);

  modport reg_C     (input load, select, clock);

  modport reg_D     (input load, select, clock);

  modport reg_M     (input loadM1, loadM2, selectM1, selectM2, clock);

  modport reg_XY    (input loadX, load Y, selectX, selectY, clock);

  modport reg_J     (input loadJ1, load J2, selectJ, clock);

  modport reg_INST  (input loadINST, clock);

  modport reg_PC    (input loadPC, selectPC, clock);

  modport reg_INC   (input loadINC, selectINC, clock);

  modport alu       (input f_code, clock);

endinterface
