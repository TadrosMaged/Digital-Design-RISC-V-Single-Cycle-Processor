module program_counter (
    input PCsrc,clk,arst,
    input [31:0]immext,
    input load, 
    output reg [31:0] PC
);

reg  [31:0] PCnext;
reg [31:0] PCtarget,PCplus4;

always@(posedge clk , negedge arst) begin
    if(arst == 0) PC<=0;
     else if(load) PC<= PCnext;
     else PC<=PCnext; 
end
always@(*) begin
 PCplus4= PC+4;
 PCtarget= PC+immext;
 PCnext= PCsrc? PCtarget:PCplus4;
end
endmodule