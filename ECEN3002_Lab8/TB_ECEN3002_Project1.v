`timescale 1 ns / 100 ps

module TB_ECEN3002_Project1();

    reg     clock;
    reg     [3:0]   KEY;
    reg     [9:0]   SW;

    //////////// VGA //////////
	wire		          		VGA_BLANK_N;
	wire		          		VGA_CLK;
	wire		          		VGA_SYNC_N;
	wire		          		VGA_HS;
	wire		          		VGA_VS;
	wire		     [7:0]		VGA_R;
	wire		     [7:0]		VGA_G;
	wire		     [7:0]		VGA_B;

    ECEN3002_Project1 U0 (.CLOCK2_50(clock), .KEY(KEY), .SW(SW), .VGA_BLANK_N(VGA_BLANK_N), .VGA_CLK(VGA_CLK), .VGA_SYNC_N(VGA_SYNC_N), .VGA_HS(VGA_HS), .VGA_VS(VGA_VS), .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B));

    initial
        begin
            $display("Starting simulation");
            clock = 1'b0;
            KEY[3:0] = 4'b0000;
            SW[1:0] = 2'b00;
            #2500 KEY[3:0] = 4'b1001;
            #10000 SW[1:0] = 2'b01;
            #10000 KEY[3] = 1'b0;
            #10000 $stop;
        end 

    always
        #10 clock = ~clock;

endmodule