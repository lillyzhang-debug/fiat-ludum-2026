// draw dialog box underneath
draw_sprite(dialogbox_spr, 0, 40, 220);

// draw text on top
draw_set_colour(c_white);
draw_set_font(default_font);

// set text max width and line spacing
var line_spacing = 15;
var line_width = 500
	
draw_text_ext(70, 240, displayed_line, line_spacing, line_width);

// draw options after main text is done 
if(char_index >= string_length(full_line) && array_length(options) > 0) {
	var option_height = 260;
	var prefix = "";
	
	for (var i = 0; i < array_length(options); i++) {
		if(i == current_selection) {
			draw_set_colour(c_yellow);
			prefix = ">";
		} else {
			draw_set_colour(c_white);
			prefix = "  ";        // Blank space so text aligns properly
        }
        
        // Draw the option line, pushing it down by 20 pixels for every new option
        var current_y = option_height + (i * 20);
        draw_text(100, current_y, prefix + options[i]);
	}
}
	