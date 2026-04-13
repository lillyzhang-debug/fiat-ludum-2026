// restart game
if(credits_roll >= watch_this_long) {
	if(keyboard_check_pressed(vk_enter)) {
		//audio_stop_sound(gameover);
		credits_roll = 0;
		game_restart(); // escape to main menu
	}
} 

credits_roll += (delta_time / 1000000); 

if(credits_roll >=0 && credits_roll < 5) {
	current_credit = "Alyssa";
} else if (credits_roll >= 5 && credits_roll < 10) {
	current_credit = "Lilly";
} else if (credits_roll >= 10 && credits_roll < 15) {
	current_credit = "Phoenix";
} else if (credits_roll >= 15 && credits_roll < 20) {
	current_credit = "Shania";
} else if (credits_roll >= 20 && credits_roll < 25) {
	current_credit = "Thanks";
} else {
	current_credit = "Back";
}

