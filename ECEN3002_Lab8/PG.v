module PG(
    //////////// KEY //////////
	input 		         [3:0]		KEY,

	//////////// SW //////////
	input 		         [9:0]		SW,

    input                           pixel_clk,
    input                           position_toggle_latch,
    input                [9:0]      h_pos,
    input                [9:0]      v_pos,

    input                [23:0]     q,
    output               [5:0]      address
);

`include "parameters.vh"

reg [5:0] address_val;
reg [5:0] address_val_1;

// Horizontal always block
always @(*)
    if (h_pos < 80)
        begin
            address_val = 6'b0;
        end
    else if (h_pos < 160)
        begin
            address_val = 6'b001000;
        end
    else if (h_pos < 240)
        begin
            address_val = 6'b010000;
        end
    else if (h_pos < 320)
        begin
            address_val = 6'b011000;
        end
    else if (h_pos < 400)
        begin
            address_val = 6'b100000;
        end
    else if (h_pos < 480)
        begin
            address_val = 6'b101000;
        end
    else if (h_pos < 560)
        begin
            address_val = 6'b110000;
        end
    else if (h_pos < 640)
        begin
            address_val = 6'b111000;
        end

// Vertical always block
always @(*)
    if (v_pos < 60)
        begin
            address_val_1 = 56;
        end
    else if (v_pos < 120)
        begin
            address_val_1 = 48;
        end
    else if (v_pos < 180)
        begin
            address_val_1 = 40;
        end
    else if (v_pos < 240)
        begin
            address_val_1 = 32;
        end
    else if (v_pos < 300)
        begin
            address_val_1 = 24;
        end
    else if (v_pos < 360)
        begin
            address_val_1 = 16;
        end
    else if (v_pos < 420)
        begin
            address_val_1 = 8;
        end
    else if (v_pos < 480)
        begin
            address_val_1 = 0;
        end

assign address = address_val[5:0] + address_val_1;
 
endmodule