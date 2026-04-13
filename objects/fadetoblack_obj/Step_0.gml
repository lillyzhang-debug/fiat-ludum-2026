if(duration > 0) {
	duration -= 1;
	fade_alpha += fade_speed;

	if (fade_alpha > 1) {
		fade_alpha = 1;
	}
} else {
	//fade over, hold for pause time
	if(pause > 0) {
		//hold
		pause -= 1;
	}
	
	else if(unfade == true) { // can choose not to fade back to scene
		if(fade_alpha > 0 && pause <= 0) {
			fade_alpha -= fade_speed;
		} 
	} else {
		if(on_complete != undefined) {
			on_complete();
			on_complete = undefined;
		}
		instance_destroy();
	}
}