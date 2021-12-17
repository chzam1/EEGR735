rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/Multiplier_STG_0.vvp test/tb_Multiplier_STG_0.v src/Multiplier_STG_0.v
	vvp bin/Multiplier_STG_0.vvp
	gtkwave tb_Multiplier_STG_0.vcd

synth:
	yosys -p "read_verilog src/Multiplier_STG_0.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top Multiplier_STG_0; write_verilog bin/first_level_synthesize_Multiplier_STG_0.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean Multiplier_STG_0; write_verilog bin/second_level_synthesize_Multiplier_STG_0.v; opt_clean Multiplier_STG_0; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
