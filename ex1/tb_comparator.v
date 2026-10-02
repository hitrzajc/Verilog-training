`timescale 1ns/1ps

module tb_comparator;
    reg  clk = 0;
    reg  w1  = 0;
    reg  w2  = 0;
    wire w3;

    comparator dut (
        .clk (clk),
        .w1  (w1),
        .w2  (w2),
        .w3  (w3)
    );

    always #5  clk = ~clk;
    always #15 w1  = ~w1;
    always #3  w2  = ~w2;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0);
        #200 $finish;
    end

    initial
        $monitor("t=%0t w1=%b w2=%b w3=%b", $time, w1, w2, w3);
endmodule