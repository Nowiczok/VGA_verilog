/*
module to store image 
Michal Stankiewicz, 17.02.2022
*/ 

module image_storage_mk2
	#(
	parameter real_pixels = 0,
	parameter real_lines = 0,
	parameter reduced_pixels = 0,
	parameter reduced_lines = 0,
	parameter pixel_rep = 0,
	parameter line_rep = 0  // parameters that desctibe how many times pixels and lines are repeated, determines actual resolution
	)
	(
	input CLK,
	input CE,
	input RESET,
	output[7:0] COLOR
	);
	
	integer line_rep_count = 0;
	integer pixel_rep_count = 0;
	integer curr_line = 0;
	integer curr_pixel = 0;
	
	wire[18:0] image_mem[0:9];
	/*initial 
	begin
		$readmemb("image.txt", image_mem);
	end*/
	
	assign image_mem[0] = 19'b1111000001000000000;
	assign image_mem[1] = 19'b1111000001000000000;
	assign image_mem[2] = 19'b1111000001000000000;
	assign image_mem[3] = 19'b1111000001000000000;
	assign image_mem[4] = 19'b1111000001000000000;
	assign image_mem[5] = 19'b0000000000000001111;
	assign image_mem[6] = 19'b0000000000000001111;
	assign image_mem[7] = 19'b1111111111111111010;
	assign image_mem[8] = 19'b0000000000000001111;
	assign image_mem[9] = 19'b0000000000000001111;
	
	
	always @ (posedge CLK) 
	begin
		if(RESET == 1)
		begin
			line_rep_count <= 0;
			curr_line <= 0;
		end else
		begin
			if(CE == 1)
			begin
				if(line_rep_count < (line_rep * real_pixels - 1))
				begin
					line_rep_count <= line_rep_count + 1;	
				end else
				begin
					line_rep_count <= 0;
					curr_line <= curr_line + 1;
					if(curr_line == (reduced_lines - 1))
					begin
						curr_line <= 0;	
					end
				end
			end
		end	
	end
		
	always @ (posedge CLK)
	begin
		if(RESET == 1)
		begin
			pixel_rep_count <= 0;
			curr_pixel <= 0;
		end else
		begin
			if(CE == 1)
			begin
				if(pixel_rep_count < (pixel_rep - 1))
				begin
					pixel_rep_count <= pixel_rep_count + 1;
				end	else
				begin
					pixel_rep_count <= 0;
					curr_pixel <= curr_pixel + 1;
					if(curr_pixel == (reduced_pixels - 1))
					begin
						curr_pixel <= 0;
					end
				end
			end
		end
	end 
	
	assign COLOR = (image_mem[curr_line][curr_pixel]) ? 8'b11100000	: 8'b00011001;
	
	
endmodule
