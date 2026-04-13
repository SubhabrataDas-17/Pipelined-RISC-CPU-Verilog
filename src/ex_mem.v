module ex_mem(
    input clk,
    input [31:0] alu_res, rd2,
    input [4:0] rd,
    input reg_write, mem_read, mem_write,
    output reg [31:0] alu_o, rd2_o,
    output reg [4:0] rd_o,
    output reg reg_write_o, mem_read_o, mem_write_o
);

always @(posedge clk) begin
    alu_o <= alu_res;
    rd2_o <= rd2;
    rd_o <= rd;
    reg_write_o <= reg_write;
    mem_read_o <= mem_read;
    mem_write_o <= mem_write;
end

endmodule