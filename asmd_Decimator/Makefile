rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/asmd_Decimator.vvp test/tb_asmd_Decimator.v src/asmd_Decimator.v
	vvp bin/asmd_Decimator.vvp
	gtkwave tb_asmd_Decimator.vcd

synth:
	yosys -p "read_verilog src/asmd_Decimator.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top asmd_Decimator; write_verilog bin/first_level_synthesize_asmd_Decimator.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean asmd_Decimator; write_verilog bin/second_level_synthesize_asmd_Decimator.v; opt_clean asmd_Decimator; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
