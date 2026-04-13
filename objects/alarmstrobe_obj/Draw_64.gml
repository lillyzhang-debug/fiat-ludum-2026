// 1. Calculate the current transparency
// dsin() creates a wave from -1 to 1. 
// abs() turns negative numbers positive, so it bounces perfectly from 0 to 1!
var _current_alpha = abs(dsin(strobe_timer)) * strobe_max_alpha;

// 2. Set the draw settings (The Sandwich Method!)
draw_set_alpha(_current_alpha);
draw_set_color(c_red);

// 3. Draw a rectangle over the entire screen
// display_get_gui_width/height ensures it covers the screen no matter the resolution
var _w = display_get_gui_width();
var _h = display_get_gui_height();
draw_rectangle(0, 0, _w, _h, false);

// 4. IMMEDIATELY reset your draw settings!
draw_set_alpha(1);
draw_set_color(c_white);