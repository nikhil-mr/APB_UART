# APB UART

A UART implementation designed around the AMBA APB bus interface. The project includes a top-level APB UART block and a baud-rate generator module.

## APB UART top-level block
The top module in `RTL/apb_uart.v` is the interface block that connects the APB master to the UART peripheral. It defines the external signals used for register access, data transfer, control, and interrupt handling.

### Signals
- `pclk` - APB clock input
- `presetn` - Active-low reset signal
- `paddr[7:0]` - Register address bus for UART register selection
- `pwrite` - Write enable; `1` means APB write, `0` means APB read
- `penable` - APB enable signal for the data phase
- `psel` - APB slave select signal
- `pwdata[15:0]` - Write data bus from master to UART block
- `prdata[15:0]` - Read data bus from UART block to master
- `pready` - APB ready signal
- `pslverr` - APB error response signal
- `UARTn_RTS` - Active-low RTS input
- `UARTn_RXD` - Active-low UART receive data input
- `UARTn_TXD` - Active-low UART transmit data output
- `UARTn_CTS` - Active-low CTS output
- `UART_intrupt_req` - Interrupt request output to the host

This block is the APB wrapper for the UART controller; the actual UART transmit/receive logic and control registers are intended to be implemented around this interface.

## Repository structure
- `RTL/apb_uart.v` - APB UART top-level module skeleton
- `RTL/baud_generator.v` - baud clock generation logic
- `TB/baud_generator_tb.v` - simple simulation testbench for the baud generator
- `Protocol Datasheet/` - APB and UART reference material
- `SIM/` - simulation directory
- `Reports/` - report/synthesis outputs directory





