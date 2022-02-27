SetActiveLib -vga_mk2
asim +access +r top_tb 
wave
wave -noreg CLK
wave -noreg HSYNC	 
wave -noreg VSYNC	
wave -noreg COLOR
wave -noreg /top_tb/UUT/image/curr_line
wave -noreg /top_tb/UUT/image/curr_pixel

run 800000.00 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\tutorvhdl_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_tutorvhdl 