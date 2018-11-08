`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:14 11/08/2018 
// Design Name: 
// Module Name:    shiftreg 
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
module shiftreg(clk, reset, sh, sdi, shiftout);
	input clk, reset, sh, sdi; 
	output reg [9:0] shiftout; 
	
	always @(posedge clk, posedge reset)
		if (reset)	shiftout <= 10'b0 ; 
		else if (sh) shiftout <={sdi, shiftout[9:1]};
		else shiftout <= shiftout ;
	

endmodule
