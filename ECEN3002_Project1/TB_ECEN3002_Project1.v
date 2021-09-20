`timescale 1 ns / 100 ps

module TB_ECEN3002_Project1();

    reg     clock;
    reg     [3:0]   KEY;
    reg     [9:0]   SW;
    wire    [9:0]   LEDR;

    ECEN3002_Project1 U0 (.CLOCK2_50(clock), .KEY(KEY), .SW(SW));

    initial
        begin
            $display("Starting simulation");
            clock = 1'b0;
            KEY[1:0] = 2'b00;
            SW[1:0] = 2'b00;
            #2500 KEY[0] = 1'b1;
            #10000 SW[1:0] = 2'b00;
            #2500 KEY[1] = 1'b0;
            #10000 $stop;
        end 

    always
        #5 clock = ~clock;

    

endmodule