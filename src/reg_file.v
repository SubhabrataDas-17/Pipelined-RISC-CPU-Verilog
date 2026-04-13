module reg_file(
    input clk,
    input reg_write,
    input [4:0] rs1, rs2, rd,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2
);

reg [31:0] regs[31:0];
integer i;

// Initialize registers
initial begin
    for (i = 0; i < 32; i = i + 1)
        regs[i] = 0;
end

// Read ports
assign read_data1 = regs[rs1];
assign read_data2 = regs[rs2];

// Write port
always @(posedge clk) begin
    if (reg_write && rd != 0)
        regs[rd] <= write_data;
end

endmodule