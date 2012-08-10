/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: register_unit_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 /* This is the register unit from Harry Porter's Relay Computer. This module takes in the control
  * signals produced by the sequencer unit and drives the data bus based on those signals 
  */
  
  module registerUnit(interface buses, interface control_signals, interface registers);
  
  logic[7:0] data;
  logic [15:0] address;
  
  assign buses.dataBusPins = (	control_signals.SelA |
									control_signals.SelB |
									control_signals.SelC |
									control_signals.SelD |
									control_signals.SelX |
									control_signals.SelY |
									control_signals.SelM1 |
									control_signals.SelM2	) ? data : 'z;
									
	assign buses.addressBusPins = (	control_signals.SelXY |
									contorl_signals.SelM 	) ? address : 'z;
  
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
			data = registers.Apins;
	if(control_signals.SelB)
			data = registers.Bpins;
	if(contol_signals.SelC)
			data = registers.Cpins;
	if(control_signals.SelD)
			data = registers.Dpins;
	if(control_signals.SelM1)
			data = registers.M1pins;
	if(control_signals.SelM2)
			data = registers.M2pins;
	if(control_signals.SelX)
			data = registers.Xpins;
	if(control_signals.SelY)
			data = registers.Ypins;
	if(control_signals.SelM)
			address = registers.Mpins;
	if(control_signals.SelXY)
			address = registers.XYpins;
			
  end  
  endmodule