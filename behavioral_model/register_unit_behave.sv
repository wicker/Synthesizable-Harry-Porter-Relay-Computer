/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: register_unit_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 /* This is the register unit from Harry Porter's Relay Computer. This module takes in the control
  * signals produced by the sequencer unit and drives the data bus based on those signals 
  */
  
  module registerUnit(interface buses, interface control_signals, interface registers);
  
  always_comb
  begin
	if(control_signals.LdA) 
			registers.A = buses.dataBusPins;
	if(control_signals.LdB)
			registers.B = buses.dataBusPins;
	if(control_signals.LdC)
			registers.C = buses.dataBusPins;
	if(control_signals.LdD)
			registers.D = buses.dataBusPins;
	if(control_signals.LdM1)
			registers.M1 = buses.dataBusPins;
	if(control_signals.LdM2)
			registers.M2 = buses.dataBusPins;
	if(control_signals.LdX)
			registers.X = buses.dataBusPins;
	if(control_signals.LdY)
			registers.Y = busses.dataBusPins;
	if(control_signals.LdXY)
			{registers.X, register.Y} = buses.addressBusPins;
	if(control_signals.SelA)
			buses.dataBus = registers.Apins;
	if(control_signals.SelB)
			buses.dataBus = registers.Bpins;
	if(contol_signals.SelC)
			buses.dataBus = registers.Cpins;
	if(control_signals.SelD)
			buses.dataBus = registers.Dpins;
	if(control_signals.SelM1)
			buses.dataBus = registers.M1pins;
	if(control_signals.SelM2)
			buses.dataBus = registers.M2pins;
	if(control_signals.SelX)
			buses.dataBus = registers.Xpins;
	if(control_signals.SelY)
			buses.dataBus = registers.Ypins;
	if(control_signals.SelM)
			buses.addressBus = registers.Mpins;
	if(control_signals.SelXY)
			buses.addressBus = registers.XYpins;
			
  end  
  endmodule