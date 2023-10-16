module register_file(
    input [31:0] wd3 ,
    input [0:4]A1 ,A2 ,A3,
    input we3,clk,clr,
    output [31:0] rd1,rd2
);

integer i;
reg [31:0] mem [0:31];

initial begin
for(i=0;i<=31;i=i+1)
mem[i]<=0;
end

always@(posedge clk , negedge clr) begin
if(clr==0) begin
for(i=0;i<=31;i=i+1) begin
mem[i]<=0;
end
end
else if (we3==1)begin
mem[A3]<= wd3;
end
end 
assign rd1=mem[A1];
assign rd2=mem[A2];
endmodule 
