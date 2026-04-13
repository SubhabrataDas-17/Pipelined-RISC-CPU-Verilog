module tb_top;

reg clk;
reg reset;

// Instantiate top module
top uut(clk, reset);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Reset
initial begin
    reset = 1;
    #10 reset = 0;
end

// Simulation time
initial begin
    #5000 $finish;
end

endmodule
