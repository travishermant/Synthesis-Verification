# To reset the earlier designs
reset_design

# For removing the all the design
remove_design -designs

# To check whether the previous design is removed
current_design

lappend search_path "/u/thermant/ECE_4_581_WINTER_2018/ECE_4_581_WINTER_2018/Final_Project/S_RTL_1/models"

set search_path ""
lappend search_path "/pkgs/synopsys/2016/libs/SAED32_EDK/lib/stdcell_hvt/db_nldm"
lappend search_path "/pkgs/synopsys/2016/libs/SAED32_EDK/lib/stdcell_rvt/db_nldm"
lappend search_path "/pkgs/synopsys/2016/libs/SAED32_EDK/lib/stdcell_lvt/db_nldm"
lappend search_path "/pkgs/synopsys/2016/libs/SAED32_EDK/lib/io_std/db_nldm"
lappend search_path "/pkgs/synopsys/2016/libs/SAED32_EDK/lib/sram/db_nldm"

set synthetic_library dw_foundation.sldb
set target_library "saed32lvt_ss0p75v125c.db saed32rvt_ss0p75v125c.db"
set link_library "* saed32hvt_ss0p75v125c.db saed32lvt_ss0p75v125c.db saed32rvt_ss0p75v125c.db saed32io_wb_ss0p95v125c_2p25v.db \
 saed32sram_ss0p95v125c.db dw_foundation.sldb"

set target_library "saed32rvt_ff1p16v125c.db"
set link_library   "saed32rvt_ff1p16v125c.db dw_foundation.sldb"


# Analyzing the current design
analyze -format sverilog /u/thermant/ECE_4_581_WINTER_2018/ECE_4_581_WINTER_2018/Final_Project/S_RTL_1/rtl/S_RTL_1.sv


# Current design after anlayzing
current_design

# Elaborate the design
elaborate sync_counter



create_clock fast_clk -period 1.0
# -waveform {0.0 0.5} fast_clk
#create_clock -name "slow_clk"

set_clock_latency 0.1 fast_clk
create_generated_clock slow_clk -source fast_clk -divide_by 4 [get_pins div_cnt]
set_clock_latency 0.4 slow_clk
set_multicycle -from fast_clk -to slow_clk -setup 2
set_multicycle -from fast_clk -to slow_clk -hold 1

#set_false_path -from fast_clk -to slow_clk
#set_false_path -from slow_clk -to fast_clk

set_max_area 9000

#set_input_delay 0.1 data[3] -clock fast_clk
#set_input_delay 0.1 data[2] -clock fast_clk
#set_input_delay 0.1 data[1] -clock fast_clk
#set_input_delay 0.1 data[0] -clock fast_clk

group_path -name INPUTS -from [ get_ports -filter "direction==in&&full_name!~*clk*" ]
group_path -name OUTPUTS -to [ get_ports -filter "direction==out" ]
group_path -name FEEDTHROUGH -from [all_inputs ] -to [all_outputs] 


# compile map the sequential cell exactly as in the rtl
# compile -exact_map -ungroup_all
compile 

# Number of inputs
all_inputs 
set number_of_inputs [sizeof_collection [all_inputs]]
puts "Number_of_inputs $number_of_inputs"

# Number of outputs
all_outputs
set number_of_outputs [sizeof_collection [all_outputs ]]
puts "Number_of_outputs $number_of_outputs"

# Number of sequentials:
all_registers
set number_of_sequentials [sizeof_collection [all_registers]]
puts "Number_of_sequentials $number_of_sequentials"

report_cell

report_qor -sig 3 > ../reports/qor.rpt

report_qor > ../scripts/QOR_Report_File

write_file -format verilog  -output  S_RTL_1_netlist.v

report_area

check_timing -include {no_driving_cell no_input_delay partial_input_delay unconstrained_endpoints } > ../reports/check_timing.rpt

report_power > ../reports/power.rpt

report_constraint -all_violators -verbose -sig 3 > ../reports/constraints.rpt
# report_hierarchy

# report_compile_options

# write -format ddc -hierarchy -output FIFO.ddc
