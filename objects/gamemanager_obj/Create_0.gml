// Keep track of loops, increment after each loop over
loopcount = 0; //game ends at 13

// time taken per loop, countdown time
looptime = 60;
global.looptime_remaining = looptime;
global.loop_counter = 1;

// intro length, give player this amount of time to explore the cabin before playing the comms
intro_length = 10;
audio_started = false;
message_played = false;
dialog_spawned = false;
dialog2_spawned = false;
dialog3_spawned = false;

// hold frame of comms dialog box
dialog_frame = 0;

// activate/deactivate game countdown and current gamestate
// based off room
if(room == main_room) {
	global.countdown_on = true;
	// start the game
	global.curr_gamestate = 1;
} else {
	global.countdown_on = false;
	// keep room normal
	global.curr_gamestate = 0;
}

audio_stop_sound(tutorial_tune); // turn off sound from tutorial

// --- TURN ON MAIN GAME SONG ---
if(!audio_is_playing(atgravitysedge)) {
	audio_play_sound(atgravitysedge, 1, true);
}
global.fx_horizon = layer_get_fx("fx_horizon");
//layer_enable_fx("fx_horizon", false);
layer_set_visible("fx_horizon", false);
