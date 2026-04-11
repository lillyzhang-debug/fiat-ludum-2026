global.item_dialog = {
	console1: {
		state1: ["The screen reads: ‘WARNING! EVENT HORIZON APPROACHED!’",  "It flashes an angry red."],
		state2: ["The screen reads: ‘WARNING! EVENT HORIZON APPROACHED!’",  "It flashes an angry red."],
		state3: ["WHY AM I LOOKING AT THIS?!? I CAN SEE THE HORIZON *RIGHT* THERE!"]
	},
	
	// 0 for notfound, 1 for found 
	console2: {
		state1: ["The screen flashes red, the image of the map broken and glitchy. You can't read the coordinates that usually appear on the bottom of the screen.",
						"The screen glows green, the map displaying your current coordinates. You take note of the numbers. "],
		default_state: ["You've already found the coordinates."]
	},
	
	console3: {
		state1: ["It's locked. Now where did you put the password?"],
		state2: ["I need to access the router to send this message back to Earth…. Where is that password?!", "Found it! Let me enter the password..."],
		state3: ["I just need to send the message."]
	},
	
	photo: {
		default_state: ["Your most treasured possession..."]
	},
	
	cabinet1: {
		state1: ["It’s full of rations and medkits. Not very helpful. Unless you want to go out eating freeze dried ice cream."],
		state2: ["I’m not hungry."],
		state3: ["Why am I even looking in here?"]
	},
	
	cabinet2: {
		state1: ["Two spacesuits, size women’s L, are stored in the closet, alongside a spare lab coat.", "There is a toolkit on the floor of the cabinet."],
		state2: ["Should I change clothes?"],
		state3: ["Do I *want* to die?"]
	},
	
	bed: {
		state1: ["If you lay down, you die."],
		state2: ["Maybe it would be more comfortable for when you go."],
		state3: ["I want to lie down."]
	},
	
	vent: {
		state1: ["The vent rattles as you step on it."],
		default_state: [{
						text: "The vent cover is loose. Should you try to get the cover off?",
						options: ["Try to take the cover off", "Leave"],
						actions: [
									function() {//play animation for x amount of time
										var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
										dialogcontroller.full_line = "You struggle with the lid for several moments, but the cover remains firmly on the vent.";
										dialogcontroller.options = [];
										dialogcontroller.option_action = [];
									},
									function() { // indicate you leave
										var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
										dialogcontroller.full_line = "Time better used doing something else.";
										dialogcontroller.options = [];
										dialogcontroller.option_action = [];
									}
										
								]
						}]
	},
	
	chair: {
		state1: ["The chair you sit in during more normal situations. No time to sit now."],
		state2: ["Ugh, move out of the way!"],
		state3: ["You shove the chair to the side."]
	},

	window: {
		state1: ["The vast expanse of space stares back at you.",  "It’s strangely comforting, despite the current situation."],
		state2: ["The vast expanse of space is not comforting anymore.", "The windows rattle as the overwhelming force of the black hole pulls the pod into its grasp."],
		state3: ["You squeeze your eyes shut as the whole vessel shakes and rattles.", "You can’t bring yourself to open your eyes."]
	}
	
}
	