module mem_wb(
    input clk,
    input [31:0] mem_data, alu_res,
    input [4:0] rd,
    input reg_write, mem_to_reg,
    output reg [31:0] mem_o, alu_o,
    output reg [4:0] rd_o,
    output reg reg_write_o, mem_to_reg_o
);

always @(posedge clk) begin
    mem_o <= mem_data;
    alu_o <= alu_res;
    rd_o <= rd;
    reg_write_o <= reg_write;
    mem_to_reg_o <= mem_to_reg;
end

endmodule