// call movement script
depth = -y;
if(!instance_exists(dialogcontroller_obj) && !audio_is_playing(Distorted_Voice_Coms)){
	player_moving = movement_scr(player_spd);
	
	if(player_moving) {
		if (!audio_is_playing(footsteps_snd)){
			audio_play_sound(footsteps_snd, 1, true);
		}
	} else {
		audio_stop_sound(footsteps_snd);
	}
			
	movement_animation(player_moving);
} else {
	sprite_index = player_spr;
	switch(direction) {
			case 0: //right
				image_index = 3;
				break;
			case 90: // up
				image_index = 1;
				break;
			case 180: // left
				image_index = 2;
				break;
			case 270: //down
				image_index = 0;
				break;
		}
}

// have Jeni face forward while the comms are playing
if(audio_is_playing(Distorted_Voice_Coms)) {
	image_index = 0;
}

// check win conditions
check_win_cond(coordfound, passfound, routed);

interaction_scr();