/// @description Insert description here
// You can write your code in this editor

draw_self();  //Ensure that the sprite still gets drawn

// prompt the player when close to the object
if (distance_to_object(object_brachinus_crepitans) < 48)
{
	
	
	// draw a background rectangle so the text will be visible in all biomes
	draw_set_colour(c_gray);
	draw_rectangle(x + (_max_width_of_dialog / 2), y - (hh / 2) - _max_height_of_dialog, x - (_max_width_of_dialog / 2), y - (hh / 2), false);
	
	// draw the text
	draw_reset();
	draw_set_font(font_big);
	draw_set_halign(fa_left);
    draw_text_ext(x - (_max_width_of_dialog / 2) + _dialog_padding, y - (hh / 2) - _max_height_of_dialog + _dialog_padding, dialog_message, _dialog_padding + string_height(dialog_message), _max_width_of_dialog - (2 * _dialog_padding));
	
}

