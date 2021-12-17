# User config
set ::env(DESIGN_NAME) Multiplier_RR

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

# Fill this
set ::env(CLOCK_PERIOD) "100.0"
set ::env(CLOCK_PORT) "clock"
set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0 0 200 200"
set ::env(PL_TARGET_DENSITY) "0.57"

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

