`timescale 1ns/1ps

module tb_comparator;
    // ---- DUT signals ----
    logic [1:0] a, b;
    logic       gt, eq, lt;

    // ---- Bookkeeping (simulation-only) ----
    int errors = 0;
    int checks = 0;

    // ---- Instantiate DUT ----
    comparator dut (
        .a,
        .b,
        .gt,
        .eq,
        .lt
    );

    // ---- Reference model: what the answer *should* be ----
    //automatic does initialize variables everytime the f is called
    function automatic void check(input logic [1:0] aa, input logic [1:0] bb);
        logic exp_gt, exp_eq, exp_lt; //expected
        exp_gt = (aa > bb);
        exp_eq = (aa == bb);
        exp_lt = (aa < bb);

        checks++;
        if ({gt, eq, lt} !== {exp_gt, exp_eq, exp_lt}) begin
            errors++;
            $error("FAIL t=%0t a=%b b=%b -> gt=%b eq=%b lt=%b (expected %b %b %b)",
                   $time, aa, bb, gt, eq, lt, exp_gt, exp_eq, exp_lt);
        end
    endfunction

    // ---- Stimulus: exhaustive sweep over all 16 (a,b) pairs ----
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_comparator);

        for (int ai = 0; ai < 4; ai++) begin
            for (int bi = 0; bi < 4; bi++) begin
                a = ai[1:0];
                b = bi[1:0];
                #1;                 // let combinational logic settle
                check(a, b);
            end
        end

        // ---- Final report ----
        if (errors == 0)
            $display("PASS: %0d checks, 0 errors", checks);
        else
            $display("FAIL: %0d checks, %0d errors", checks, errors);

        $finish;
    end
endmodule