/*
testbench for VGA_mod.v
Michal Stankiewicz, 17.02.2022
*/

`timescale 1ns/1ps

module VGA_mod_tb;
	reg CLK;
	reg CE = 1;
	reg[7:0] PIXEL = 8'b11100000;
	reg RESET = 0;
	wire HSYNC;
	wire VSYNC;
	wire[7:0] COLOR;
	wire PIXEL_EN;
	
	VGA_mod UUT(.CLK(CLK), .CE(CE), .PIXEL(PIXEL), .RESET(RESET), .HSYNC(HSYNC), .VSYNC(VSYNC), .COLOR(COLOR), .PIXEL_EN(PIXEL_EN));
	
	initial CLK = 1;
	always #41.66 CLK = ~CLK;
	
endmodule
