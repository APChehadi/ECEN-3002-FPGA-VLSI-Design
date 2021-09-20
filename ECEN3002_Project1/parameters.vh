// Horizontal Timing
parameter h_visible_area = 640;
parameter h_front_porch = 16;
parameter h_sync_pulse = 96;
parameter h_back_porch = 48;
parameter h_whole_line = 800;
parameter pre_hsync = h_visible_area + h_front_porch;

// Vertical Timing
parameter v_visible_area = 480;
parameter v_front_porch = 10;
parameter v_sync_pulse = 2;
parameter v_back_porch = 33;
parameter v_whole_line = 525;
parameter pre_vsync = v_visible_area + v_front_porch;