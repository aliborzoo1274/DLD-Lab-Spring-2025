`define a 2'b00
`define b 2'b01
`define c 2'b10
`define d 2'b11

module controller (
    input clk,
    input clken,
    input rst,
    input co1,
    input co2,
    input cod,
    input serin,
    output reg cnt1,
    output reg cnt2,
    output reg cntd,
    output reg ldcntd,
    output reg shen,
    output reg shend,
    output reg serout_valid,
    output reg done
);

    reg [1:0] ps, ns;

    always @(posedge clk) begin
        if (rst)
            ps <= `a;
        else if (clken)
            ps <= ns;
    end

    always @(ps or serin or co1 or co2 or cod) begin
        case (ps)
            `a: ns = serin ? `a : `b;
            `b: ns = co1 ? `c : `b;
            `c: ns = co2 ? `d : `c;
            `d: ns = cod ? `a : `d;
            default: ns = `a;
        endcase
    end

    always @(ps or co2 or cod) begin
        cnt1 = 1'b0;
        cnt2 = 1'b0;
        cntd = 1'b0;
        ldcntd = 1'b0;
        shen = 1'b0;
        shend = 1'b0;
        serout_valid = 1'b0;
        done = 1'b0;
        case (ps)
            `b:
            begin
                shen = 1'b1;
                cnt1 = 1'b1;
            end
            `c:
            begin
                shend = 1'b1;
                ldcntd = co2;
                cnt2 = 1'b1;
            end
            `d:
            begin
                cntd = 1'b1;
                serout_valid = 1'b1;
                done = cod;
            end
        endcase
    end
endmodule