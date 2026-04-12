if(movement && interaction) {
	//tutorial finished, give player the option to start the game
	can_start = true;
}

if (can_start) {
	player_obj.tutorial_done = true;
}

if(instance_exists(dialogcontroller_obj)) {
	image_speed = 1;	
} else {
	image_speed = 0;
	image_index = 0;
}