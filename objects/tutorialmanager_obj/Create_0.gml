movement = false;

interaction = false;

can_start = false;

item_id = "wabbit";

//--- PLACEHOLDER: TURN OFF MENU MUSIC OR GAMEOVER MUSIC ---
if(audio_exists(gameover)) {
	audio_stop_sound(gameover);
} 

// play the tutorial sound
audio_play_sound(tutorial_tune, 10, true);

var init_dialog = instance_create_depth(0, 0, -9999, dialogcontroller_obj);

init_dialog.full_line = "Professor! Great to see you. Let's get you ready for your mission. Use WASD to move around, Space to click through dialog, and E to interact with objects. Go ahead and try it out!"
init_dialog.options = [];
init_dialog.option_actions = [];
init_dialog.calling_char = "Professor Luup";

