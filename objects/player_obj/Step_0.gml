// call movement script
if(!instance_exists(dialogcontroller_obj)){
	movement_scr(player_spd);
	
	if(xprevious != x || yprevious != y) {
		player_moving = true;
	} else {
		player_moving = false;
	}
	
	movement_animation(player_moving);
} else {
	sprite_index = player_spr;
	switch(direction) {
			case 0: //right
				image_index = 3;
				break;
			case 90: // up
				image_index = 1;
				break;
			case 180: // left
				image_index = 2;
				break;
			case 270: //down
				image_index = 0;
				break;
		}
}
// check win conditions
check_win_cond(coordfound, passfound, routed);

interaction_scr();