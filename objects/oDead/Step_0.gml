if (done == 1) {
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