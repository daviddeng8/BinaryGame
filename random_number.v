`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:53:44 03/08/2023 
// Design Name: 
// Module Name:    random_number 
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
module random_number(
    // Input 100 MHz clock
	clk,
	rst,
	is_equal,
    // Outputs
   	randnum
);

	input clk;
  	input rst;
  	input is_equal;
  	output reg [7:0] randnum; // 8 bits -> 2^8 -1 = 255 max 

  	reg [7:0] ctr;
  
  	initial begin
    	ctr = 0;
	 	randnum = 0;
  	end

  	always @(posedge clk) begin
		if (rst) begin
			ctr <= 0;
			randnum <= 0;
		end
		else begin
			ctr <= ctr + 1; 
			if (is_equal)
				randnum <= ctr;
			else
				randnum <= randnum;
		end
  	end

endmodule
