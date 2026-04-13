if (global.countdown_on && room == main_room) {	
	// count down time here
	global.looptime_remaining -= (delta_time / 1000000); //delta_time in microseconds
	
	var curr_horizon = global.fx_horizon;
	layer_set_fx("fx_horizon", curr_horizon);
	if (global.looptime_remaining < 30 && global.looptime_remaining > 0) {	
		//layer_enable_fx("fx_horizon", true);
		layer_set_visible("fx_horizon", true);
		layer_set_visible("screen_shake", true);
		fx_set_parameter(curr_horizon, "param_num_particles", 60 - 2*floor(global.looptime_remaining));
	} else if(global.looptime_remaining <= 0) {
		//layer_enable_fx("fx_horizon", false);
		//layer_clear_fx("fx_horizon");
		//curr_horizon = variable_clone(global.fx_horizon);
		fx_set_parameter(curr_horizon, "param_num_particles",0);
		 layer_set_visible("fx_horizon", false);
		global.loop_counter += 1 ; 
		global.looptime_remaining = looptime;
		
		// call some function to reset player to start position
		player_obj.x = 320;
		player_obj.y = 200;
		// call some function to reset timer gui too
	}
}
// here is the intro instrucitons
else {
	if(dialog_frame < 3) {
		dialog_frame += 0.2;
	} else {
		dialog_frame = 0;
	}
	
	intro_length -= (delta_time / 1000000); //delta_time in microseconds
	
	if(intro_length <= 0) { // once the intro time is over, play the warning
		layer_set_visible("screen_shake", true);
		if(!audio_started) {
			if(!audio_is_playing(Distorted_Voice_Coms)) {
				audio_play_sound(Distorted_Voice_Coms, 1, false);
				audio_started = true;
			}

		}
	}
	if (audio_started && !message_played) {
		if(!audio_is_playing(Distorted_Voice_Coms)){
			message_played = true;
		}
	}
	
	if(message_played && !dialog_spawned) {
		var jeni_talk = instance_create_depth(0, 0 , -9999, dialogcontroller_obj);
		jeni_talk.calling_char = "Professor Jeni";
		jeni_talk.full_line = "What?! That's impossble! I should have been far enough away that-";
		dialog_spawned = true;
	}
	
}

if(audio_started && message_played && dialog_spawned && !dialog2_spawned && !instance_exists(dialogcontroller_obj)) {
	var exposition = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
	exposition.full_line = "Scylla X-37 is a special black hole, known for its abnormal 'looping' effects on time. However, a black hole is a black hole. If you enter the event horizon, you will surely die... ";
	dialog2_spawned = true;
}

if(dialog2_spawned && !dialog3_spawned && !instance_exists(dialogcontroller_obj)) {
	var exposition = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
	exposition.full_line = "The only way out is to communicate your location to home base. If you can send your coordinates to Earth in time, the ship can be intercepted.";
	dialog3_spawned = true;
}

if(dialog3_spawned && room != main_room && !instance_exists(dialogcontroller_obj)) {
	var fade = instance_create_depth(0, 0, -9999, fadetoblack_obj);
	fade.on_complete = function() {
										room_goto(main_room);
									};
	fade.duration = 60;
	fade.pause = 20;
	fade.unfade = false;	
}

if(global.loop_counter > 13) { // game over condition
	global.gameover = true;
	show_debug_message("game over");
}

//check if win cond met OR if gameover
if(global.gamewon) {
	//end the game here, play win cutscene
} 

if (global.gameover) {
	// play lose cutscene
	show_debug_message("go to menu here");
	room_goto(gameover_room);
}
