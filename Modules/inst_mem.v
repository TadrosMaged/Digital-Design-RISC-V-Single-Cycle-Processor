module inst_mem(
    input [31:0] Ai ,
    output  [31:0] rdi 
);

reg [31:0] inst_mem [0:63];
assign     rdi=inst_mem[Ai[31:2]];
initial begin
    $readmemh("assembly_code.txt",inst_mem);
end
endmodule