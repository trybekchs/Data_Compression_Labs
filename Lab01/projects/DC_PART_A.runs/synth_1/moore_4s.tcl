# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/netolo/DC/P01/PARTA/projects/DC_PART_A.cache/wt [current_project]
set_property parent.project_path /home/netolo/DC/P01/PARTA/projects/DC_PART_A.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /home/netolo/DC/P01/PARTA/projects/DC_PART_A.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib /home/netolo/DC/P01/PARTA/vhdl_files/moore_4s.vhd
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top moore_4s -part xc7z010clg400-1


write_checkpoint -force -noxdef moore_4s.dcp

catch { report_utilization -file moore_4s_utilization_synth.rpt -pb moore_4s_utilization_synth.pb }
