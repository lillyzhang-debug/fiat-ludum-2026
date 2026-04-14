function gamestatus_scr(){
	// placeholder alarm obj var
	strobe_obj = noone;
	
	// check current room 
	if(room == main_room) {
		global.strobe_on = true;
	} else if (room == cutscene_room && audio_is_playing(Alarm)){
		global.strobe_on = true;
		global.strobe_spd = 4;
		global.strobe_alpha = .3;
		if(!instance_exists(alarmstrobe_obj)) {
				var alarm_obj = instance_create_depth(0, 0, -9999, alarmstrobe_obj);
				alarm_obj.strobe_max_alpha = global.strobe_alpha;
				alarm_obj.strobe_speed = global.strobe_spd
		}
		
	} else {
		global.strobe_on = false;
		instance_destroy(alarmstrobe_obj);
	}
	
	//
	switch(global.loop_counter) {
		case 1:
		case 2:
		case 3:
			// set strobe to normal settings
			global.strobe_spd = 1;
			global.strobe_alpha = .1;
			
			break;
		case 4:
		case 5:
		case 6:
			// set strobe to next level of intensity
			global.strobe_spd = 2;
			global.strobe_alpha = .2;
			break;
		case 7:
		case 8:
		case 9:
			// set strobe to next level of intensity
			global.strobe_spd = 3;
			global.strobe_alpha = .25;
			break;
		case 10:
		case 11:
		case 12:
		case 13:
			// max intensity
			global.strobe_spd = 4;
			global.strobe_alpha = .4;
			break;
		default:
			// 
			break;
			// game over
	}
	
	if(!instance_exists(alarmstrobe_obj) && global.strobe_on) {
		strobe_obj = instance_create_depth(0, 0, -9999, alarmstrobe_obj);
	}
	if (instance_exists(strobe_obj)) {
	  	strobe_obj.strobe_max_alpha = global.strobe_alpha;
		strobe_obj.strobe_speed = global.strobe_spd;
	}
	
	// ensure the alarm strobe objs destroyed if the alarm is turned off
	if(!global.strobe_on) {
		instance_destroy(alarmstrobe_obj);
	}
}

// run in player
function check_win_cond(cond1, cond2, cond3){
	if (cond1 && cond2 && cond3) {
		global.gamewon = true;
	}
}



