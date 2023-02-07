tclmode

# Generated by Genus(TM) Synthesis Solution 19.12-s121_1, revision 1.385c
# Generated on: Thu Feb 02 20:15:44 PST 2023 (Fri Feb 03 04:15:44 GMT 2023)

set_screen_display -noprogress
set_dofile_abort exit

set lec_version [regsub {(-)[A-Za-z]} $env(LEC_VERSION) ""]

tcl_set_command_name_echo on

set_log_file fv/adder_1d/rtl_to_fv_map.log -replace

usage -auto -elapse

set_verification_information rtl_fv_map_db

read_implementation_information fv/adder_1d -revised fv_map

# Root attribute 'wlec_multithread_license_list' can be used to specify a license list
# for multithreaded processing. The default list is used otherwise.
set_parallel_option -threads 1,4 -norelease_license
set_compare_options -threads 1,4

set env(RC_VERSION)     "19.12-s121_1"
set env(CDN_SYNTH_ROOT) "/pkgs/cadence/2020-11/GENUS191/tools.lnx86"
set CDN_SYNTH_ROOT      "/pkgs/cadence/2020-11/GENUS191/tools.lnx86"
set env(CW_DIR) "/pkgs/cadence/2020-11/GENUS191/tools.lnx86/lib/chipware"
set CW_DIR      "/pkgs/cadence/2020-11/GENUS191/tools.lnx86/lib/chipware"

# default is to error out when module definitions are missing
set_undefined_cell black_box -noascend -both

add_search_path /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm . -library -both
read_library -liberty -both /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95v125c.lib

set_undriven_signal 0 -golden
set_naming_style rc -golden
set_naming_rule "%s\[%d\]" -instance_array -golden
set_naming_rule "%s_reg" -register -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -instance -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -variable -golden

# Align LEC's treatment of mismatched port widths with constant
# connections with Genus's. Genus message CDFG-467 and LEC message
# HRC3.6 may indicate the presence of this issue. This option is
# only available with LEC 17.20-d301 or later.
set lec_version_required "17.20301"
if {$lec_version >= $lec_version_required} {
    set_hdl_options -const_port_extend
}
set_hdl_options -VERILOG_INCLUDE_DIR "incdir:sep:src:cwd"

add_search_path . -design -golden
read_design -enumconstraint -define SYNTHESIS  -merge bbox -golden -lastmod -noelab -sv09  ../rtl/adder_1d.sv
elaborate_design -golden -root {adder_1d} -rootonly 

read_design -verilog95   -revised -lastmod -noelab fv/adder_1d/fv_map.v.gz
elaborate_design -revised -root {adder_1d}

uniquify -all -nolib -golden

report_design_data
report_black_box

set_flatten_model -seq_constant
set_flatten_model -seq_constant_x_to 0
set_flatten_model -nodff_to_dlat_zero
set_flatten_model -nodff_to_dlat_feedback
set_flatten_model -hier_seq_merge

set_flatten_model -balanced_modeling

set_analyze_option -auto -report_map

write_hier_compare_dofile hier_tmp1.lec.do -noexact_pin_match -constraint -usage \
-replace -balanced_extraction -input_output_pin_equivalence \
-prepend_string "report_design_data; report_unmapped_points -summary; report_unmapped_points -notmapped; analyze_datapath -module -verbose ; analyze_datapath  -verbose"
run_hier_compare hier_tmp1.lec.do -dynamic_hierarchy

report_hier_compare_result -dynamicflattened

report_verification -hier -verbose

write_verification_information
report_verification_information

# Reports how effective the implementation information was.
# This command is only available with LEC 18.20-d330 or later.
set lec_version_required "18.20330"
if {$lec_version >= $lec_version_required} {
    report_implementation_information
}

set_system_mode lec

puts "No of compare points = [get_compare_points -count]"
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
puts "No of abort points   = [get_compare_points -abort -count]"
puts "No of unknown points = [get_compare_points -unknown -count]"
if {[get_compare_points -count] == 0} {
    puts "---------------------------------"
    puts "ERROR: No compare points detected"
    puts "---------------------------------"
}
if {[get_compare_points -NONequivalent -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
}
if {[get_compare_points -abort -count] > 0} {
    puts "-----------------------------"
    puts "ERROR: Abort Points detected "
    puts "-----------------------------"
}
if {[get_compare_points -unknown -count] > 0} {
    puts "----------------------------------"
    puts "ERROR: Unknown Key Points detected"
    puts "----------------------------------"
}

# Generate a detailed summary of the run.
# This command is available with LEC 19.10-p100 or later.
set lec_version_required "19.10100"
if {$lec_version >= $lec_version_required} {
    analyze_results -logfiles fv/adder_1d/rtl_to_fv_map.log
}

vpxmode

exit -f
