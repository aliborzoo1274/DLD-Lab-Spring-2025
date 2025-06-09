`define a 1'b0
`define b 1'b1

module controller_mp (
    input clk,
    input rst,
    input send,
    input co2,
    output reg en1,
    output reg ld,
    output reg valid
);

    reg [1:0] ps, ns;

    always @(posedge clk or posedge rst) begin
        if (rst)
            ps <= `a;
        else
            ps <= ns;
    end

    always @(ps, send, co2) begin
        case (ps)
            `a: ns = send ? `b : `a;
            `b: ns = co2 ? `a : `b;
            default: ns = `a;
        endcase
    end

    always @(ps) begin
        en1 = 1'b0;
        ld = 1'b0;
        valid = 1'b0;

        case (ps)
            `a:
            begin
                ld = 1'b1;
            end
            `b:
            begin
                en1 = 1'b1;
                valid = 1'b1;
            end
        endcase
    end
endmodule