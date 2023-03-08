// Code your design here
module random(
    // Input 100 MHz clock
	clk,
    // Outputs
    randnum,
);
    input clk;
	
  output reg [7:0] randnum; // 7 bits -> 2^7 -1 = 127 max 
  initial begin
    randnum = 0;
  end
  always@(posedge clk)
    begin
    randnum = randnum + 1;
    end

endmodule