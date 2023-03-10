`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:56 03/06/2023 
// Design Name: 
// Module Name:    game 
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
module game(
	clk,
	sw,
	btnR,
	an,
	seg,
	timer_seg,
	timer_anode
);
	input clk;
	input [7:0] sw;
	input btnR;
	
	// anode and cathode for the random number displayed
	output [3:0] an;
	output [6:0] seg;
	
	// anode and cathode for the timer
	output [6:0] timer_seg;
	output timer_anode;

	// output [6:0] seg;
	// reg [23:0] cycles;
	wire timer_clk;
	wire display_clk;
	
	wire [7:0] randnum;
	wire is_equal;
	
	wire [3:0] score;
	
	wire [5:0] time_remaining;
	
	wire game_end;
	
	clock_divider clk_div(
		.clk(clk),
		.timer_clk(timer_clk),
		.display_clk(display_clk)
	);
	
	random_number rand(
		.clk(clk),
		.rst(btnR),
		.is_equal(is_equal),
		.randnum(randnum)
	);
	
	timer time_ctr(
		.clk(clk),
		.timer_clk(timer_clk),
		.rst(btnR),
		.time_remaining(time_remaining),
		.game_end(game_end)
	);
	
	score_counter scorer(
		.clk(clk),
		.rst(btnR),
		.is_equal(is_equal),
		.score(score)
	);
	
	comparator compare(
		.clk(clk),
		.sw(sw),
		.number(randnum),
		.is_equal(is_equal)
	);
	
	number_display num_display(
		.display_clk(display_clk),
		.number(randnum),
		.game_end(game_end),
		.score(score),
		.seg(seg),
		.an(an)
	);
	
	timer_display time_display(
		.display_clk(display_clk),
		.time_remaining(time_remaining),  // the time remaining will be between 0 and 30 seconds
		.timer_seg(timer_seg),
		.timer_anode(timer_anode)
	);
	
	/*
	always @ (*) begin
		if (is_equal == 1) begin
			number = number + 8'b1;
		end
	end*/
	
endmodule
