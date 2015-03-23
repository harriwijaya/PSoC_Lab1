open_project poly_proj

add_files -tb tb.c
add_files lab1.c

set_top poly

open_solution -reset solution_poly
set_part virtex7
create_clock -period 10
csynth_design

cosim_design -rtl verilog -tool modelsim -trace_level all

exit
