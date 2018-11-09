
key_left = keyboard_check(vk_left) || keyboard_check(ord("A")); // is left key being held
key_right = keyboard_check(vk_right)  || keyboard_check(ord("D"));; // is right being held
key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")); // is space pressed on this frame

canjump--;
if (hascontrol) {
	// Calcluate movement is either -1 0 or 1 for left nothing or right
	// IE if both pressed 0 otherwise -1 or 1
	var move = key_right - key_left;
	hsp = move * walksp;
	vsp = vsp + grv;

	// Jumping, if on a wall we can jump
	//if (place_meeting(x, y+1, oWall)) {
	if (canjump > 0) {
		if (key_jump) {
			vsp = vsp - jumpheight;
			canjump = 0;
		}
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


// Animation updates
// If not on the floor
// TODO this is not efficient because this was already done above
if (!place_meeting(x, y+1, oWall)) {
	sprite_index = sPlayerAir;
	image_speed = 0;
	if (sign(vsp) > 0) {
		image_index = 1;
	} else {
		image_index = 0;
	}
} else { // On the floor
	
	if (sprite_index == sPlayerAir) {
		repeat (5) {
			with (instance_create_layer(x, bbox_bottom, "Instances_Bullet", oDust)) {
				vsp = 0;
			}
		}
	}
	
	canjump = 10;
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sPlayer;
	} else {
		sprite_index = sPlayerRunning;
	}
}

// flip sprite the correct way
if (hsp != 0) {
	image_xscale = sign(hsp);
}
