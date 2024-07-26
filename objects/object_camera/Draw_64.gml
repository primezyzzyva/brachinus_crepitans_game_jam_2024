/// @description Insert description here
// You can write your code in this editor

if (indicate_camera)
{
	draw_set_font(font_big);
	draw_set_halign(fa_left);
    draw_text(x, y, "CAMERA_MODE_IS_ON");
	show_debug_message("x: {0}, y: {1}", x, y);
}