if (hp <= 0) {
	with (instance_create_layer(x, y, layer, oDead)) {
		image_xscale = other.size;
		image_yscale = other.size;
	}
	instance_destroy()
}