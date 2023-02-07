# Do this beforehand in order to get the licenses correct.
# export CDS_LIC_FILE=5280@license.cecs.pdx.edu
# source /pkgs/cadence/09-2015/local/bin/s_cadence.bash

# Make sure to exprt top=simple_adder
# lec -tclmode -dofile ../scripts/lec_rtl2dc.tcl

global env
read_design ../../syn/rtl/$env(TOP1).sv -SYStemverilog -Golden -sensitive -continuousassignment Bidirectional -nokeep_unreach   -nosupply -root $env(TOP1)
read_design ../../syn/rtl/$env(TOP2).sv -SYStemverilog  -revised -sensitive -continuousassignment Bidirectional -nokeep_unreach   -nosupply -root $env(TOP2)
set_system mode lec
add_compared_points -all
compare

