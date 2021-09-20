module VTC(
    input                       pixel_clk,
    input                       reset_n,
    output      [9:0]           h_pos,
    output      [9:0]           v_pos,

    //////////// VGA //////////
	output		          		VGA_HS,
	output		          		VGA_VS
);

`include "parameters.vh"

reg [9:0] h_pos_val;
reg [9:0] v_pos_val;

// hsync and vsync are active low
reg hsync_val;
reg vsync_val;
 
always @(posedge pixel_clk, negedge reset_n)
    begin
        if (reset_n == 0)
            begin
                h_pos_val <= 10'd0;
                v_pos_val <= 10'd0;
                hsync_val <= 1'b1;
                vsync_val <= 1'b1;
            end
        else
            begin
                hsync_val <= (pre_hsync < h_pos_val < (pre_hsync + h_sync_pulse) ? 1'b0 : 1'b1);
                vsync_val <= (pre_vsync < v_pos_val < (pre_vsync + v_sync_pulse) ? 1'b0 : 1'b1);

                if (h_pos_val != h_whole_line)
                        h_pos_val <= h_pos_val + 1;
                else
                    begin
                        if (h_pos_val == h_whole_line)
                            begin
                                h_pos_val <= 10'd0;
                                // test is v is end of frame, if not incremenet, if set to 0
                                if (h_pos_val != h_whole_line)
                                    h_pos_val <= h_pos_val + 1;
                                else
                                    v_pos_val <= 10'd0;
                            end
                        else if (v_pos_val == v_whole_line)
                            begin
                                v_pos_val <= 10'd0;
                            end
                    end
            end
    end

assign VGA_HS = hsync_val;
assign VGA_VS = vsync_val;

assign h_pos = h_pos_val;
assign v_pos = v_pos_val;

// PG PG0(.KEY(KEY), .SW(SW), .h_pos(h_pos), .v_pos(v_pos));
 
endmodule