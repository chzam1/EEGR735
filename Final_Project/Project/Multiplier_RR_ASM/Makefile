rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/Multiplier_RR_ASM.vvp test/tb_Multiplier_RR_ASM.v src/Multiplier_RR_ASM.v
	vvp bin/Multiplier_RR_ASM.vvp
	gtkwave tb_Multiplier_RR_ASM.vcd

synth:
	yosys -p "read_verilog src/Multiplier_RR_ASM.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top Multiplier_RR_ASM; write_verilog bin/first_level_synthesize_Multiplier_RR_ASM.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean Multiplier_RR_ASM; write_verilog bin/second_level_synthesize_Multiplier_RR_ASM.v; opt_clean Multiplier_RR_ASM; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
