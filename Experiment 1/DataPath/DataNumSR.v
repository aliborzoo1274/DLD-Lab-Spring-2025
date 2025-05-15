module data_num_sr (
    input clk,
    input clken,
    input reset,
    input shend,
    input ser_in,
    output reg [4:0] q
);

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 5'b00000;
        else if (clken) begin
            if (shend)
                q <= {q[3], q[2], q[1], q[0], ser_in};
        end
    end

endmodule