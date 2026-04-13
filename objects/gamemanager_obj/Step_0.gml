if (global.countdown_on && room == main_room) {	
	// count down time here
	global.looptime_remaining -= (delta_time / 1000000); //delta_time in microseconds
	
	if (floor(global.looptime_remaining) ==  50 && global.curr_gamestate == 1 ) {
		console_down = true;
		if(!audio_is_playing(NavShutdown)) {
			audio_play_sound(NavShutdown, 1, false);
		}
		
	}
	
	if (console_down) {
		var dialog_console_down = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
		dialog_console_down.full_line = "...?!";
		dialog_console_down.calling_char = "Professor Jeni";
		console_down = false;
	}
	
	var curr_horizon = global.fx_horizon;
	layer_set_fx("fx_horizon", curr_horizon);
	if (global.looptime_remaining < 30 && global.looptime_remaining > 0) {	
		//layer_enable_fx("fx_horizon", true);
		layer_set_visible("fx_horizon", true);
		layer_set_visible("screen_shake", true);
		fx_set_parameter(curr_horizon, "param_num_particles", 60 - 2*floor(global.looptime_remaining));
	} else if(global.looptime_remaining <= 0) {
		fx_set_parameter(curr_horizon, "param_num_particles",0);
		 layer_set_visible("fx_horizon", false);
		global.loop_counter += 1 ; 
		global.looptime_remaining = looptime;
		
		// call some function to reset player to start position
		player_obj.x = 320;
		player_obj.y = 200;
		//reset state progress back to 1, remove transciever from inventory
		global.curr_gamestate = 1;
		global.transciever_found = false;
		// call some function to reset timer gui too
		// play loop indicator
		if(!audio_is_playing(Loop)) {
			audio_play_sound(Loop, 1, false);
		}
		
		// destroy all dialog boxes if we're resetting
		instance_destroy(dialogcontroller_obj);
		
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
	
	if(intro_length <= 0 && room == cutscene_room) { // once the intro time is over, play the warning
		layer_set_visible("screen_shake", true);
		if(!audio_started) {
			if(!audio_is_playing(Distorted_Voice_Coms)) {
				audio_play_sound(Distorted_Voice_Coms, 1, false);
				audio_play_sound(Alarm, 3, true);
				instance_destroy(dialogcontroller_obj);
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
		jeni_talk.full_line = "What?! That's impossible! I should have been far enough away that- This is bad... Scylla X-37 is...";
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

if(dialog3_spawned && room == cutscene_room && !instance_exists(dialogcontroller_obj)) {
	var fade = instance_create_depth(0, 0, -9999, fadetoblack_obj);
	fade.on_complete = function() {
										room_goto(main_room);
									};
	fade.duration = 60;
	fade.pause = 20;
	fade.unfade = false;	
	
	audio_stop_sound(Alarm);
}

// intro dialog box for the introduction
if(!intro_dialog && room == cutscene_room) {
	var intro_msg = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
	intro_msg.full_line = "Day 47 of the Scylla X-37 survey expedition. Ship J-957 currently orbiting the nearby CX89 planet, awaiting further orders to continue survey."
	intro_msg.calling_char = "Professor Jeni";
	intro_dialog = true;
}
if(intro_dialog && !intro_dialog_2 && room == cutscene_room && !instance_exists(dialogcontroller_obj)) {
	var intro_msg = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
	intro_msg.full_line = "You should take a look around the cabin - not like there's much else to do. You remember Professor Luup's lesson back at the home base. INTERACT with objects using E, MOVE using WASD, and hit SPACE to speed up dialog. "
	intro_dialog_2 = true;
}

// after the first loop
if(global.loop_counter == 2 && global.looptime_remaining == 60 && !first_loop_dialog) {
	var dialog_first_loop = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
	dialog_first_loop.full_line = "Just as I thought... the gravity forces time to loop... Fascinating! Everything has returned to where it was a minute ago!";
	dialog_first_loop.calling_char = "Professor Jeni";
	first_loop_dialog = true;
}	

if(global.loop_counter == 3 && global.looptime_remaining == 60 && !first_loop_dialog) {
	var dialog_first_loop = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
	dialog_first_loop.full_line = "It seems my progress is RESET between loops... If I make it out alive, I've got to put this in my paper!";
	dialog_first_loop.calling_char = "Professor Jeni";
	second_loop_dialog = true;
}

// stupid stupid code design where i handle changing gamestate in here instead bc the foundation is chuzzed
if(global.transciever_found && global.curr_gamestate == 2) {
	global.curr_gamestate = 3;
}

	
if(global.loop_counter > 13 && !global.gameover) { // game over condition
	global.gameover = true;
	room_goto(gameover_room);
	show_debug_message("game over");
}

//check if win cond met OR if gameover
if(global.curr_gamestate >= 4 && !global.gamewon) {
	//end the game here, play win cutscene
	global.gamewon = true;
		audio_play_sound(PositiveNotification, 1, false);
		show_debug_message("game won!");
} 


if (global.gamewon) {
	layer_set_visible("screen_shake", true);
	if (keyboard_check_pressed(vk_space)) {
		//var fade = instance_create_depth(0, 0, -9999, fadetoblack_obj);
		//fade.on_complete = function() {
		//								room_goto(gamewon_room);
		//							};
		//fade.duration = 60;
		//fade.pause = 20;
		//fade.unfade = true;	
		room_goto(gamewon_room);
	}
}


