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
			gameover = true;
			break;
			// game over
	}
}

// run in player
function checkWinCond(cond1, cond2, cond3){
	if (cond1 && cond2 && cond3) {
		global.gamewon = true;
	}
}