`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:00 03/09/2023 
// Design Name: 
// Module Name:    timer_display 
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
module timer_display(
	display_clk,
	time_remaining,  // the time remaining will be between 0 and 30 seconds
	timer_seg,
	timer_anode
);

	input display_clk;
	input [5:0] time_remaining;
	output reg [6:0] timer_seg;
	output reg timer_anode;

	reg [3:0] LED_BCD;

	initial begin
		timer_anode = 0;
	end

	always @(posedge display_clk) begin
		timer_anode = ~timer_anode;
	end

	always @(*) begin
		if (timer_anode == 1) begin
			LED_BCD = time_remaining % 10;
		end
		else if (timer_anode == 0) begin
			LED_BCD = (time_remaining / 10); 
		end
		
    end
	 
    // Cathode patterns of the 7-segment LED display 
    always @(*) begin
    case(LED_BCD)
        4'b0000: timer_seg = 7'b0111111; // "0"  
        4'b0001: timer_seg = 7'b0110000; // "1"  // 3rd bit corresponds to B, so third bit = B, 2nd bit corresponds to E
        4'b0010: timer_seg = 7'b1011011; // "2"  // 3rd and 6th bits correspond to B and C
        4'b0011: timer_seg = 7'b1111001; // "3" 
        4'b0100: timer_seg = 7'b1110100; // "4" 
        4'b0101: timer_seg = 7'b1101101; // "5" 
        4'b0110: timer_seg = 7'b1101111; // "6" 
        4'b0111: timer_seg = 7'b0111000; // "7" 
        4'b1000: timer_seg = 7'b1111111; // "8"  
        4'b1001: timer_seg = 7'b1111101; // "9" 
        4'b1010: timer_seg = 7'b1111110; // "-" 
        default: timer_seg = 7'b0000000; // ""
        endcase
		  
		  // timer_seg = ~timer_seg;
    end
	

endmodule
