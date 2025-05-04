module data_num_sr (
    input clk,
    input clken,
    input reset,
    input shend,
    input ser_in,
    output reg [4:0] q
);

    always @(posedge clk)
    begin
        if (reset)
            q <= 5'b00000;
        else if (clken) begin
            if (shend)
                q <= {q[0], q[1], q[2], q[3], ser_in};
        end
    end

endmodule