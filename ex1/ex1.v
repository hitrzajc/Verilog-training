module ex1(
    input  wire        clk,
    input  wire        rst_n,
    output reg  [15:0] counter
);
    always @(posedge clk) begin
        if (rst_n)
            counter <= 16'd0;
        else
            counter <= counter + 1'b1;
    end
endmodule