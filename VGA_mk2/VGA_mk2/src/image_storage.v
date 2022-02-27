/*
module to store image 
Michal Stankiewicz, 17.02.2022
*/ 

module image_storage
	#(
	parameter real_pixels,
	parameter real_lines,
	parameter reduced_pixels,
	parameter reduced_lines,
	parameter pixel_rep,
	parameter line_rep  // parameters that desctibe how many times pixels and lines are repeated, determines actual resolution
	)
	(
	input CLK,
	input CE,
	input RESET,
	output reg[7:0] COLOR,
	);
	
	integer line_rep_count = 0;
	integer pixel_rep_count = 0;
	integer curr_line = 0;
	integer curr_pixel = 0;
	
	reg[18:0] image_mem[0:9];
	initial $readmemh("image.txt", image_mem);
	
	always @ (posedge CLK) 
	begin
		if(RESET == 1)
		begin
			line_rep_count <= 0;
			pixel_rep_count <= 0;
			curr_line <= 0;
			curr_pixel <= 0;
		end else
		begin
			if(CE == 1)
			begin
				if(line_rep_count < line_rep * real_pixels - 1)
				begin
					line_rep_count <= line_rep_count + 1;	
				end else
				begin
					line_rep_count <= 0;
					curr_line = curr_line + 1;
					if(curr_line == reduced_lines)
					begin
						curr_line = 0;	
					end
				end
				
				if(pixel_rep_count < (pixel_rep - 1))
				begin
					pixel_rep_count <= pixel_rep_count + 1;
				end	else
				begin
					pixel_rep_count <= 0;
					curr_pixel = curr_pixel + 1;
					if(curr_pixel == reduced_pixels)
					begin
						curr_pixel = 0;
					end
				end
				
				if(image_mem[curr_line][curr_pixel] == 1)
				begin
					COLOR <= 8'b11100000;	
				end	else
				begin
					COLOR <= 8'b00000111;
				end
			end
		end	
	end
		
	
endmodule
