switch (current_credit) {
	case "Alyssa" :
		draw_text(430, 140, "Alyssa Wong");
		draw_text(430, 160, "Programming - Gameplay Design");
		break;
	case "Lilly" :
		draw_text(430, 130, "Lilly Zhang");
		draw_text(430, 150, "Programming - Music - Writing & Narrative");
		draw_text(430, 170, "'Title Theme', 'Tutorial Theme', 'Game Over'");
		break;
	case "Phoenix" :
		draw_text(430, 140, "Phoenix He");
		draw_text(430, 160, "Artwork - Environment Design");
		break;
	case "Shania" :
		draw_text(430, 120, "Shania Jin");
		draw_text(430, 140, "Artwork - Character Design");
		draw_text(430, 160, "Music - Sound Design ");
		draw_text(430, 180, "'Introduction', 'Main Theme', 'Credits'");
		break;
	case "Thanks" :
		draw_text(430, 140, "And thank you, dear player, for playing!");
		draw_text(430, 180, "-Professor Jeni and Professor Luup");
		break;
	case "Back" :
		draw_text(430, 160, "Press ENTER to return to the Main Menu");
		break;
}
show_debug_message(current_credit);