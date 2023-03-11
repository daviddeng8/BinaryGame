`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:17:44 03/06/2023 
// Design Name: 
// Module Name:    number_display 
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
module number_display (
// Inputs
	display_clk,
	number,
	game_end,
	score,
// Outputs
   seg,
	an
);
	input [7:0] number; // 8-bit
	input display_clk;
	input game_end;
	input [3:0] score;

	 output reg [3:0] an;    // anode signals of the 7-segment LED display
    output reg [6:0] seg;   // cathode patterns of the 7-segment LED display

	 reg [3:0] LED_BCD;

    reg [1:0] LED_activating_counter = 2'b00;

    reg is_neg = 0;
    reg [7:0] absolute_value;

    initial begin
        if (number[7] == 1) begin // 2's complement -> if leftmost bit is 1 -> negative
            is_neg = 1;
            absolute_value = ~number + 8'b1;
        end else
            absolute_value = number;
    end

    always @(posedge display_clk) begin
        if (LED_activating_counter == 3)
            LED_activating_counter <= 0;
        else
            LED_activating_counter <= LED_activating_counter + 1;
    end

    always @(*) begin
	 
		  if (game_end) begin
			case(LED_activating_counter)
			  2'b00: begin
					an = 4'b0111; 
					LED_BCD = 5;
			  end
			  2'b01: begin
					an = 4'b1011; 
					LED_BCD = 4'b1011;
					end
			  2'b10: begin
					an = 4'b1101; 
					LED_BCD = (score / 10);
					// the second hex-digit of the 8-bit number
					end
			  2'b11: begin
					an = 4'b1110; 
					LED_BCD = score % 10;
					end
			  endcase
		  end
		  else begin
			  case(LED_activating_counter)
			  2'b00: begin
					an = 4'b0111; 

					if (is_neg == 1) begin
						 // an = 4'b0111; 
						 // activate LED1 and Deactivate LED2, LED3, LED4
						 LED_BCD = 4'b1010;
					end
					else
						LED_BCD = 4'b1111; // temporary dummy value
			  end
			  2'b01: begin
					an = 4'b1011; 
					// activate LED2 and Deactivate LED1, LED3, LED4
					LED_BCD = (absolute_value/100)%10;
					// the first hex-digit of the 8-bit number
					end
			  2'b10: begin
					an = 4'b1101; 
					// activate LED3 and Deactivate LED2, LED1, LED4
					LED_BCD = (absolute_value/10)%10;
					// the second hex-digit of the 8-bit number
					end
			  2'b11: begin
					an = 4'b1110; 
					// activate LED4 and Deactivate LED2, LED3, LED1
					LED_BCD = absolute_value%10;
					// the third hex-digit of the 8-bit number
					end
			  endcase
			end
		  
		  
    end
	 
    // Cathode patterns of the 7-segment LED display 
    always @(*) begin
    case(LED_BCD)
        4'b0000: seg = 7'b0000001; // "0"  
        4'b0001: seg = 7'b1001111; // "1" 
        4'b0010: seg = 7'b0010010; // "2" 
        4'b0011: seg = 7'b0000110; // "3" 
        4'b0100: seg = 7'b1001100; // "4" 
        4'b0101: seg = 7'b0100100; // "5" 
        4'b0110: seg = 7'b0100000; // "6" 
        4'b0111: seg = 7'b0001111; // "7" 
        4'b1000: seg = 7'b0000000; // "8"  
        4'b1001: seg = 7'b0000100; // "9" 
        4'b1010: seg = 7'b1111110; // "-"
		4'b1011: seg = 7'b1110110; // "="
        default: seg = 7'b1111111; // ""
        endcase
    end
endmodule
