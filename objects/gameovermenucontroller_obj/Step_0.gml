if(keyboard_check_pressed(vk_enter)){
	audio_stop_sound(gameover);
	room_goto(main_room); // try again
}

if(keyboard_check_pressed(vk_escape)) {
	audio_stop_sound(gameover);
	game_restart();
}