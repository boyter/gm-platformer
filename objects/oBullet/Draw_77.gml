// Done in post draw so it hits the wall before dissapearing
if (place_meeting(x, y, oWall)) {
	instance_destroy();
}