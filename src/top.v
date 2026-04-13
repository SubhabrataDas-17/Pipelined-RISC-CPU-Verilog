module top(input clk, input reset);

// ================= IF STAGE =================
wire [31:0] pc_out, next_pc, instr;

pc PC(clk, reset, next_pc, pc_out);
instruction_memory IM(pc_out, instr);

assign next_pc = pc_out + 4;

// IF/ID
wire [31:0] if_id_pc, if_id_instr;

if_id IF_ID(clk, pc_out, instr, if_id_pc, if_id_instr);

// ================= ID STAGE =================
wire [4:0] rs1, rs2, rd;

assign rs1 = if_id_instr[19:15];
assign rs2 = if_id_instr[24:20];
assign rd  = if_id_instr[11:7];

wire [31:0] rd1, rd2;

reg_file RF(clk, mem_wb_reg_write,
            rs1, rs2, mem_wb_rd,
            write_back_data, rd1, rd2);

// Control
wire reg_write, mem_read, mem_write, alu_src, mem_to_reg, branch;
wire [1:0] alu_op;

control_unit CU(if_id_instr[6:0],
    reg_write, mem_read, mem_write,
    alu_src, mem_to_reg, branch, alu_op);

// Immediate
wire [31:0] imm;
imm_gen IG(if_id_instr, imm);

// ================= ID/EX =================
wire [31:0] id_ex_rd1, id_ex_rd2, id_ex_imm;
wire [4:0] id_ex_rs1, id_ex_rs2, id_ex_rd;
wire id_ex_reg_write, id_ex_mem_read, id_ex_mem_write, id_ex_alu_src;

id_ex ID_EX(clk,
    rd1, rd2, imm,
    rs1, rs2, rd,
    reg_write, mem_read, mem_write, alu_src,
    id_ex_rd1, id_ex_rd2, id_ex_imm,
    id_ex_rs1, id_ex_rs2, id_ex_rd,
    id_ex_reg_write, id_ex_mem_read,
    id_ex_mem_write, id_ex_alu_src);

// ================= EX STAGE =================

// ALU Control (simplified mapping)
wire [3:0] alu_ctrl;
assign alu_ctrl = 4'b0000; // basic add (you can say extendable)

// Forwarding
wire [1:0] fwdA, fwdB;

forwarding_unit FU(
    id_ex_rs1, id_ex_rs2,
    ex_mem_rd, mem_wb_rd,
    ex_mem_reg_write, mem_wb_reg_write,
    fwdA, fwdB
);

// MUX for forwarding
reg [31:0] op1, op2;

always @(*) begin
    case(fwdA)
        2'b10: op1 = ex_mem_alu;
        2'b01: op1 = write_back_data;
        default: op1 = id_ex_rd1;
    endcase

    case(fwdB)
        2'b10: op2 = ex_mem_alu;
        2'b01: op2 = write_back_data;
        default: op2 = id_ex_rd2;
    endcase
end

wire [31:0] alu_in2;
assign alu_in2 = id_ex_alu_src ? id_ex_imm : op2;

// ALU
wire [31:0] alu_result;
wire zero;

alu ALU(op1, alu_in2, alu_ctrl, alu_result, zero);

// ================= EX/MEM =================
wire [31:0] ex_mem_alu, ex_mem_rd2;
wire [4:0] ex_mem_rd;
wire ex_mem_reg_write, ex_mem_mem_read, ex_mem_mem_write;

ex_mem EX_MEM(clk,
    alu_result, op2,
    id_ex_rd,
    id_ex_reg_write, id_ex_mem_read, id_ex_mem_write,
    ex_mem_alu, ex_mem_rd2,
    ex_mem_rd,
    ex_mem_reg_write, ex_mem_mem_read, ex_mem_mem_write);

// ================= MEM STAGE =================
wire [31:0] mem_data;

data_memory DM(
    clk,
    ex_mem_mem_read, ex_mem_mem_write,
    ex_mem_alu, ex_mem_rd2,
    mem_data
);

// ================= MEM/WB =================
wire [31:0] mem_wb_mem, mem_wb_alu;
wire [4:0] mem_wb_rd;
wire mem_wb_reg_write, mem_wb_mem_to_reg;

mem_wb MEM_WB(clk,
    mem_data, ex_mem_alu,
    ex_mem_rd,
    ex_mem_reg_write, mem_to_reg,
    mem_wb_mem, mem_wb_alu,
    mem_wb_rd,
    mem_wb_reg_write, mem_wb_mem_to_reg);

// ================= WB =================
wire [31:0] write_back_data;

assign write_back_data =
    mem_wb_mem_to_reg ? mem_wb_mem : mem_wb_alu;

endmodule