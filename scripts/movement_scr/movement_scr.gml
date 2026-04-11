function movement_scr(_speed) {
	    // Y-Axis 
	if (keyboard_check(ord("W"))) {
	    y -= _speed; // Up is minus
		direction = 90;
	}
	else if (keyboard_check(ord("S"))) {
	    y += _speed; // Down is plus
		direction = 270;
	}

	// X-Axis 
	else if (keyboard_check(ord("A"))) {
	    x -= _speed; // Left is minus
		direction = 180;
	}
	else if (keyboard_check(ord("D"))) {
	    x += _speed; // Right is plus
		direction = 0;
	}
}

function movement_animation(moving) {
	if(moving) {
		switch(direction) {
			case 0: //right
				player_obj.sprite_index = player_spr_r;
				break;
			case 90: // up
				player_obj.sprite_index = player_spr_up;
				break;
			case 180: // left
				player_obj.sprite_index = player_spr_l;
				break;
			case 270: //down
				player_obj.sprite_index = player_spr_dn;
				break;
		}
	} else {
		player_obj.sprite_index = player_spr;
		switch(direction) {
			case 0: //right
				player_obj.image_index = 3;
				break;
			case 90: // up
				player_obj.image_index = 1;
				break;
			case 180: // left
				player_obj.image_index = 2;
				break;
			case 270: //down
				player_obj.image_index = 0;
				break;
		}
	}
}
		