function gamestatus_scr(){
	switch(loopstatus) {
		case 0:
		case 1:
		case 2:
			// loop status normal, do normal stuff here
			break;
		case 3:
		case 4:
		case 5:
		case 6:
			// loop status weirder, go to next lv of intensity
			break;
		case 7:
		case 8:
		case 9:
			// loop status weird, next lv of intensity
			break;
		case 10:
		case 11:
		case 12:
			// final status, weirdest
			break;
		default:
			global.gameover = true;
			break;
			// game over
	}
}

// run in player
function check_win_cond(cond1, cond2, cond3){
	if (cond1 && cond2 && cond3) {
		global.gamewon = true;
	}
}

function game_win_or_lose(){
	if(global.gamewon == true) {
		win();
		// play win cutscene, show player end credits
	} else if (global.gameover) {
		
		//play lose cutscene, give player option to replay
	}
}

function win() {
	draw_rectangle(0, 0, 640, 320, false);
	draw_text(250, 160,"You Win!");
}

function lose() {
	draw_text(250, 160,"You Lose!");
}