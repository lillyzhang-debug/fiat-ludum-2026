if (keyboard_check_pressed(vk_enter)) { // move to the actual game once player presses "start"
	audio_stop_sound(titletheme);
	room_goto_next();
}