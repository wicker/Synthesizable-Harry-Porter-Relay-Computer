/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: Interface_and_PCU_testbench.sv
 * License: MIT http://opensource.org/licenses/MIT
 */

// module to test connections between interface and program_control_unit
// to make sure the PCU is high z'ing the bus when it is supposed to

module Interface_PCU_test;
  
  // instantiate interfaces and PCU
  controlSignals control_signals();
  programControlInterface PCsigs();
  registerInterface registers();
  buses buses();
  programControlUnit PCU(.*);
  registerUnit regUnit(.*);  
    
  initial 
  begin 
  #5 PCsigs.PC = '1;
  #5 control_signals.SelPC = 1;
  #5 $display("addressBusPins = %h",buses.addressBusPins);
  #5 control_signals.SelPC = 0;
  //#5 force control_signals.SelINC = 0;
  #5 control_signals.LdJ1 = 1;
  #5 $display("addressBusPins = %h",buses.addressBusPins);
  #5 control_signals.LdJ1 = 0;
  #5 registers.M1 = '0;
  #5 registers.M2 = '1;
  #5 control_signals.SelM = 1;
  #5 $display("addressBusPins = %h",buses.addressBusPins);
  #5 $stop;
end
  
endmodule

