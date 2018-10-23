/// @description Setup Camera

cam = view_camera[0];
follow = oPlayer;

// Get half the width and height of the camera
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;

// Where the thing we are following is about to move to
xTo = xstart; // Returns the original x and y position, x and y would work here 
yTo = ystart;

// Shake the screen
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 64;