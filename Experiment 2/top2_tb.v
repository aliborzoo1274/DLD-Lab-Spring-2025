`timescale 1ns/1ns

module top2_tb;
    reg clk;
    reg rst;
    reg mode;
    reg init;
    reg [2:0] cnt;
    reg send;
    reg [4:0] msg;

    wire out;

    top2 uut (
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .init(init),
        .cnt(cnt),
        .send(send),
        .msg(msg),
        .out(out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        rst = 1;
        init = 0;
        send = 0;
        mode = 0;
        msg = 5'b10011;
        cnt = 3'b000;

        #100;
        rst = 0;

        #100;
        init = 1;

        #100;
        init = 0;

        #100;
        send = 1;
        
        #30000000

        mode = 1;

        #100;
        init = 1;

        #100;
        init = 0;

        #100;
        send = 1;
        
        #30000000


        $stop;
    end

endmodule