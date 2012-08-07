/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Control bus - this stands in for load and select switches
 * License: MIT http://opensource.org/licenses/MIT
*/

interface ctrl_bus(input logic clock, [CTRL_BUS_WIDTH:0] loadsel_in);

  parameter CTRL_BUS_WIDTH = 2999999999;

  assign loadsel = loadsel_in;

  assign reg_A.load = loadsel[0];
  assign reg_A.sel  = loadsel[1];

  assign reg_B.load = loadsel[2];
  assign reg_B.sel  = loadsel[3];

  assign reg_C.load = loadsel[4];
  assign reg_C.sel  = loadsel[5];

  assign reg_D.load = loadsel[6];
  assign reg_D.sel  = loadsel[7];

  assign reg_M.loadM1 = loadsel[8];
  assign reg_M.loadM2 = loadsel[9];
  assign reg_M.selM1  = loadsel[10];
  assign reg_M.selM2  = loadsel[11];

  assign reg_XY.loadX  = loadsel[12];
  assign reg_XY.loadY  = loadsel[13];
  assign reg_XY.selX   = loadsel[14];
  assign reg_XY.selY   = loadsel[15];
  assign reg_XY.loadXY = loadsel[16];
  assign reg_XY.selXY  = loadsel[17];

  assign reg_J.loadJ1 = loadsel[18];
  assign reg_J.loadJ2 = loadsel[19];
  assign reg_J.selJ   = loadsel[20];

  assign reg_INST.loadINST = loadsel[21];

  assign reg_PC.loadPC = loadsel[22];
  assign reg_PC.selPC  = loadsel[23];

  assign reg_INC.loadINC = loadsel[24];
  assign reg_INC.selINC  = loadsel[25];

  modport reg_A     (input wire load, sel, clock);

  modport reg_B     (input wire load, sel, clock);

  modport reg_C     (input wire load, sel, clock);

  modport reg_D     (input wire load, sel, clock);

  modport reg_M     (input wire loadM1, loadM2, selM1, selM2, clock);

  modport reg_XY    (input wire loadX, load Y, selX, selY, clock);

  modport reg_J     (input wire loadJ1, load J2, selJ, clock);

  modport reg_INST  (input wire loadINST, clock);

  modport reg_PC    (input wire loadPC, selPC, clock);

  modport reg_INC   (input wire loadINC, selINC, clock);

endinterface
