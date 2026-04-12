if (global.countdown_on) {	
	// count down time here
	global.looptime_remaining -= (delta_time / 1000000); //delta_time in microseconds

	if(global.looptime_remaining <= 0) {
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
