// draw dialog box underneath
draw_sprite(dialogbox_spr, 0, 40, 240);

// draw text on top
draw_set_colour(c_white);
draw_set_font(default_font);

// set text max width and line spacing
var line_spacing = 15;
var line_width = 500
	
draw_text_ext(70, 260, displayed_line, line_spacing, line_width);