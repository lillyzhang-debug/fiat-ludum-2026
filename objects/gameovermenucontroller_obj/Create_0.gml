// on entering the gameover screen, reset the game statuses
global.gameover = false;

global.gamewon = false;

global.loop_counter = 1;


//--- PLACEHOLDER: TURN OFF GAME MUSIC ---

if(audio_exists(atgravitysedge)) {
	audio_stop_sound(atgravitysedge);
} 

// play the gameover song
if(!audio_is_playing(gameover)) {
	audio_play_sound(gameover, 10, true);
}