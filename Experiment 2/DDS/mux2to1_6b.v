module mux2to1_6b (
    input wire [5:0] in0,
    input wire [5:0] in1,
    input wire sel,
    output wire [5:0] out
);

    assign out = sel ? in1 : in0;

endmodule