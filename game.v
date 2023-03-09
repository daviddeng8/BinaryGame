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
	seg
);
	input clk;
	input [7:0] sw;
	input btnR;
	output [3:0] an;
	output [6:0] seg;

	// output [6:0] seg;
	// reg [23:0] cycles;
	wire timer_clk;
	wire display_clk;
	
	wire [7:0] randnum;
	wire is_equal;
	
	reg [7:0] number = 8'b10101010;
	
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
	
	comparator compare(
		.clk(clk),
		.sw(sw),
		.number(randnum),
		.is_equal(is_equal)
	);
	
	number_display num_display(
		.display_clk(display_clk),
		.number(randnum),
		.seg(seg),
		.an(an)
	);
	
	
	/*
	always @ (*) begin
		if (is_equal == 1) begin
			number = number + 8'b1;
		end
	end*/
	
endmodule
