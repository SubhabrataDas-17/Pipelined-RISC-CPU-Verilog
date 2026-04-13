module forwarding_unit(
    input [4:0] ex_rs1, ex_rs2,
    input [4:0] mem_rd, wb_rd,
    input mem_reg_write, wb_reg_write,
    output reg [1:0] fwdA, fwdB
);

always @(*) begin
    fwdA = 2'b00;
    fwdB = 2'b00;

    if(mem_reg_write && mem_rd != 0 && mem_rd == ex_rs1)
        fwdA = 2'b10;

    if(mem_reg_write && mem_rd != 0 && mem_rd == ex_rs2)
        fwdB = 2'b10;

    if(wb_reg_write && wb_rd != 0 && wb_rd == ex_rs1)
        fwdA = 2'b01;

    if(wb_reg_write && wb_rd != 0 && wb_rd == ex_rs2)
        fwdB = 2'b01;
end

endmodule
