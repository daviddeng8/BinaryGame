`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:29:11 03/06/2023
// Design Name:   game
// Module Name:   C:/Users/Student/Desktop/m152a_Lebron_W23/BinaryMadness/tb.v
// Project Name:  BinaryMadness
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: game
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Outputs
	// wire ;

	// Instantiate the Unit Under Test (UUT)
	game uut ();

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
		$display("hello world");
        
		// Add stimulus here

	end
      
endmodule

