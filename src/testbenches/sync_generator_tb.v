/*
testbench for sync_generator.v
Michal Stankiewicz, 17.02.2022
*/

`timescale 1ns/1ps

module sync_generator_tb;
	reg CLK;
	reg CE;
	reg RESET;
	wire SIG;
	wire BLANKING;
	wire OVERFLOW;
	
	sync_generator #(.display(266), .front_porch(8), .sync_pulse(24), .back_porch(43)) 
	UUT(.CLK(CLK), .CE(CE), .RESET(RESET), .SIG(SIG), .BLANKING(BLANKING), .OVERFLOW(OVERFLOW));
	
	assign CE = 1;
	assign RESET = 0;
	
	initial CLK = 1;
	always #41.66 CLK = ~CLK;
		
	
endmodule
