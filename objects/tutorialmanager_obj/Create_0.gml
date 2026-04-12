movement = false;

interaction = false;

can_start = false;

item_id = "wabbit";

//--- PLACEHOLDER: TURN OFF MENU MUSIC ---

// play the tutorial sound
audio_play_sound(tutorial_tune, 10, true);

var init_dialog = instance_create_depth(0, 0, -9999, dialogcontroller_obj);

init_dialog.full_line = "Professor! Great to see you. Let's get you ready for your mission. Use WASD to move around, and E to interact with objects. Try it on me!"
init_dialog.options = [];
init_dialog.option_actions = [];

