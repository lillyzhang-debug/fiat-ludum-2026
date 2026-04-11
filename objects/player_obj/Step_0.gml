// call movement script
movement_scr(player_spd);

// check if player has interacted with anything
var interact_key = keyboard_check_pressed(ord("E"));

if (interact_key) {
	// check for interaction at the place the player is standing at
	var touched_item = instance_place(x, y, obj_interactable);
	
	if(touched_item != noone) {
		var target_id = touched_item.item_id;
		
		var current_state = 0;
		
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
			
		// for specifically console 1 and 2, check if we have found the required item to get the correct dialog
		//if(target_id ==
	}
}