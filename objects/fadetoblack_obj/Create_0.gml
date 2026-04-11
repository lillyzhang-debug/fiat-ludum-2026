//length of fade
duration = 60; // about 1 sec
// length of full black
pause = 60; 
fade_alpha = 0;

fade_speed = 1/duration;

// container to run code after fade
if(!variable_instance_exists(id, "on_complete")) {
	on_complete = undefined;
}


