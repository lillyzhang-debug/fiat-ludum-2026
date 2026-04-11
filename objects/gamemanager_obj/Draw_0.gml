//draw timer here
draw_set_colour(c_white);
draw_set_font(default_font);
draw_text(5, 0, global.looptime_remaining);

draw_text(5, 320, global.loop_counter);