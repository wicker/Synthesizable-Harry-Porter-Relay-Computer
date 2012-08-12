/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: program_control_unit_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 module programControlUnit(Interface buses, Interface control_signals, Interface PCsigs);
	
	always_comb
	begin
		if(control_signals.LdJ1pin)
				PCsigs.J1 = buses.dataBusPins;
		if(control_signals.LdJ2pin)
				PCsigs.J2 = buses.dataBusPins;
		if(control_signals.LdInstpin)
				PCsigs.Inst = buses.dataBusPins;
		if(control_signals.LdINCpin)
				PCsigs.Inc = buses.addressBusPins;
		if(control_signals.LdPCpin)
				PCsigs.PC = buses.addressBusPins;
		if(control_signals.SelPCpin)
				buses.addressBus = PCsigs.PCpins;
		if(control_signals.SelINCpin)
				buses.addressBus = PCsigs.SelInc;
				
	end
 
 endmodule