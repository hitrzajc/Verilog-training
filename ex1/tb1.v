`timescale 1ns/1ps

module tb;
    reg        clk = 0;
    reg        rst_n = 0;
    wire [15:0] counter;

    // instantiate your design (DUT = device under test)
    ex1 dut (
        .clk     (clk),
        .rst_n   (rst_n),
        .counter (counter)
    );

    // clock: toggles every 5ns -> 10ns period
    always #5 clk = ~clk;
    // reg rst_n = 0;

    initial forever begin
        rst_n = 0;
        #50;          // low for 20ns
        rst_n = 1;
        #10;          // high for one clock period (10ns)
    end
    initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0);
    // #12   rst_n = 1;
    // #30 rst_n = 1;
    // #10  rst_n = 0;      // 10 = one clock period
    #2000 $finish;      // 200 clock cycles -> counter reaches 50
    end



    initial
        $monitor("t=%0t rst_n=%b counter=%0d", $time, rst_n, counter);
endmodule