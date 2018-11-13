`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:07:20 11/11/2018
// Design Name:   RX_ENGINE
// Module Name:   D:/SCHOOL WORK/CECS 460 Labs/RECEIVE_ENGINE/RX_ENGINE_TB.v
// Project Name:  RECEIVE_ENGINE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RX_ENGINE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RX_ENGINE_TB;

	// Inputs
	reg CLK;
	reg RESET;
	reg RX;
	reg EIGHT;
	reg PEN;
	reg OHEL;
	reg [3:0] BAUD;
	reg [3:0] port_id;
	reg read_strobe;

	// Outputs
	wire [7:0] UART_DATA;
	wire RX_STATUS;

	// Instantiate the Unit Under Test (UUT)
	RX_ENGINE uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.RX(RX), 
		.EIGHT(EIGHT), 
		.PEN(PEN), 
		.OHEL(OHEL), 
		.BAUD(BAUD), 
		.UART_DATA(UART_DATA), 
		.RX_STATUS(RX_STATUS), 
		.port_id(port_id), 
		.read_strobe(read_strobe)
	);

always #5 CLK = ~CLK; 
	initial begin
		// Initialize Inputs
		CLK = 0;
		RESET = 0;
		RX = 0;
		EIGHT = 0;
		PEN = 0;
		OHEL = 0;
		BAUD = 0;
		port_id = 0;
		read_strobe = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

