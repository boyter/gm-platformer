if (done == 0) {
	vsp = vsp + grv;

	// Horizontal Collision
	if (place_meeting(x+hsp, y, oWall)) {
		// Get as close to the wall as possible
		while (!place_meeting(x+sign(hsp), y, oWall)) {
			x = x + sign(hsp);
		}

		hsp = 0;
	}

	// Vertical Collision
	if (place_meeting(x, y+vsp, oWall)) {
		
		if (vsp > 0) {
			done = 1;
			image_index = 1;
		}
		
		// Get as close to the wall as possible
		while (!place_meeting(x, y+sign(vsp), oWall)) {
			y = y + sign(vsp);
		}

		vsp = 0;
	}

	// Set new position
	x = x + hsp;
	y = y + vsp;
}