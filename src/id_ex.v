module id_ex(
    input clk,
    input [31:0] rd1, rd2, imm,
    input [4:0] rs1, rs2, rd,
    input reg_write, mem_read, mem_write, alu_src,
    output reg [31:0] rd1_o, rd2_o, imm_o,
    output reg [4:0] rs1_o, rs2_o, rd_o,
    output reg reg_write_o, mem_read_o, mem_write_o, alu_src_o
);

always @(posedge clk) begin
    rd1_o <= rd1;
    rd2_o <= rd2;
    imm_o <= imm;
    rs1_o <= rs1;
    rs2_o <= rs2;
    rd_o <= rd;
    reg_write_o <= reg_write;
    mem_read_o <= mem_read;
    mem_write_o <= mem_write;
    alu_src_o <= alu_src;
end

endmodule