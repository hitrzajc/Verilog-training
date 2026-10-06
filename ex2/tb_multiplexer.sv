`timescale 1ns/1ps

// module tb_multiplexer;
//     reg  [3:0] w = 4'b0000;  
//     wire [1:0] y;             

//     multiplexer dut (
//         .w (w),
//         .y (y)
//     );

//     always #1  w <= w + 1'b1; // increment w every 1ns

//     initial begin
//         $dumpfile("wave.vcd");
//         $dumpvars(0);
//         #200 $finish;
//     end

//     initial
//         $monitor("t=%0t w=%b sel=%b y=%b", $time, w, w[3], y);
// endmodule

module tb_multiplexer;
    logic  [3:0] w = 4'b0000;  
    logic  [1:0] s = 2'b00; // select signal
    wire y;             


    multiplexer dut (
        .w,
        .s,
        .y
    );

    always #20  w <= w + 1'b1; // increment w every 1ns
    always #1  s <= s + 1'b1; // increment s every 2ns
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0);
        #600 $finish;
    end

    initial
        $monitor("t=%0t w=%b sel=%b y=%b", $time, w, s, y);
endmodule