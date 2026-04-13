//draw timer here if the main room has started
if(global.countdown_on){
	draw_set_colour(c_white);
	draw_set_font(default_font);
	draw_text(15, 30, global.looptime_remaining);


	draw_text(5, 300, global.loop_counter);

	draw_circular_timer(35,40,global.looptime_remaining,60,c_orange,35,1,10);
}

draw_text(5, 150, "TEMP: STATE" + string(global.curr_gamestate));

if(intro_length <= 0 && audio_is_playing(Distorted_Voice_Coms)) {
	draw_sprite(commsdialog_spr, dialog_frame, 320, 280);
}