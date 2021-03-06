#=========================================================================
# read-design.tcl
#=========================================================================
# Author : Christopher Torng
# Date   : May 14, 2018
#

# Check libraries

check_library > $dc_reports_dir/${dc_design_name}.check_library.rpt

# The first "WORK" is a reserved word for Design Compiler. The value for
# the -path option is customizable.

define_design_lib WORK -path ${dc_results_dir}/WORK

# Analyze the RTL source file

if { ![analyze -format sverilog {"inputs/design2.sv" "inputs/design.v"}] } { exit 1 }
#if { ![analyze -format sverilog $dc_rtl_handoff] } { exit 1 }

# Elaborate the design with design parameters from a file, or else just
# elaborate normally

if {[file exists [which setup-design-params.txt]]} {
  elaborate $dc_design_name -file_parameters setup-design-params.txt
  rename_design $dc_design_name* $dc_design_name
} else {
  elaborate $dc_design_name
}

current_design WrappedPE_wrapped
compile_ultra
current_design $dc_design_name
set_dont_touch WrappedPE_wrapped
link

#-------------------------------------------------------------------------
# Write out useful files
#-------------------------------------------------------------------------

# This ddc can be used as a checkpoint to load up to the current state

write -hierarchy -format ddc \
      -output ${dc_results_dir}/${dc_design_name}.elab.ddc

# This Verilog is useful to double-check the netlist that dc will use for
# mapping

write -hierarchy -format verilog \
      -output ${dc_results_dir}/${dc_design_name}.elab.v


