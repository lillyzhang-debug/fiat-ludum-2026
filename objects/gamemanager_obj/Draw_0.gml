//draw timer here
draw_set_colour(c_white);
draw_set_font(default_font);
draw_text(15, 30, global.looptime_remaining);


draw_text(5, 320, global.loop_counter);
draw_circular_timer(35,40,global.looptime_remaining,60,c_orange,35,1,10);