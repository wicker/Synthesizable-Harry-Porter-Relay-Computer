/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Control bus - this stands in for load and select switches
 * License: MIT http://opensource.org/licenses/MIT
*/

interface Ctrl_Bus();

  parameter CTRL_BUS_WIDTH = 34;

  wire  ldA, ldB, ldC, ldD, ldINST, ldM1, ldM2, ldM, 
        ldX, ldY, ldXY, ldJ1, ldJ2, ldPC, ldINC, ldCCR;

  wire  selA, selB, selC, selD, selM1, selM2, selM, 
        selX, selY, selXY, selJ, selPC, selINC;

  modport decoder   (output ldA, selA);

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
