`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:46 03/06/2023 
// Design Name: 
// Module Name:    clock_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divider(
	input clk,
	output timer_clk,
	output display_clk
);
	
	reg temp_display = 0;
	reg temp_timer = 0;
	integer cycles = 0;
	
	
	always @ (posedge clk) begin
		cycles <= cycles + 1;
		if (cycles % 100_000 == 0) begin  // display clk of 500 hz
			temp_display <= ~temp_display;
		end
		
		if (cycles == 50_000_000) begin // increment the timer clock (1 hz clk)
			temp_timer <= ~temp_timer;
			cycles <= 0;
		end
	end
	
	assign timer_clk = temp_timer;
	assign display_clk = temp_display;
	
endmodule
