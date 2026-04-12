// on entering the gameover screen, reset the game statuses
global.gameover = false;

global.gamewon = false;


//--- PLACEHOLDER: TURN OFF GAME MUSIC ---

/*if(audio_exists(GAMESONG)) {
	audio_stop_sound(GAMESONG);
} */

// play the gameover song
audio_play_sound(gameover, 10, true);