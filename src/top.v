/*
Top module, highest in hierarchy
Michal Stankiewicz, 18.02.2022
*/

module top
	(
	input CLK,
	output HSYNC,
	output VSYNC,
	output [7:0] COLOR
	);
	
	wire[7:0] PIXEL;
	wire PIXEL_EN;
	
	/*reg [15:0] rst_pipe = 16'hFFFF;
	reg RESET = 1'b1;

	always @ (posedge CLK) {RESET,rst_pipe} <= {rst_pipe,1'b0};*/
	
	VGA_mod vga(.CLK(CLK), .CE(1), .PIXEL(PIXEL), .RESET(0), .HSYNC(HSYNC), .VSYNC(VSYNC), .COLOR(COLOR), .PIXEL_EN(PIXEL_EN));
	
	image_storage_mk2 #(.real_pixels(266), .real_lines(600), .reduced_pixels(19), .reduced_lines(10), .pixel_rep(14), .line_rep(60)) 
	image(.CLK(CLK), .CE(PIXEL_EN), .RESET(0), .COLOR(PIXEL));
	
endmodule