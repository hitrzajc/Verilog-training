`timescale 1ns/1ps

module comparator(
    input  logic [1:0] a,
    input  logic [1:0] b,
    output logic       gt,
    output logic       eq,
    output logic       lt
);

    //bug
    // always @(a[0]==0) begin
    //     if (a[0] == 0) begin
    //     gt = 1;
    //     end else begin
    //         gt = (a>b);
    //     end
    // end

    assign gt = (a > b); //zakomentiri za odresitev buga
    assign eq = (a == b);
    assign lt = (a < b);
endmodule