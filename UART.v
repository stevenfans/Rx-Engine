`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:33 11/13/2018 
// Design Name: 
// Module Name:    UART 
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
module UART(RESET, CLK, BAUD, EIGHT, PEN, OHEL, RX, TX, OUT_PORT, IN_PORT,PED_OUT,
				PERR, FERR, OVF, reads_0, reads_1, writes_0);

	input RESET, CLK, EIGHT, PEN, OHEL, RX, reads_0, reads_1, writes_0;
	input [3:0] BAUD; 
	input [7:0] OUT_PORT;
	
	output PED_OUT; 
	output [7:0] IN_PORT;
	
	wire TxRdy, RxRdy;
	wire [7:0] Uart_Data; 
	
	TRANSMIT_ENG transmit(.CLK(CLK), .RESET(RESET), .BAUD(BAUD), .EIGHT(EIGHT), 
								 .PARITY_EN(PEN), .ODD_N_EVEN(OHEL), .OUT_PORT(OUT_PORT),  
								 .TXRDY(TxRdy), .TX(TX), LOAD(writes_0));
								 
	 RX_ENGINE recieve (.CLK(CLK), .RESET(RESET), .RX(RX), .EIGHT(EIGHT), .PEN(PEN), 
							  .OHEL(OHEL), .BAUD(BAUD), .UART_DATA(Uart_Data), RX_STATUS(RxRdy), 
							  .PERR(PERR), .FERR(FERR), .OVF(OVF), .reads_0(reads_0));
			
	always @(*)
		case({reads_0, reads_1})
			2'b01 : IN_PORT = RxRdy;
			2'b10 : IN_PORT = Uart_Data; 
		endcase
		
	or (PED_OUT, Rx_Rdy, Tx_Rdy); 
	
endmodule
