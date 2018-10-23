/// @description Progress the transition

if (mode != TRANS_MODE.OFF) {
	if (mode == TRANS_MODE.INTRO) {
		// simple easiest transition 
		// percent = max(0, percent - 0.05);

		// Transition with easing
		// reduce it by 10 percent each time starts fast then slows
		// hence the max 0.05 so it never gets too small 
		percent = max(0, percent - max((percent/10), 0.005));
		
		
	} else {
		// simple easiest transition
		// percent = min(1, percent + 0.05);
		
		// 10% of the distance left to go
		percent = min(1.1, percent + max((1.1-percent)/10, 0.005));
	}

	if (percent == 0 || percent == 1.1) {
		switch (mode) {
			case TRANS_MODE.INTRO: {
				mode = TRANS_MODE.OFF;
				break;
			}
			case TRANS_MODE.NEXT: {
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO: {
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
			}
			case TRANS_MODE.RESTART: {
				game_restart();
				break;
			}
		}
	}
}
