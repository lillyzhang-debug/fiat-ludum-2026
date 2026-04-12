// Keep track of loops, increment after each loop over
loopcount = 0; //game ends at 13

// time taken per loop, countdown time
looptime = 60;
global.looptime_remaining = looptime;
global.loop_counter = 1;


//check if win cond met OR if gameover
if(global.gamewon) {
	//end the game here, play win cutscene
} else if (global.gameover) {
	// play lose cutscene
}

audio_stop_sound(tutorial_tune); // turn off sound from tutorial

// --- PLACEHOLDE: TURN ON MAIN GAME SONG ---
