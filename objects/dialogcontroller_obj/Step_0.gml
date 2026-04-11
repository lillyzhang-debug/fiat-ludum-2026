
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
	// do nothing now, could add smth here later
}
	
