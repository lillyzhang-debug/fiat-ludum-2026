if (global.countdown_on) {	
	// count down time here
	global.looptime_remaining -= (delta_time / 1000000); //delta_time in microseconds
	
	var curr_horizon = variable_clone(global.fx_horizon);
	layer_set_fx("fx_horizon", curr_horizon);
	if (global.looptime_remaining < 30 && global.looptime_remaining > 0) {	
		//layer_enable_fx("fx_horizon", true);
		layer_set_visible("fx_horizon", true);
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
		player_obj.y = 250;
		// call some function to reset timer gui too
	}
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
