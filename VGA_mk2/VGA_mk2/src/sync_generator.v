/*
universal module that generates sync pulses for VGA driver
Michal Stankiewicz, 17.02.2022
*/

module sync_generator
	#(
	parameter display,
	parameter front_porch,
	parameter sync_pulse,
	parameter back_porch
	)
	(
	input CLK, 
	input CE, 
	input RESET, 
	output SIG, 
	output BLANKING, 
	output OVERFLOW
	);
	
	integer counter = 0;
	
	assign SIG = (counter < (display + front_porch)) || (counter >= (display + front_porch + sync_pulse));
	assign BLANKING = (counter >= display);
	assign OVERFLOW = (counter == (display + front_porch + sync_pulse + back_porch));
	
	always @ (posedge CLK) 
	begin
		if(CE == 1) 
		begin
			if(RESET == 1) 
			begin
				counter <= 0;
			end else 
			begin
				if(counter < display + front_porch + sync_pulse + back_porch) 
				begin
					counter <= counter + 1;	
				end else 
				begin
					counter <= 0;
				end
			end
		end
	end
	
endmodule
