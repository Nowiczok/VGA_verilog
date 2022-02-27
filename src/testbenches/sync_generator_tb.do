SetActiveLib -vga_mk2
asim +access +r sync_generator_tb 
wave
wave -noreg CLK
wave -noreg CE	 
wave -noreg RESET	
wave -noreg SIG
wave -noreg BLANKING
wave -noreg OVERFLOW

run 800000.00 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\tutorvhdl_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_tutorvhdl 