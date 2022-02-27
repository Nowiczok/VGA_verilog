//-----------------------------------------------------------------------------
//
// Title       : No Title
// Design      : VGA_mk2
// Author      : Michal
// Company     : AGH
//
//-----------------------------------------------------------------------------
//
// File        : C:\My_Designs\VGA_mk2\VGA_mk2\compile\Top.v
// Generated   : Fri Feb 18 12:24:56 2022
// From        : C:\My_Designs\VGA_mk2\VGA_mk2\src\Top.bde
// By          : Bde2Verilog ver. 2.01
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`ifdef _VCP
`else
`define library(a,b)
`endif


// ---------- Design Unit Header ---------- //
`timescale 1ps / 1ps

module Top ;

// ----------------- Constants ------------ //
parameter DANGLING_INPUT_CONSTANT = 1'bZ;

// ---- Declaration for Dangling inputs ----//
wire Dangling_Input_Signal = DANGLING_INPUT_CONSTANT;

// -------- Component instantiations -------//

image_storage U1
(
	.CLK(Dangling_Input_Signal),
	.CE(Dangling_Input_Signal),
	.RESET(Dangling_Input_Signal),
	.COLOR()
);



endmodule 
