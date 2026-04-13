module data_memory(
    input clk,
    input mem_read, mem_write,
    input [31:0] addr, write_data,
    output reg [31:0] read_data
);

reg [31:0] mem[0:255];

always @(posedge clk)
    if(mem_write)
        mem[addr[9:2]] <= write_data;

always @(*)
    if(mem_read)
        read_data = mem[addr[9:2]];
    else
        read_data = 0;

endmodule