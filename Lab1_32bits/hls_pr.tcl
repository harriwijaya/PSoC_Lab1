set outputDir ./pr
file mkdir $outputDir

read_verilog [glob poly_proj/solution_poly/syn/verilog/*.v]
#read_xdc ./clk.xdc


synth_design -top poly  -part xc7v585tffg1157-3

opt_design
place_design
route_design

report_route_status -file $outputDir/post_route_status.rpt
report_timing_summary -file $outputDir/post_route_timing_summary.rpt

exit
