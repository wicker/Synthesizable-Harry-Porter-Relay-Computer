all: compile build sim check clean


MODE ?= puresim
#MODE ?= veloce

VLOG = \
	   hdl/interfaces_behave.sv \
	   hdl/state_definitions_behave.sv \
	   hdl/sequencer_behave.sv \
	   hdl/output_struct_package.sv \
	   hdl/fsm_behave.sv \
	   hdl/memory_behave.sv \
	   hdl/register_unit_behave.sv \
	   hdl/alu_behave.sv \
	   hdl/program_control_unit_behave.sv \
	   hdl/decode_logic_behave.sv \
	   hdl/top.sv \
       hdl/Harry_Porters_relay_comp_behave.sv 
       
SVLOG = \
        hvl/testbench.sv

compile:
	\rm -rf $(MODE)work dpiheader.h
	
	vlib $(MODE)work
	vmap work $(MODE)work
	vlog -f $(TBX_HOME)/questa/hdl/xtlm_files.f
	vlog $(SVLOG)
ifeq ($(MODE),puresim)
	vlog $(VLOG)
else
	tbxcomp -top top $(VLOG) -$(MODE)
endif


build:
	tbxsvlink -$(MODE)

sim:
	echo "run -all; quit" > run.do
	vsim -c top tbTop TbxSvManager -do run.do -l ctran.log -novopt

check:
	grep HVL: ctran.log > $(MODE).log
	cmp $(MODE).log $(MODE).log.gold

clean:
	rm -rf *work *.log tbx.dir ctran.log  tbxsim.v tbx.map tbxbindings.h* debussy.cfg dpibindings.h transcript.tbx *.log Recompiled.list tree.out vsim.wlf transcript TRACE.txt dmslogdir tbxsvlink.log modelsim.ini run.do dgs.dbg wlf*
