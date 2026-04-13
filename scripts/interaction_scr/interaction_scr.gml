function interaction_scr(){
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
				case 0:
					current_state = "state0";
					break;
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
			else { // if not, then just use the default line
				// 1. First, make sure we actually found an object to interact with!
				if (item_struct != noone) {
    
				    // 2. Ask GameMaker: "Does this specific object actually have dialogue?"
				    if (variable_instance_exists(item_struct, "default_state")) {
        
				        // 3. It is safe! Read the array.
				        dialog_array = item_struct.default_state;
        
				    } else {
				        // This stops the crash if you accidentally talk to a wall or empty space!
				        show_debug_message("ERROR: This object has no default_state!");
				    }
				}

			}
			
			// for interactables with secrets, set the line_index to 1 if the secret has been found
			// note that coordfound may be the wrong thing to check for (in general win conds, depends on
			// how these are set
			if(target_id == "console2" && global.looptime_remaining > 45) {
				coordfound = true;
				if (global.curr_gamestate == 1) {
					global.curr_gamestate = 2;
					//maybe have dialogue abt like ...where do i put these .... something to direct the player
				}
				line_index = 1; //
			
			} /*else if (target_id == "window" && global.curr_gamestate == 2 && global.transciever_found) {
					global.curr_gamestate++; // move to next state after earth transciever found
			}*/ else if (target_id == "console3" && global.curr_gamestate == 3 && global.looptime_remaining >= 30) {
				global.curr_gamestate = 4; // player has won atp
				line_index = 1;
			} else if (target_id == "wabbit" && !tutorial_done) {
				line_index = 0;	
				tutorialmanager_obj.interaction = true;
				tutorialmanager_obj.movement = true;
			} else if (target_id == "wabbit" && tutorial_done) {
				line_index = 1;
			}
		
			// check for invalid indicies
			if (line_index >= array_length(dialog_array)) {
	            line_index = 0; 
	        }
		
			var current_line = dialog_array[line_index];
			
			// if theres already a dialog box open, don't open another
			if(!instance_exists(dialogcontroller_obj)) {
				var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
			
				// sort item into plain flavor text or an option
				if(is_string(current_line)) {
					dialogcontroller.full_line = current_line;
					dialogcontroller.options = [];
					dialogcontroller.option_actions = [];
				} 
				if(is_struct(current_line)) {
					dialogcontroller.full_line = current_line.text
					dialogcontroller.options = current_line.options;
					dialogcontroller.option_actions = current_line.actions;
				}
				
				// specific case for the tutorial rabbit
				if(target_id == "wabbit") {
					dialogcontroller.calling_char = "Professor Luup";
				}
				// might be bad, but i might just have to straight up hardcode each instance where the protag is directly speaking
			}
		}
	}
}
