// count down time here
global.looptime_remaining -= (delta_time / 1000000); //delta_time in microseconds

if(global.looptime_remaining <= 0) {
	global.loop_counter += 1 ; 
	global.looptime_remaining = looptime;
	
	// call some function to reset player to start position
	player_obj.x = 320;
	player_obj.y = 300;
	// call some function to reset timer gui too
}
	


