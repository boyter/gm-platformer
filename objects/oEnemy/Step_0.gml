vsp = vsp + grv;

// Horizontal Collision
if (place_meeting(x+hsp, y, oWall)) {
	// Get as close to the wall as possible
	while (!place_meeting(x+sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}

	hsp = -hsp;
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


// Animation updates
// If not on the floor
// TODO this is not efficient because this was already done above
if (!place_meeting(x, y+1, oWall)) {
	sprite_index = sEnemyAir;
	image_speed = 0;
	if (sign(vsp) > 0) {
		image_index = 1;
	} else {
		image_index = 0;
	}
} else {
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sEnemy;
	} else {
		sprite_index = sEnemyRunning;
	}
	
	if (random_range(0, 10) == 5) {
		vsp = vsp - jumpheight;
	}
}

// flip sprite the correct way
if (hsp != 0) {
	image_xscale = sign(hsp);
}