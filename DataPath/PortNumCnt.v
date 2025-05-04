module port_num_cnt (
    input clk,
    input clken,
    input reset,
    input cnt1,
    output reg co1
);

    reg [1:0] q;

    always @(posedge clk) begin
        if (reset) begin
            q <= 2'b00;
            co1 <= 1'b0;
        end
        else if (clken) begin
            if (cnt1) begin
                if (q == 2'b01) begin
                    q <= 2'b00;
                    co1 <= 1'b1;
                end
                else begin
                    q <= q + 1;
                    co1 <= 1'b0;
                end
            end
        end
    end
endmodule