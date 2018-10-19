x = oPlayer.x;
y = oPlayer.y+10;

// Point the object at the mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

firingdelay = max(0, firingdelay - 1);
recoil = max(0, recoil - 1);
if (mouse_check_button(mb_left) && firingdelay == 0) {
	recoil = 4;
	firingdelay = 10;
	with (instance_create_layer(x, y, "Instances_Bullet", oBullet)) {
		speed = 25;
		// Other refers to the object not the bullet we just made
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}

// recoil
x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);