/*
testbench for top unit
*/	  

`timescale 1ns/1ps

module top_tb;

reg CLK;
wire HSYNC;
wire VSYNC;
wire[7:0] COLOR;
	
top UUT(.CLK(CLK), .HSYNC(HSYNC), .VSYNC(VSYNC), .COLOR(COLOR));

initial CLK = 1;

always #41.666 CLK = ~CLK;
	
endmodule
