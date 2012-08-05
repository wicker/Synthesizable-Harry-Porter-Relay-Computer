

relay: logs/relay
register: logs/register
eight_bit_register: logs/eight_bit_register

logs/relay: relay.sv relay_testbench.sv
	vlog relay.sv relay_testbench.sv
	echo "run -all" | vsim -c RelayTestBench > logs/relay

logs/register: relay register.sv register_testbench.sv
	vlog register.sv register_testbench.sv
	echo "run -all" | vsim -c RegisterTestBench > logs/register

logs/eight_bit_register: register eight_bit_register.sv eight_bit_register_testbench.sv
	vlog eight_bit_register.sv eight_bit_register_testbench.sv
	echo "run -all" | vsim -c EightBitRegisterTestBench > logs/eight_bit_register

