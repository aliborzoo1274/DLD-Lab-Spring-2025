module sh_reg_mp (
    input wire clk,
    input wire rst,
    input wire ld,
    input wire [4:0] msg,
    input wire shift,
    output ser_out
);

    reg [8:0] q;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            q <= 9'b0;
        end else if (ld) begin
            q <= {4'b0101, msg};
        end else if (shift) begin
            q <= {q[7:0], 1'b0};
        end
    end

    assign ser_out = q[8];

endmodule