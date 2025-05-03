`define a 2'b00
`define b 2'b01
`define c 2'b10

module controller_onepulser (clkpb, rst, clk, clken);
    input clkpb, rst, clk;
    output reg clken;

    reg [1:0] ps, ns;

    always @(posedge clk) begin
        if (rst)
            ps <= `a;
        else
            ps <= ns;
    end

    always @(*) begin
        case (ps)
            `a: ns = clkpb ? `b : `a;
            `b: ns = `c;
            `c: ns = clkpb ? `c : `a;
            default: ns = `a;
        endcase
    end

    always @(*) begin
        clken = (ps == `b);
    end
endmodule