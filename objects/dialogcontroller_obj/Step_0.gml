
if(keyboard_check_pressed(vk_space)) { // skip to end of dialog, or if at end, close the dialog box
	if(char_index < string_length(full_line)) {
		char_index = string_length(full_line);
		displayed_line = full_line;
	} else {
		instance_destroy();
	}
}
	
if(char_index < string_length(full_line)) {
	// increase char counter
	char_index += text_speed;
		
	//copy the current length of full_line into displayed text
	displayed_line = string_copy(full_line, 1, floor(char_index));
		
} else {
	if(array_length(options) > 0) {
		if(keyboard_check_pressed(vk_down)){
			current_selection -= 1;
		}
		if(keyboard_check_pressed(vk_up)) {
			current_selection += 1;
		}
		
		// Keep the selection cursor from going out of bounds!
        // This makes it wrap around to the top/bottom smoothly.
        if (current_selection < 0) {
            current_selection = array_length(options) - 1;
        } else if (current_selection >= array_length(options)) {
            current_selection = 0;
        }
		
		if(keyboard_check_pressed(vk_enter)) {
			var chosen_action = option_actions[current_selection];
			chosen_action();
			instance_destroy();
		}
	}
		
}
	
