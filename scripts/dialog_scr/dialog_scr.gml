global.item_dialog = {
	console1: {
		state0: ["All systems are normal. The screen is quiet. "],
		state1: ["The screen reads: 'WARNING! EVENT HORIZON APPROACHED!'",  "It flashes an angry red."],
		state2: ["The screen reads: 'WARNING! EVENT HORIZON APPROACHED!'",  "It flashes an angry red."],
		state3: ["WHY AM I LOOKING AT THIS?!? I CAN SEE THE HORIZON *RIGHT* THERE!"]
	},
	
	// 0 for notfound, 1 for found 
	console2: {
		state0: ["The starmap of the surrounding stars twinkles green, the computer quietly humming beneath it. This console directly links to your TABLET, which you use in your experiments and for communications."],
		state1: [{
						text: "Examine the starmap?",
						options: ["Check", "Leave"],
						actions: [
									function() {								
										var fade = instance_create_depth(0, 0, -1000, fadetoblack_obj);
										fade.duration = 0; 
										fade.pause = 0;
										// read out dialog line after we fade
										fade.on_complete = function() {
											if(global.looptime_remaining >= 45){
												var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
												dialogcontroller.full_line = "The ship's coordinates are displayed in bright lettering at the bottom of the screen. You pull them from the console onto your TABLET. Now to get the TRANSCIEVER...";
												dialogcontroller.options = [];
												dialogcontroller.option_actions = [];
												if(!audio_is_playing(PositiveNotification)) {
													audio_play_sound(PositiveNotification, 1, false);
												}
											} else {
												var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
												dialogcontroller.full_line = "The screen is flashing red, parts of it flickering on and off. It seems the ship's proximity to the black hole has begun to destroy parts of the ship, starting with the computers.";
												dialogcontroller.options = [];
												dialogcontroller.option_actions = [];
												if(!audio_is_playing(NegativeNotification)) {
													audio_play_sound(NegativeNotification, 1, false);
												}
											}
										}
										
									},
									
									function() { // indicate you leave
										var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
										dialogcontroller.full_line = "You turn away from the screen.";
										dialogcontroller.options = [];
										dialogcontroller.option_actions = [];
									}
										
								]
						}],
		default_state: ["You've already found the coordinates."]
	},
	
	console3: {
		state0: ["The central console. Communications to Earth and other planets are sent through this screen using TRANSCIEVERS. There are several ports for each transciever on the ship."],
		state1: ["The local network seems to be down. The ship's coordinates from the starmap can't be accessed through this console."],
		state2: ["You need the Earth TRANSCIEVER to send your location back. Damn! Where did it go?!"],
		state3: ["Thirty seconds for transmission... I don't know if it'll make it.", "You squeeze your eyes shut, heart thumping in your chest as the TRANSCIEVER beeps steadily, transferring your location back home."]
	},
	
	photo: {
		default_state: ["Your most treasured possession..."]
	},
	
	plant: {
		state0: ["From top to bottom, the plants' names are Candy, Mandy, Randy... You were never the best at naming things."],
		default_state: ["In order to save your plants - you must persist!"]
	},
	
	cabinet1: {
		state0: ["The cabinet is full of rations and medkits. Astronaut ice cream... Yummy!"],
		state1: ["It's full of rations and medkits. Not very helpful. Unless you want to go out eating freeze dried ice cream."],
		state2: ["Not the best final meal."],
		state3: ["Why am I even looking in here?"]
	},
	
	cabinet2: {
		state0: ["A spacesuit, size women's L, is stored in the case, alongside a spare lab coat. There may or may not be a large coffee stain on the leg of the spacesuit."],
		state1: ["There is a toolkit tossed lazily on the floor of the cabinet. Unfortunately, the set of screwdrivers inside won't do much against a black hole."],
		state2: [{
						text: "Search for the transciever here?",
						options: ["Flip through the pockets of the suits", "Leave"],
						actions: [
									function() {								
										// fade the screen to black and decrement the timer by 15
						
										var fade = instance_create_depth(0, 0, -1000, fadetoblack_obj); 
										fade.pause = 60;
										// read out dialog line after we fade
										fade.on_complete = function() {
											var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
											dialogcontroller.full_line = "Unfortunately, all the pockets are empty. First time for everything.";
											dialogcontroller.options = [];
											dialogcontroller.option_actions = [];
											if(!audio_is_playing(NegativeNotification)) {
											audio_play_sound(NegativeNotification, 1, false);
										}
										}
										
									},
									
									function() { // indicate you leave
										var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
										dialogcontroller.full_line = "Surely you didn't leave it there.";
										dialogcontroller.options = [];
										dialogcontroller.option_actions = [];
									}
										
								]
						}],
		state3: ["Nothing in here."]
	},
	
	bed: {
		state0: ["Your bed. You didn't make it this morning. Or night. Or in general. The blankets are heaped on the mattress in an unseemly pile."],
		state1: ["As nice as crawling into bed sounds, you doubt it's the right course of action in this situation."],
		state2: [{
						text: "Search for the transciever here?",
						options: ["Rummage around in the sheets", "Leave"],
						actions: [
									function() {								
										// fade the screen to black and decrement the timer by 30
										// if there are not 15 seconds left, set the remaining time to 5
										var fade = instance_create_depth(0, 0, -1000, fadetoblack_obj);
										fade.pause = 60;
										// read out dialog line after we fade
										fade.on_complete = function() {
										
											var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
											dialogcontroller.full_line = "Where is it... AHA! Found it! I need to get this to the console.";
											dialogcontroller.options = [];
											dialogcontroller.option_actions = [];
											global.transciever_found = true;
											if(!audio_is_playing(PositiveNotification)) {
												audio_play_sound(PositiveNotification, 1, false);
											}
										}

									},
									
									function() { // indicate you leave
										var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
										dialogcontroller.full_line = "Let's look somewhere else.";
										dialogcontroller.options = [];
										dialogcontroller.option_actions = [];
									}
										
								]
						}],
		state3: ["This close to the finish?"]
	},
	
	vent: {
		state0: ["Just a vent."],
		state1: ["The vent rattles as you step on it."],
		default_state: [{
						text: "The vent cover is loose. Should you try to get the cover off?",
						options: ["Try to take the cover off", "Leave"],
						actions: [
									function() {								
										// fade the screen to black 
										var fade = instance_create_depth(0, 0, -1000, fadetoblack_obj);
										fade.pause = 60;
										// read out dialog line after we fade
										fade.on_complete = function() {
											if(global.looptime_remaining > 10){
												global.looptime_remaining -= 10;
											} 
											if(global.looptime_remaining < 6) {
												global.looptime_remaining = 6;
											}
											var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
											dialogcontroller.full_line = "You struggle with the lid for several moments, but the cover remains firmly on the vent.";
											dialogcontroller.options = [];
											dialogcontroller.option_actions = [];
											if(!audio_is_playing(NegativeNotification)) {
											audio_play_sound(NegativeNotification, 1, false);
										}
										}
										

									},
									
									function() { // indicate you leave
										var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
										dialogcontroller.full_line = "Just leave it alone.";
										dialogcontroller.options = [];
										dialogcontroller.option_actions = [];
									}
										
								]
						}]
	},
	
	chair: {
		state0: ["Your trusty pilot's seat. It's pretty comfortable."],
		state1: ["The chair you sit in during more normal situations. No time to sit now."],
		state2: ["Can't take a seat."],
		state3: ["Looking at this seems unhelpful."]
	},

	window: {
		state0: ["The stars wink at you. You wink back, as always."],
		state1: ["The vast expanse of space stares back at you. It's strangely comforting, despite the current situation."],
		state2: [{
						text: "Search for the transciever here?",
						options: ["Dig around in the cushions", "Leave"],
						actions: [
									function() {								
										// fade the screen to black and decrement the timer by 20
										// if there are not 15 seconds left, set the remaining time to 5
										var fade = instance_create_depth(0, 0, -1000, fadetoblack_obj);
										fade.pause = 0;
										// read out dialog line after we fade
										fade.on_complete = function() {
											var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
											dialogcontroller.full_line = "You find some food wrappers, a remote control, and an old notebook. But no transciever.";
											dialogcontroller.options = [];
											dialogcontroller.option_actions = [];
											if(!audio_is_playing(NegativeNotification)) {
											audio_play_sound(NegativeNotification, 1, false);
											}
										}
										

									},
									
									function() { // indicate you leave
										var dialogcontroller = instance_create_depth(0, 0, -9999, dialogcontroller_obj);
										dialogcontroller.full_line = "Maybe not now.";
										dialogcontroller.options = [];
										dialogcontroller.option_actions = [];
									}
										
								]
						}], // bc window covers the couch, you find tranciever key in the couch
		state3: ["Is this really the time for stargazing?"]
	},
	
	toolbox: {
		state0: ["Your toolbox sits on the ground, it's contents spilled all over. You were fixing the loose vent before you got distracted."],
		default_state: ["As you dash around the ship, you stub your toe on the metal box. Ouch!"]
	},
	
	oxygen: {
		state0: ["A few spare oxygen tanks sit on the steps. You should probably move them. At some point."],
		default_state: ["Oxygen will not be helpful within the black hole."]
	},
	
	labbench: {
		state0: ["A small lab bench used for short experiements that can be done in this small ship."],
		default_state: ["It's not the time to run any titrations."]
	},
	
	
	wabbit: {
		default_state: [{
							text: "Great work professor! You're an expert in INTERACTING now!. Head out the EXIT when you're ready. You can navigate through choices using the UP and DOWN buttons. Press ENTER to select your choice. Bon Voyage!",
							options: [],
							actions: []
						},
						
						/*
						{
							text: "Best of luck on your voyage!",
							options: ["Start game"],
							actions: [
										function() {
											// fade to black, move to main room
											
											var fade = instance_create_depth(0, 0, -9999, fadetoblack_obj); /// this fade doesn't work lmao
											
											room_goto_next();
										}
							]
						} */
						
						{
							text: "Best of luck on your expedition, Professor Jeni!",
							options: [],
							actions: []
						}
						]
	},
	
	desk: {
		default_state: ["The desk holds stacks of documents about the Scylla X-37 black hole that you are currently investigating. The computer is open to a simulation of the black hole."]
	},
	
	door: {
		default_state: [{
							text: "Are you ready to embark on your expedition? ",
							options: ["Yes", "No"],
							actions: [
								function() {
									var fade = instance_create_depth(0, 0, -9999, fadetoblack_obj);
									fade.on_complete = function() {
																		room_goto(cutscene_room);
																	};
									fade.duration = 80;
									fade.pause = 60;
									fade.unfade = false;
								},
								function() {
									//do nothing if we say no
								}
							]
		}]
	},
	
	bookshelf: {
		default_state: ["The bookshelf is full of texts about the Charybdis galaxy. Several of the papers on the shelves are ones you authored."]
	},
	
	map: {
		default_state: ["The map depicts the stars surrounding Scylla X-37 in the Charybdis galaxy. Recently, the cosmic rays emitted from these stars have been exhibiting abnormal readings." ]
	},
	
	deskchair: {
		default_state: ["Your trusty desk chair. You'll be leaving it behind on your survey of Scylla X-37."]
	}
		
}
	