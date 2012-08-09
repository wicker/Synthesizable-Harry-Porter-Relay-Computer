/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: program_control_unit_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 module programControlUnit(Interface buses, Interface control_signals, Interface PCsigs);
	
	always_comb
	begin
		if(control_signals.LdJ1)
				PCsigs.J1 = buses.dataBusPins;
		if(control_signals.LdJ2)
				PCsigs.J2 = buses.dataBusPins;
		if(control_signals.LdInst)
				PCsigs.Inst = buses.dataBusPins;
		if(control_signals.LdINC)
				PCsigs.Inc = buses.addressBusPins;
		if(control_signals.LdPC)
				PCsigs.PC = buses.addressBusPins;
		if(control_signals.SelPC)
				buses.addressBus = PCsigs.PCpins;
		if(control_signals.SelInc)
				buses.addressBus = PCsigs.SelInc;
				
	end
 
 endmodule