# To reset the earlier designs
reset_design

# For removing the all the design
remove_design -designs

# To check whether the previous design is removed
current_design

lappend search_path "/u/thermant/ECE_4_581_WINTER_2018/ECE_4_581_WINTER_2018/Final_Project/S_RTL_3/models"

set target_library "saed32rvt_ff1p16v125c.db"
set link_library   "saed32rvt_ff1p16v125c.db"


# Analyzing the current design
analyze -format sverilog /u/thermant/ECE_4_581_WINTER_2018/ECE_4_581_WINTER_2018/Final_Project/S_RTL_3/rtl/S_RTL_3.sv

# Current design after anlayzing
current_design

# Elaborate the design
elaborate sync_counter

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

report_qor

report_qor > ../scripts/QOR_Report_File

write_file -format verilog  -output  S_RTL_3_netlist.v

report_area

# report_timing

report_power

# report_hierarchy

# report_compile_options

# write -format ddc -hierarchy -output FIFO.ddc
