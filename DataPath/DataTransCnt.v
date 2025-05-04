module data_trans_cnt (
    input clk,
    input clken,
    input reset,
    input cntd,
    input ldcntd,
    input [4:0] data_num,
    output reg [4:0] q,
    output reg cod
);

    always @(posedge clk) begin
        if (reset) begin
            q <= 5'b11111;
            cod <= 1'b0;
        end else if (clken) begin
            if (ldcntd) begin
                q <= data_num;
                cod <= 1'b0;
            end else if (cntd) begin
                if (q == 5'd0) begin
                    q <= 5'd31;
                    cod <= 1'b1;
                end else begin
                    q <= q - 1;
                    cod <= 1'b0;
                end
            end else begin
                cod <= 1'b0;
            end
        end
    end

endmodule