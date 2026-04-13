
//change run speed based off room & depth for accurate drawing
if (room == main_room) {
	player_spd = 2;
} else {
	player_spd = 1.5;
}

depth = -y;

// call movement script
if(!instance_exists(dialogcontroller_obj) && !audio_is_playing(Distorted_Voice_Coms)){
	player_moving = movement_scr(player_spd);
	
	if(player_moving) {
		if (!audio_is_playing(Footsteps)){
			audio_play_sound(Footsteps, 1, true);
		}
	} else {
		audio_stop_sound(Footsteps);
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
	audio_stop_sound(footsteps_snd);
}

// check win conditions
check_win_cond(coordfound, passfound, routed);

interaction_scr();