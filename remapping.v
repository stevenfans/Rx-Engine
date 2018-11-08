`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:10:05 11/02/2018 
// Design Name: 
// Module Name:    remapping 
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
module remapping(clk, reset, eight, pen, shiftData, bit9, bit8, bit7, out2TB, out2Comp);

	input 		 clk, reset, eight, pen; 
	input [9:0]  shiftData; 
	output bit9, bit8, bit7; 
	output [7:0] out2TB; 
	output [6:0] out2Comp; 
	
	reg [9:0] shiftBits; 
	wire parity, stop; 
	
	assign parity = 1'b1; 
	assign stop   = 1'b1; 
	
	always @(*)
	case({eight, pen})
		2'b00: shiftBits = {stop,shiftData[6:0],   1'b1, 1'b1};
		2'b01: shiftBits = {stop,parity, shiftData[6:0], 1'b1}; 
		2'b10: shiftBits = {stop, shiftData[7:0], 1'b1}; 
		2'b11: shiftBits = {stop,parity,shiftData[7:0]};
		default: shiftBits = {10'b0}; 
	endcase
	
	assign out2TB = shiftBits; 

endmodule
