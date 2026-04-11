// call movement script
if(!instance_exists(dialogcontroller_obj)){
	movement_scr(player_spd);
	
	if(xprevious != x || yprevious != y) {
		player_moving = true;
	} else {
		player_moving = false;
	}
	
	movement_animation(player_moving);
}

// check win conditions
check_win_cond(coordfound, passfound, routed);

// check if player has interacted with anything
var interact_key = keyboard_check_pressed(ord("E"));

if (interact_key) {
	// check for interaction at the place the player is standing at
	var touched_item = instance_place(x, y, interactable_obj);
	
	if(touched_item != noone) {
		var target_id = touched_item.item_id;
		
		var current_state = 0;
		var line_index = 0; //default to simple dialog line 
		
		// set current game state string based off the current state
		switch (global.curr_gamestate) {
			case 1:
				current_state = "state1";
				break;
			case 2:
				current_state = "state2";
				break;
			case 3:
				current_state = "state3";
				break;
		}
		
		// pull the specific entry for the selected item
		var item_struct = global.item_dialog[$ target_id];
	
		// check if the item has a struct entry for the current state
		if(variable_struct_exists(item_struct, current_state))
			var dialog_array = item_struct[$ current_state];
		else // if not, then just use the default line
			dialog_array = item_struct.default_state;
			
		// for interactables with secrets, set the line_index to 1 if the secret has been found
		// note that coordfound may be the wrong thing to check for (in general win conds, depends on
		// how these are set
		if(target_id == "console2" && global.looptime_remaining > 50) {
			coordfound = true;
			line_index = 1; //
		} else if (target_id == "console3" && passfound) {
			line_index = 1;
		}
		
		if (line_index >= array_length(dialog_array)) {
            line_index = 0; 
        }
		
		var current_line = dialog_array[line_index];
		
		var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
		
		dialogcontroller.full_line = current_line;

	}
}