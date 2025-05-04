module data_num_cnt (
    input clk,
    input clken,
    input reset,
    input cnt2,
    output reg co2
);

    reg [2:0] q;

    always @(posedge clk) begin
        if (reset) begin
            q <= 3'b000;
            co2 <= 1'b0;
        end
        else if (clken) begin
            if (cnt2) begin
                if (q == 3'b100) begin
                    q <= 3'b000;
                    co2 <= 1'b1;
                end
                else begin
                    q <= q + 1;
                    co2 <= 1'b0;
                end
            end
        end
    end
endmodule