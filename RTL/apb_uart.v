module apb_uart(
	input pclk,
    input presetn,
    input [7:0] paddr,
    input pwrite,
    input penable,
    input psel,
    input [15:0] pwdata,
    output [15:0] prdata,
    output pready,
    output pslverr,
    input UARTn_RTS,
    input UARTn_RXD,
    output UARTn_TXD,
    output UARTn_CTS ,
    output UART_intrupt_req
    );

endmodule