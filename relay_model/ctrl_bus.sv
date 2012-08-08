/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Control bus - this stands in for load and select switches
 * License: MIT http://opensource.org/licenses/MIT
*/

interface ctrl_bus(input logic clock, [CTRL_BUS_WIDTH:0] loadsel_in);

  parameter CTRL_BUS_WIDTH = 26;

  assign loadsel = loadsel_in;

  assign reg_A.load = loadsel[0];
  assign reg_A.sel  = loadsel[1];

  assign reg_B.load = loadsel[2];
  assign reg_B.sel  = loadsel[3];

  assign reg_C.load = loadsel[4];
  assign reg_C.sel  = loadsel[5];

  assign reg_D.load = loadsel[6];
  assign reg_D.sel  = loadsel[7];

  assign reg_M1.load = loadsel[8];
  assign reg_M1.sel  = loadsel[10];

  assign reg_M2.load = loadsel[9];
  assign reg_M2.sel  = loadsel[11];

  assign reg_M.load  = 
  assign reg_M.sel   = 

  assign reg_X.load  = loadsel[12];
  assign reg_X.sel   = loadsel[14];

  assign reg_Y.load  = loadsel[13];
  assign reg_Y.sel   = loadsel[15];

  assign reg_XY.load = loadsel[16];
  assign reg_XY.sel  = loadsel[17];

  assign reg_J1.load = loadsel[18];
  assign reg_J2.load = loadsel[19];
  assign reg_J.sel   = loadsel[20];

  assign reg_INST.load = loadsel[21];

  assign reg_PC.load = loadsel[22];
  assign reg_PC.sel  = loadsel[23];

  assign reg_INC.load = loadsel[24];
  assign reg_INC.sel  = loadsel[25];

  modport reg_A     (input wire load, sel, clock);  

  modport reg_B     (input wire load, sel, clock);

  modport reg_C     (input wire load, sel, clock);

  modport reg_D     (input wire load, sel, clock);

  modport reg_M1    (input wire load, sel, clock);

  modport reg_M2    (input wire load, sel, clock);  

  modport reg_M     (input wire load, sel, clock);
 
  modport reg_X     (input wire load, sel, clock);
 
  modport reg_Y     (input wire load, sel, clock);

  modport reg_XY    (input wire load, sel, clock);

  modport reg_J1    (input wire load, sel, clock);

  modport reg_J2    (input wire load, sel, clock);

  modport reg_J     (input wire load, sel, clock);

  modport reg_INST  (input wire load, sel, clock);

  modport reg_PC    (input wire load, sel, clock);

  modport reg_INC   (input wire load, sel, clock);

endinterface
