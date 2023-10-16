module data_mem(
input we ,clk,       /*mem_wrt*/
input [31:0] Ad ,wd,       /*rd2*//*ALUresult*/
output [31:0] rdd
);

reg [31:0] mem [0:63];

always@(posedge clk) begin
if(we)
mem[Ad[31:2]]<=wd;
end
assign rdd=mem[Ad];
endmodule