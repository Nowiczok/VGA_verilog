/*
module that generates sync pulses and outputs pixels when apropriate 
Michal Stankiewicz, 17.02.2022
*/

module VGA_mod
	(
	input CLK,
	input CE,
	input[7:0] PIXEL,
	input RESET,
	output HSYNC,
	output VSYNC,
	output[7:0] COLOR,
	output PIXEL_EN
	);
	
	wire BLANKING_V;
	wire OVERFLOW_V;
	wire BLANKING_H;
	wire OVERFLOW_H;
	
	localparam display_h = 8;
	localparam front_porch_h = 1;
	localparam sync_pulse_h = 2;
	localparam back_porch_h = 1;
	
	localparam display_v = 8;
	localparam front_porch_v = 1;
	localparam sync_pulse_v = 2;
	localparam back_porch_v = 1;
	
	assign COLOR = (BLANKING_V == 0 && BLANKING_H == 0) ? PIXEL : 0;	
	assign PIXEL_EN = !(BLANKING_V == 1 || BLANKING_H == 1);
	
	sync_generator #(.display(display_h), .front_porch(front_porch_h), .sync_pulse(sync_pulse_h), .back_porch(back_porch_h)) 
	HSYNC_GEN(.CLK(CLK), .CE(CE), .RESET(RESET), .SIG(HSYNC), .BLANKING(BLANKING_H), .OVERFLOW(OVERFLOW_H));
	
	sync_generator #(.display(display_v), .front_porch(front_porch_v), .sync_pulse(sync_pulse_v), .back_porch(back_porch_v)) 
	VSYNC_GEN(.CLK(CLK), .CE(OVERFLOW_H), .RESET(RESET), .SIG(VSYNC), .BLANKING(BLANKING_V), .OVERFLOW(OVERFLOW_V));
	
endmodule