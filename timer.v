`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:55 03/09/2023 
// Design Name: 
// Module Name:    timer 
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
module timer(
	clk,
	timer_clk,
	rst,
	time_remaining,
	game_end
);
	input clk;
	input timer_clk;
	input rst;
	output reg [5:0] time_remaining;
	output reg game_end;
	
	initial begin
		time_remaining = 20;
		game_end = 0;
	end
	
	always @ (posedge timer_clk) begin
		if (rst)
			time_remaining = 20;
		else if (time_remaining > 0)
			time_remaining = time_remaining - 1;

		game_end = (time_remaining == 0);
	end


endmodule
