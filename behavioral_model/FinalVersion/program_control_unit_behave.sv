/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: program_control_unit_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 module programControlUnit(buses buses, controlSignals control_signals, programControlInterface PCsigs);
	wire [15:0] address;
 	logic [15:0] addressBus; 
 	logic [15:0] high_impedence = 'z;
	wire trigger;
	assign trigger = (control_signals.SelPCpin === 1 || control_signals.SelINCpin === 1);
	assign buses.addressBusPins = trigger ? addressBus : 'z;

	always_comb
	begin
	  if(control_signals.SelPCpin === 1)
		begin
				addressBus = PCsigs.PCpins;
	  end
		else if(control_signals.SelINCpin === 1)
		  begin
				addressBus = PCsigs.Incpins;
			end
		if(control_signals.LdJ1pin === 1)
				PCsigs.J1 = buses.dataBusPins;
		if(control_signals.LdJ2pin === 1)
				PCsigs.J2 = buses.dataBusPins;
		if(control_signals.LdInstpin === 1)
		  begin
				PCsigs.Inst = buses.dataBusPins;
			end
		if(control_signals.LdINCpin === 1)
				PCsigs.Inc = buses.addressBusPins + 1;
		else if(control_signals.LdPCpin === 1)
		  begin
		    PCsigs.PC <= buses.addressBusPins;
			end

	end
 
 endmodule
