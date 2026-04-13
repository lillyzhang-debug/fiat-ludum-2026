// on entering the gameover screen, reset the game statuses
global.gameover = false;

global.gamewon = false;

// how long we will make people watch credits
watch_this_long = 25;
// counts up
credits_roll = 0;


//music
if(!audio_is_playing(Credits_Theme)) {
	audio_play_sound(Credits_Theme, 1, true);
}

current_credit = "";

// center all lines of text
draw_set_halign(fa_center);

