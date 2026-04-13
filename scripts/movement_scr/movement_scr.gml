function movement_scr(_speed) {
	var y_spd = 0;
	var x_spd = 0;
	    // Y-Axis 
	if (keyboard_check(ord("W"))) {
	    y_spd -= _speed; // Up is minus
		direction = 90;
	}
	if (keyboard_check(ord("S"))) {
	    y_spd += _speed; // Down is plus
		direction = 270;
	}

	// X-Axis 
	if (keyboard_check(ord("A"))) {
	    x_spd -= _speed; // Left is minus
		direction = 180;
	}
	if (keyboard_check(ord("D"))) {
	    x_spd += _speed; // Right is plus
		direction = 0;
	}
	
	if (x_spd != 0 || y_spd != 0) {
		collision_tilemap = layer_tilemap_get_id("collision_map");
		var collision_array = [collision_tilemap, obj_solid];
		move_and_collide(x_spd, y_spd, collision_array);
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
		