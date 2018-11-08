`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:12:53 11/08/2018
// Design Name:   shiftreg
// Module Name:   D:/SCHOOL WORK/CECS 460 Labs/RECEIVE_ENGINE/shiftreg_tb.v
// Project Name:  RECEIVE_ENGINE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shiftreg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shiftreg_tb;

	// Inputs
	reg clk;
	reg reset;
	reg sh;
	reg sdi;

	// Outputs
	wire [9:0] shiftout;

	// Instantiate the Unit Under Test (UUT)
	shiftreg uut (
		.clk(clk), 
		.reset(reset), 
		.sh(sh), 
		.sdi(sdi), 
		.shiftout(shiftout)
	);
	
always #5 clk = ~clk; 
always #10 sh = ~sh ; 

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		sh = 0;
		sdi = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0; 
        
		// Add stimulus here

	end
      
endmodule

