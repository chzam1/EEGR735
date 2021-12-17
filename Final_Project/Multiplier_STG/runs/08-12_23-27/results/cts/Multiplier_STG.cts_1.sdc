###############################################################################
# Created by write_sdc
# Wed Dec  8 23:28:59 2021
###############################################################################
current_design Multiplier_STG
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clock -period 100.0000 [get_ports {clock}]
set_propagated_clock [get_clocks {clock}]
set_input_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {Start}]
set_input_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {reset}]
set_input_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {word1[0]}]
set_input_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {word1[1]}]
set_input_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {word1[2]}]
set_input_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {word1[3]}]
set_input_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {word2[0]}]
set_input_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {word2[1]}]
set_input_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {word2[2]}]
set_input_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {word2[3]}]
set_output_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {Ready}]
set_output_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {product[0]}]
set_output_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {product[1]}]
set_output_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {product[2]}]
set_output_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {product[3]}]
set_output_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {product[4]}]
set_output_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {product[5]}]
set_output_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {product[6]}]
set_output_delay 20.0000 -clock [get_clocks {clock}] -add_delay [get_ports {product[7]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0177 [get_ports {Ready}]
set_load -pin_load 0.0177 [get_ports {product[7]}]
set_load -pin_load 0.0177 [get_ports {product[6]}]
set_load -pin_load 0.0177 [get_ports {product[5]}]
set_load -pin_load 0.0177 [get_ports {product[4]}]
set_load -pin_load 0.0177 [get_ports {product[3]}]
set_load -pin_load 0.0177 [get_ports {product[2]}]
set_load -pin_load 0.0177 [get_ports {product[1]}]
set_load -pin_load 0.0177 [get_ports {product[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {Start}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clock}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word1[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word1[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word1[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word1[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word2[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word2[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word2[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word2[0]}]
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 5.0000 [current_design]
