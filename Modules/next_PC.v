module next_PC(
input clk,arst,load,
input [31:0] PCnext,
output reg [31:0]PC
);

always@(posedge clk,negedge arst) begin
      if(arst==0) PC<=0;
      else if(load==0) PC<=PC;
      else PC<=PCnext;
    end

endmodule