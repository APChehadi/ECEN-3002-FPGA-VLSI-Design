module PG(
    //////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// SW //////////
	input 		     [9:0]		SW,

    input                      pixel_clk,
    input      [9:0]           h_pos,
    input      [9:0]           v_pos,

    //////////// VGA //////////
	output		     [7:0]		VGA_R,
	output		     [7:0]		VGA_G,
	output		     [7:0]		VGA_B
);

`include "parameters.vh"
 
reg [7:0] red_vector;
reg [7:0] blue_vector;
reg [7:0] green_vector;

always @(posedge pixel_clk, negedge KEY[3], SW[0])
    begin
        // Within visible area
        if ((0.25 * h_visible_area) < h_pos < (0.5 * h_visible_area))
            begin
                if(SW[0] == 1)
                    begin
                        red_vector <= 8'b0;
                        blue_vector <= 8'b11111111;
                        green_vector <= 8'b0;
                    end
                else
                    begin
                        red_vector <= 8'b11111111;
                        blue_vector <= 8'b0;
                        green_vector <= 8'b0;
                    end
            end
        if ((0.75 * h_visible_area) < h_pos < h_visible_area)
            begin
                if(SW[0] == 1)
                    begin
                        red_vector <= 8'b11111111;
                        blue_vector <= 8'b0;
                        green_vector <= 8'b0;
                    end
                else
                    begin
                        red_vector <= 8'b0;
                        blue_vector <= 8'b11111111;
                        green_vector <= 8'b0;
                    end
            end
    end

assign VGA_R = red_vector;
assign VGA_G = blue_vector;
assign VGA_B = green_vector;
 
endmodule