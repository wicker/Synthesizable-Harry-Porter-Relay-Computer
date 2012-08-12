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
	if(control_signals.LdApin) 
			registers.A = buses.dataBusPins;
	if(control_signals.LdBpin)
			registers.B = buses.dataBusPins;
	if(control_signals.LdCpin)
			registers.C = buses.dataBusPins;
	if(control_signals.LdDpin)
			registers.D = buses.dataBusPins;
	if(control_signals.LdM1pin)
			registers.M1 = buses.dataBusPins;
	if(control_signals.LdM2pin)
			registers.M2 = buses.dataBusPins;
	if(control_signals.LdXpin)
			registers.X = buses.dataBusPins;
	if(control_signals.LdYpin)
			registers.Y = busses.dataBusPins;
	if(control_signals.LdXYpin)
			{registers.X, register.Y} = buses.addressBusPins;
	if(control_signals.SelApin)
			buses.dataBus = registers.Apins;
	if(control_signals.SelBpin)
			buses.dataBus = registers.Bpins;
	if(contol_signals.SelCpin)
			buses.dataBus = registers.Cpins;
	if(control_signals.SelDpin)
			buses.dataBus = registers.Dpins;
	if(control_signals.SelM1pin)
			buses.dataBus = registers.M1pins;
	if(control_signals.SelM2pin)
			buses.dataBus = registers.M2pins;
	if(control_signals.SelXpin)
			buses.dataBus = registers.Xpins;
	if(control_signals.SelYpin)
			buses.dataBus = registers.Ypins;
	if(control_signals.SelMpin)
			buses.addressBus = registers.Mpins;
	if(control_signals.SelXYpin)
			buses.addressBus = registers.XYpins;
			
  end  
  endmodule