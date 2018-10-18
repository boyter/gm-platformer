key_left = keyboard_check(vk_left); // is left key being held
key_right = keyboard_check(vk_right); // is right being held
key_jump = keyboard_check_pressed(vk_space); // is space pressed on this frame

// Calcluate movement is either -1 0 or 1 for left nothing or right
// IE if both pressed 0 otherwise -1 or 1
var move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grv;

// Jumping, if on a wall we can jump
if (place_meeting(x, y+1, oWall)) {
	if (key_jump) {
		vsp = vsp - jumpheight;
	}
}

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