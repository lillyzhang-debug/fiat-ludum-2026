if(keyboard_check_pressed(vk_enter)){
	room_goto(main_room); // try again
}

if(keyboard_check_pressed(vk_escape)) {
	room_goto(main_menu); // escape to main menu
}