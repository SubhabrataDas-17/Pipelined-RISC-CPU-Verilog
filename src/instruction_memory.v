module instruction_memory(
    input [31:0] addr,
    output [31:0] instr
);

    // Memory array
    reg [31:0] memory [0:255];

    // Loop variable (declare OUTSIDE initial)
    integer i;

    // Initialize instructions
    initial begin
        // Sample instructions (RISC-V style)

        memory[0] = 32'h00000013; // NOP
        memory[1] = 32'h00100093; // ADDI x1, x0, 1
        memory[2] = 32'h00200113; // ADDI x2, x0, 2
        memory[3] = 32'h00308193; // ADDI x3, x1, 3
        memory[4] = 32'h00208233; // ADD x4, x1, x2
        memory[5] = 32'h402082B3; // SUB x5, x1, x2
        memory[6] = 32'h00310333; // ADD x6, x2, x3
        memory[7] = 32'h00000013; // NOP

        // Fill rest with NOP
        for (i = 8; i < 256; i = i + 1) begin
            memory[i] = 32'h00000013;
        end
    end

    // Instruction fetch (word aligned)
    assign instr = memory[addr[9:2]];

endmodule