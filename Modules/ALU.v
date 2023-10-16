module ALU (
    input [2:0] ALUcontrol,
    input[31:0] srca ,srcb,
    output reg [31:0] ALUresult,
    output reg zeroflag,
    output reg signflag
);
always@(*) begin

case(ALUcontrol)
    3'b000:   ALUresult=srca + srcb;
    3'b001:   ALUresult=srca << srcb;
    3'b010:   ALUresult=srca - srcb;
    3'b100:   ALUresult=srca ^ srcb;
    3'b101:   ALUresult=srca >> srcb;
    3'b110:   ALUresult=srca | srcb;
    3'b111:   ALUresult=srca & srcb;
    default:  ALUresult=0;
endcase
 if(ALUresult==0) 
     zeroflag=1;
  else 
       zeroflag=0;

        signflag=ALUresult[31];
end

endmodule