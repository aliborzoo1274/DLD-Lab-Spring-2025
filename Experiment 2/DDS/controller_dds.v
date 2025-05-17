`define a 2'b00
`define b 2'b01
`define c 2'b10
`define d 2'b11

module controller_dds (
    input clk,
    input rst,
    input co,
    output reg pp,
    output reg sb
);

    reg [1:0] ps, ns;

    always @(posedge clk or posedge rst) begin
        if (rst)
            ps <= `a;
        else
            ps <= ns;
    end

    always @(ps, co) begin
        case (ps)
            `a: ns = co ? `b : `a;
            `b: ns = co ? `c : `b;
            `c: ns = co ? `d : `c;
            `d: ns = co ? `a : `d;
            default: ns = `a;
        endcase
    end

    always @(ps) begin
        pp = 1'b0;
        sb = 1'b0;

        case (ps)
            `b:
            begin
                pp = 1'b1;
                sb = 1'b0;
            end
            `c:
            begin
                pp = 1'b0;
                sb = 1'b1;
            end
            `d:
            begin
                pp = 1'b1;
                sb = 1'b1;
            end
        endcase
    end
endmodule