/// @description Insert description here
// Draw GUI means locked to camera so always visible

draw_set_font(fMenu);

// must run this every time to ensure it is set for this drawing
draw_set_alpha(fa_right); // Font alignment
draw_set_valign(fa_bottom);

// var means temp variable
for (var i = 0; i < menu_items; i++) {
	var offset = 2;
	var txt = menu[i];
	var col;
	
	if (menu_cursor == i) {
		txt = string_insert("> ", txt, 0);
		col = c_white;
	} else {
		col = c_gray;
	}
	
	var xx = menu_x;
	var yy = menu_y - (menu_item_height * (i * 1.5));
	
	// draw a background shadow
	draw_set_color(c_black);
	draw_text(xx-offset, yy, txt);
	draw_text(xx+offset, yy, txt);
	draw_text(xx, yy-offset, txt);
	draw_text(xx, yy+offset, txt);
	
	draw_set_color(col);
	draw_text(xx, yy, txt);
}