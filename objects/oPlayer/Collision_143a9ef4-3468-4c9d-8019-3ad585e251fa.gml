/// @description Die!

with (oGun) {
	instance_destroy();
}

// True for this means the create event is triggered
instance_change(oPlayerDead, true);