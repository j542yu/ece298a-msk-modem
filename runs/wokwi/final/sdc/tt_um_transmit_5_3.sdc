###############################################################################
# Created by write_sdc
###############################################################################
current_design tt_um_transmit_5_3
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 20.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {enable}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {in}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst_n}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[0]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[1]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[2]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[3]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[4]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {T[0]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {T[1]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {T[2]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {T[3]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {T[4]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {T[5]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {T[6]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {B[4]}]
set_load -pin_load 0.0729 [get_ports {B[3]}]
set_load -pin_load 0.0729 [get_ports {B[2]}]
set_load -pin_load 0.0729 [get_ports {B[1]}]
set_load -pin_load 0.0729 [get_ports {B[0]}]
set_load -pin_load 0.0729 [get_ports {T[6]}]
set_load -pin_load 0.0729 [get_ports {T[5]}]
set_load -pin_load 0.0729 [get_ports {T[4]}]
set_load -pin_load 0.0729 [get_ports {T[3]}]
set_load -pin_load 0.0729 [get_ports {T[2]}]
set_load -pin_load 0.0729 [get_ports {T[1]}]
set_load -pin_load 0.0729 [get_ports {T[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {enable}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {in}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst_n}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 3.0000 [current_design]
set_max_capacitance 0.2000 [current_design]
set_max_fanout 10.0000 [current_design]
