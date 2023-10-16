module data_path(
    input clock,reset
);


 wire [2:0] ALUcontrol;
 wire [31:0] srcb,srca,ALUresult,PC,immext,Ai,Ad,rdi,rdd,wd3,rd1,rd2,wd,in1,in2,out,result;
 wire PCsrc,sel,reg_wrt,ALUsrc,mem_wrt,result_src,branch,arst,zeroflag,signflag;
 wire [1:0] immsrc,ALUop;

program_counter prog_count(.immext(immext), .clk(clock), .arst(reset), .PCsrc(PCsrc), .PC(PC), .load(1'b1));

inst_mem instr_mem (.Ai(PC), .rdi(rdi));

register_file reg_file (.wd3(result), .A1(rdi[19:15]), .A2(rdi[24:20]), .A3(rdi[11:7]), .we3(reg_wrt), .clk(clock), .clr(reset), .rd1(srca), .rd2(rd2));

mux Malu(.in1(rd2), .in2(immext), .sel(ALUsrc), .out(srcb));

ALU alu(.ALUcontrol(ALUcontrol), .srca(srca), .srcb(srcb), .ALUresult(ALUresult), .zeroflag(zeroflag), .signflag(signflag));

data_mem mem(.we(mem_wrt), .clk(clock), .Ad(ALUresult), .wd(rd2), .rdd(rdd));

mux Mdata(.in1(ALUresult) , .in2(rdd), .sel(result_src), .out(result));

extend ex(.immsrc(immsrc), .instr(rdi[31:7]), .immext(immext));

ALUdec ALU_dec(.branch(branch), .ALUop(ALUop), .fun3(rdi[14:12]), .OP5(rdi[5]), .fun7(rdi[30]), .ALUcontrol(ALUcontrol), .PCsrc(PCsrc), .zeroflag(zeroflag), .signflag(signflag));

main_dec main(.OP(rdi[6:0]), .fun3(rdi[14:12]), .zeroflag(zeroflag), .reg_wrt(reg_wrt), .ALUsrc(ALUsrc), .immsrc(immsrc), .mem_wrt(mem_wrt), .result_src(result_src), .ALUop(ALUop), .branch(branch));


endmodule