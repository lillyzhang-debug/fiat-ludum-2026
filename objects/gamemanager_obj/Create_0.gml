// Keep track of loops, increment after each loop over
loopcount = 0; //game ends at 13

// time taken per loop, countdown time
looptime = 60;
global.looptime_remaining = looptime;
global.loop_counter = 1;

//activate/deactivate game 
// true for now, will be initially set to false later so the cutscene can be played
global.countdown_on = true;

audio_stop_sound(tutorial_tune); // turn off sound from tutorial

// --- PLACEHOLDE: TURN ON MAIN GAME SONG ---
global.fx_horizon = layer_get_fx("fx_horizon");
//layer_enable_fx("fx_horizon", false);
layer_set_visible("fx_horizon", false);