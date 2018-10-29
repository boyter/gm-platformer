/// @description Insert description here
// You can write your code in this editor

var half_w = w / 2;
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_color(x - half_w - border, y - h - border - border, x + half_w + border, y, 15, 15, false);
draw_sprite(sMarker, 0, x, y);

// reset
draw_set_alpha(1);

// Draw text
DrawSetText(c_white, fSign, fa_center, fa_top);
draw_text(x, y - h - border, text_current);