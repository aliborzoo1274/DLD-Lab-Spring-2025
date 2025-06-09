`timescale 1ns/1ns

module top1_tb;
    reg clk;
    reg rst;
    reg mode;
    reg init;
    reg [2:0] cnt1;
    reg [2:0] cnt2;
    reg send;
    reg [4:0] msg;

    wire [7:0] to_pwm;

    top1 uut (
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .init(init),
        .cnt1(cnt1),
        .cnt2(cnt2),
        .send(send),
        .msg(msg),
        .to_pwm(to_pwm)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        rst = 1;
        init = 0;
        send = 0;
        mode = 0;
        msg = 5'b10011;
        cnt1 = 3'b000;
        cnt2 = 3'b000;

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