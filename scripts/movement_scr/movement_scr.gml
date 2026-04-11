function movement_scr(_speed) {
	var y_spd = 0;
	var x_spd = 0;
	    // Y-Axis 
	if (keyboard_check(ord("W")) && place_meeting(x, y - _speed, spaceship_obj)) {
	    y_spd -= _speed; // Up is minus
		direction = 90;
	}
	else if (keyboard_check(ord("S")) && place_meeting(x, y + _speed, spaceship_obj)) {
	    y_spd += _speed; // Down is plus
		direction = 270;
	}

	// X-Axis 
	else if (keyboard_check(ord("A")) && place_meeting(x  - _speed, y, spaceship_obj)) {
	    x_spd -= _speed; // Left is minus
		direction = 180;
	}
	else if (keyboard_check(ord("D")) && place_meeting(x + _speed, y, spaceship_obj)) {
	    x_spd += _speed; // Right is plus
		direction = 0;
	}
	
	if (x_spd != 0 || y_spd != 0) {
		collision_tilemap = layer_tilemap_get_id("collision_map");
		move_and_collide(x_spd, y_spd, collision_tilemap);
		return true;
	}
	
	// not moving
	return false;
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
		