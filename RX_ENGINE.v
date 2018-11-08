`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:36 11/05/2018 
// Design Name: 
// Module Name:    RX_ENGINE 
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
module RX_ENGINE(CLK, RESET, RX, EIGHT, PEN, OHEL, BAUD, UART_DATA, RX_STATUS);

	input CLK, RESET, RX, EIGHT, PEN, OHEL; 
	input [3:0]	BAUD; 
	
	output RX_STATUS; 
	output [7:0]	UART_DATA; 
	
	//===============================================================
	// WIRES FOR THE STD
	//===============================================================
	reg n_state, state; 
	reg n_out, out; 
	
	parameter
	s0 = 2'b00, 
	s1 = 2'b01, 
	s2 = 2'b10; 
	
	//================================================================
	//	WIRES FOR THE BIT-TIME COUNTER && BIT-COUNTER
	//================================================================
	wire 	btu, done; 
	wire[19:0] baud_pick, half_baud_count; //wire to hold the value to be comapared
	reg	doit, start; 
	
	reg [18:0]	n_count, count, baud_count;  
	reg [3:0]	n_tally, tally; 
	reg [3:0]	result; 
		
	//===============================================================
	// WIRES FOR THE SHIFT REGISTER
	//===============================================================	
	wire btstart; 
	reg [9:0] shiftout;
		
	//===============================================================
	// WIRES FOR REMAP COMBO
	//===============================================================	
	wire bit9, bit8, bit7; 
	wire [7:0] out2TB; 
	wire [6:0] out2Comp; 
	reg [9:0] shiftBits; 
	
	//===============================================================
	// WIRES FOR BOTTOM THREE MUXES
	//===============================================================
	wire pg_Sel, pb_Sel, sb_Sel; 
	
	//==============================================================
	// 				STD
	//===============================================================
	
	// combo cloud
	// inputs: RX, btu, done
	// output: start, doit
	always @(*) begin
		start = 1'b0; 
		doit = 1'b0; 
		casez({RX, btu, done})
			s0 : {n_state, start, doit} = ({3'b0??}) ? {s1, 1'b1, 1'b1} : {s0, 1'b0, 1'b0};
			s1 : {n_state, start, doit} = ({3'b01?}) ? {s2, 1'b0, 1'b1} : {s1, 1'b0, 1'b0}; 
			s2 : {n_state, start, doit} = ({3'b??0}) ? {s0, 1'b1, 1'b1} : {s1, 1'b0, 1'b0}; 
		endcase
	end

//***************************************************************************************
//***********CONTROL	UNIT****************************************************************
//***************************************************************************************

	//===============================================================
	// BIT-TIME COUNTER && BIT-COUNTER
	//===============================================================
	always @ (*)
		case(BAUD)
			4'b0000: baud_count = 333333;
			4'b0001: baud_count = 83333;
			4'b0010: baud_count = 41667;
			4'b0011: baud_count = 20833;
			4'b0100: baud_count = 10417;
			4'b0101: baud_count = 5208;
			4'b0110: baud_count = 2604;
			4'b0111: baud_count = 1736;
			4'b1000: baud_count = 868;
			4'b1001: baud_count = 434;
			4'b1010: baud_count = 217;
			4'b1011: baud_count = 109;
			default : baud_count = 0; 
		endcase
		
	//===============================================================
	// EIGHT & PEN BITS COMPARTOR DECIDER
	//===============================================================
	always @(*)
		case({EIGHT, PEN})
			2'b00 : result = 4'h8; 
			2'b01 : result = 4'h9; 
			2'b10 : result = 4'h9;
			2'b11 : result = 4'hA;
			default : result = 4'h8; 
		endcase
		
		assign half_baud_count = baud_count >> 1; //divide the baud count by 2
		
		assign baud_pick = (start) ? half_baud_count : baud_count; // mux to decide the count
		
		// combined two of the muxes for th bit count and baud count
		always @ (*)
			case({doit, btu})
			2'b00 : begin
						n_count = 19'b0; 
						n_tally =  4'b0; 
					 end
			2'b01 : begin
						n_count = 19'b0; 
						n_tally =  4'b0; 
					 end
			2'b10 : begin
						n_count = count + 19'b1; 
						n_tally =  tally; 
					 end
			2'b11 : begin
						n_count = 19'b0; 
						n_tally =  tally + 19'b1; 
					 end
		endcase
		
		always @ (posedge CLK, posedge RESET)
			if(RESET) begin
					count <= 19'b0; 
					tally <= 19'b0; 
				end else begin
					count <= n_count; 
					tally <= n_tally; 
				end
		
		// assigning btu signal
		assign btu = (count == baud_pick) ? 1'b1: 1'b0; 
		
		// assigning the done signal
		assign done = (tally == result)	? 1'b1: 1'b0; 
	
//***************************************************************************************
//**********************END of CONTROL UNIT**********************************************
//***************************************************************************************	
		
//***************************************************************************************
//**************************DATA PATH****************************************************
//***************************************************************************************		

	//===============================================================
	// 	SHIFT REGISTER
	//===============================================================
	
	and startgate (btstart, btu, !start);
	
	always @ (posedge CLK, posedge RESET)
		if 	  (RESET)		store <= 10'h3FF;
		else if (btstart) 	store <= {RX, store[9:1]};
		else						store <= store; 
		
	//===============================================================
	// 	REMAP COMBO
	//===============================================================
	assign parity = 1'b1; 
	assign stop   = 1'b1;
	
	always @(*)
		case ({EIGHT, PEN})
			2'b00: shiftBits = {stop,store[6:0],   1'b1, 1'b1};
			2'b01: shiftBits = {stop,store, shiftData[6:0], 1'b1}; 
			2'b10: shiftBits = {stop,store[7:0], 1'b1}; 
			2'b11: shiftBits = {stop,parity,store[7:0]};
			default shiftBits = 10'h3FF; 
		endcase
	
	assign bit9 = shiftBits[9];
	assign bit8 = shiftBits[8];
	assign bit7 = shiftBits[7]; 
	
	assign out2TB = shiftBits[7:0];
	assign out2Comp = shiftBits[6:0]; 
	
	//===============================================================
	// 	BOTTOM THREE MUXES
	//===============================================================
	
	// parity gen select
	assign pg_Sel = (EIGHT) ? bit7 : 1'b0; 
	
	// parity bit select 
	assign pb_Sel = (EIGHT) ? bit8 : bit7; 
	
	// stop bit select
	always @(*)
		case({EIGHT, PEN})
			2'b00 : sb_sel = bit7; 
			2'b01 : sb_sel = bit8; 
			2'b10 : sb_sel = bit9; 
			2'b11 : sb_sel = bit8;
			default : sb_sel = 1'b0; 
		endcase
		
	//===============================================================
	// 	THE FOUR AND GATES
	//===============================================================
	
	
		
	
endmodule
