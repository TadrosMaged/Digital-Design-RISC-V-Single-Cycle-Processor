module UartplusBuffer(
  input clk_uart,areset_uart,WD,load,
  input [7:0] data,
  output tx_serial
);

wire [7:0] q;

uart_tx uart (.areset(areset_uart),.clk1(clk_uart),.data(q),.tx_serial(tx_serial));




Buffer buff (.areset(areset_uart),.clk(clk_uart),.load(load),.d(WD),.q(q));

endmodule
