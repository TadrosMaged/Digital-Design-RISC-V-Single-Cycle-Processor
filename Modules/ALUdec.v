module ALUdec(
    input [1:0] ALUop,
    input [2:0] fun3, 
    input OP5  ,fun7 ,zeroflag,signflag,
    output reg [2:0] ALUcontrol,
    output reg PCsrc,
    input wire branch
);

always@(*) begin
    PCsrc=0;
    case(ALUop)
    2'b00: ALUcontrol=000;

    2'b01: begin
        if(fun3==3'b000) begin 
            ALUcontrol=3'b010;
            PCsrc=(zeroflag & branch);
        end
        else if(fun3==3'b001)begin 
            ALUcontrol=3'b010;
            PCsrc= (~(zeroflag) & branch);
        end
        else if(fun3==3'b100) begin 
            ALUcontrol=3'b010;
            PCsrc=(signflag & branch);
        end
        else begin PCsrc=0; ALUcontrol=0; end
    end

    2'b10: begin
        if(fun3==3'b000 && ~(OP5&fun7)) ALUcontrol=3'b000;
        else if(fun3==3'b000 && (OP5&fun7)) ALUcontrol=3'b010;
        else if(fun3==3'b001) ALUcontrol=3'b001;
        else if(fun3==3'b100) ALUcontrol=3'b100;
        else if(fun3==3'b101) ALUcontrol=3'b101;
        else if(fun3==3'b110) ALUcontrol=3'b110;
        else if(fun3==3'b111) ALUcontrol=3'b111;
        else ALUcontrol=0;
    end
    
    default: begin ALUcontrol=0; PCsrc=0; end

endcase
end
endmodule