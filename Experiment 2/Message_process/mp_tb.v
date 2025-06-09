`timescale 1ns/1ns

module mp_tb;
    reg clk;
    reg rst;
    reg send;
    reg [4:0] msg;

    wire ser_out;

    top_module_mp uut (
        .clk(clk),
        .rst(rst),
        .send(send),
        .msg(msg),
        .ser_out(ser_out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        rst = 1;
        send = 0;
        msg = 5'b10011;

        #20;
        rst = 0;
        send = 1;

        #100;
        send = 0;
        
        #200000
        $stop;
    end

endmodule