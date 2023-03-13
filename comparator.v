`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:46:32 03/09/2023 
// Design Name: 
// Module Name:    comparator 
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
module comparator(
    // Inputs
   clk,
  	sw, // 8 switch -> 2^8-1 = 255
   number,
   // Outputs
   is_equal
);
  	input clk;
   input [7:0]   sw;
  	input [7:0]	number;
	
   output reg is_equal;
	
	initial begin
		is_equal = 0;
	end
	
   always@ (posedge clk) begin
        if (sw == number)
            is_equal <= 1;
        else
            is_equal <= 0;
    end
endmodule

