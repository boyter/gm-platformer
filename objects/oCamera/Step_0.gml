/// @description Update Camera

// Update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// Update camera/object position
x += (xTo - x) / 25; // move to the new position but 1/25 of it each time so it is smoother moving
y += (yTo - y) / 25;

// Ensure we keep the camera inside the confines of the room
x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

// Shake the screen
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));

// Update camera view
// minus the half position so the player is in the middle
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);