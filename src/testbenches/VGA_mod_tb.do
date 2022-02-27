SetActiveLib -vga_mk2
asim +access +r VGA_mod_tb 
wave
wave -noreg CLK
wave -noreg CE	 
wave -noreg RESET	
wave -noreg PIXEL
wave -noreg HSYNC
wave -noreg VSYNC
wave -noreg COLOR
wave -noreg PIXEL_EN
#wave -noreg /VGA_mod_tb/UUT/BLANKING_V 
#wave -noreg /VGA_mod_tb/UUT/BLANKING_H

run 800000.00 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\tutorvhdl_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_tutorvhdl 