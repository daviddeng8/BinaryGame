`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:47:24 03/09/2023 
// Design Name: 
// Module Name:    score 
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
module score_counter(
	clk,
	rst,
	is_equal,
	score
);

	input clk;
	input rst;
	input is_equal;
	output reg [3:0] score;
		
	initial begin
		score = 0;
	end
	
	always @ (posedge clk) begin
		if (rst)
			score = 0;
		else if (is_equal)
			score = score + 1;
	end


endmodule
