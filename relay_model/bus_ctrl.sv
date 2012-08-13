/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Control bus - this stands in for load and select switches
 * License: MIT http://opensource.org/licenses/MIT
*/

interface Ctrl_Bus();

  wire  ldA, ldB, ldC, ldD, ldINST, ldM1, ldM2, ldM, 
        ldX, ldY, ldXY, ldJ1, ldJ2, ldPC, ldINC, ldCCR,
        mem_write;

  wire  selA, selB, selC, selD, selM1, selM2, selM, 
        selX, selY, selXY, selJ, selPC, selINC, mem_read;

  wire  bus_to_mem;

  modport reg_A (input ldA, selA);

  modport reg_B (input ldB, selB);

  modport reg_C (input ldC, selC);

  modport reg_D (input ldD, selD);

  modport reg_INST (input ldINST, selINST);

  modport reg_M1 (input ldM1, selM1);

  modport reg_M2 (input ldM2, selM2);

  modport reg_M (input ldM, selM);

  modport reg_X (input ldX, selX);

  modport reg_Y (input ldY, selY);

  modport reg_XY (input ldXY, selXY);

  modport reg_J1 (input ldJ1);

  modport reg_J2 (input ldJ2);

  modport reg_J (input selJ);

  modport reg_PC (input ldPC, selPC);

  modport reg_INC (input ldINC, selINC);

  modport reg_CCR (input ldCCR);

endinterface
