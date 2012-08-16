Synthesizable Harry Porter Relay Computer
===================

Group project by Maisee Brown, Brian Ledger, and Jenner Hanni for Professor Mark Faust's ECE510 System Verilog class at Portland State University in Summer 2012.

The goal is to build and thoroughly verify a synthesizable model of Dr. Harry Porter's relay computer. 

### Build Instructions

Behavioral and Relay Models need to be run separately. The behavioral model compiles, runs, and displays valid output for a test program that includes the current state of buses, registers, and control signals. The relay model compiles but does not run correctly. 

To run the behavioral model:

<code>cd behave\_model
vlog -sv -source testbench\_behave.sv
vsim -s testbench\_behave</code>

To run the relay model, 

<code>cd relay\_model
vlog -sv -source \_relay\_computer.sv
vsim -c RelayComputer</code>

