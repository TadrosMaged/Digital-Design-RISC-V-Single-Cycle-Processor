module main_dec(
    input [6:0] OP, 
    input [2:0]fun3,
    input zeroflag,
    output reg reg_wrt, ALUsrc, mem_wrt, result_src,
    output reg [1:0] immsrc,ALUop,
    output reg branch
);

always@(*) begin
    case(OP)
    7'b11: begin //load word
        reg_wrt=1;
        immsrc=0;
        ALUsrc=1;
        mem_wrt=0;
        result_src=1;
        branch=0;
        ALUop=0;
    end
    7'b10_0011: begin  //store word
        reg_wrt=0;
        result_src=1'bx;
        immsrc=2'b01;
        ALUsrc=1;
        mem_wrt=1;
        branch=0;
        ALUop=0;
    end
    7'b11_0011: begin //r-type
        immsrc=2'bxx;
        reg_wrt=1;
        ALUsrc=0;
        mem_wrt=0;
        result_src=0;
        branch=0;
        ALUop=2'b10;
    end
    7'b1_0011: begin //i-type
        reg_wrt=1;
        immsrc=0;
        ALUsrc=1;
        mem_wrt=0;
        result_src=0;
        branch=0;
        ALUop=2'b10;
    end
    7'b110_0011: begin //branch instruction
        reg_wrt=0;
        immsrc=2'b10;
        ALUsrc=0;
        mem_wrt=0;
        branch=1;
        ALUop=2'b01;
        result_src=1'bx;
    end
    default: begin
        reg_wrt=0;
        immsrc=0;
        ALUsrc=0;
        mem_wrt=0;
        result_src=0;
        branch=0;
        ALUop=0;
    end
    endcase
end

endmodule 