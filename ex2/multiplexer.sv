// module multiplexer(
//     input wire [3:0] w,
//     output reg [1:0] y
// );
//     always @(*) begin
//         if (w[3]) begin
//             y[0] = ~w[2] + ~w[1] + ~w[0];
//             y[1] =  w[1]^w[0] + w[2]&w[1];
//         end
//         else if (w[2]) begin
//             y = w[1:0];
//         end else if (w[1]==w[2]) begin
//             y = ~w[1:0];
//         end else begin
//             y = 2'b00;
//         end
//     end
// endmodule


module multiplexer(
    input logic [3:0] w,
    input logic [1:0] s,
    output logic y
);
    assign y = w[s];
endmodule