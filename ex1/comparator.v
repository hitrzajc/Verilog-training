module comparator(
    input wire clk,
    input wire w1,
    input wire w2,
    output reg w3
);
    w3=0;
    always @(posedge clk) begin //changes only on clock edge
    
        w3 <= ~(w1 ^ w2); //if signals are the same we output 1, else 0
    end

endmodule