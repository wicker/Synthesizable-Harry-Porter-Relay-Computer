/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: register_unit_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 /* This is the register unit from Harry Porter's Relay Computer. This module takes in the control
  * signals produced by the sequencer unit and drives the data bus based on those signals 
  */
  
  module registerUnit(interface buses, interface control_signals, interface registers);
  	
 logic [7:0] dataBus;
 logic [15:0] addressBus;
	
	assign buses.dataBusPins = (control_signals.SelApin === 1 || control_signals.SelBpin === 1 || 
	                           control_signals.SelCpin === 1 || control_signals.SelDpin === 1 ||
	                           control_signals.SelM1pin === 1 || control_signals.SelM2pin === 1
				    || control_signals.SelXpin === 1 || control_signals.SelYpin === 1) ? dataBus : 'z;
	assign buses.addressBusPins = (control_signals.SelMpin === 1 || control_signals.SelXYpin === 1) ? addressBus : 'z;
	
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
			registers.Y = buses.dataBusPins;
	if(control_signals.LdXYpin)
			{registers.X, registers.Y} = buses.addressBusPins;
	if(control_signals.SelApin)
			dataBus = registers.Apins;
	if(control_signals.SelBpin)
			dataBus = registers.Bpins;
	if(control_signals.SelCpin)
			dataBus = registers.Cpins;
	if(control_signals.SelDpin)
			dataBus = registers.Dpins;
	if(control_signals.SelM1pin)
			dataBus = registers.M1pins;
	if(control_signals.SelM2pin)
			dataBus = registers.M2pins;
	if(control_signals.SelXpin)
			dataBus = registers.Xpins;
	if(control_signals.SelYpin)
			dataBus = registers.Ypins;
	if(control_signals.SelMpin)
			addressBus = registers.Mpins;
	if(control_signals.SelXYpin)
			addressBus = registers.XYpins;
			
  end  
  endmodule
