/// @description Insert description here
// You can write your code in this editor

draw_self();  //Ensure that the sprite still gets drawn

// prompt the player when close to the object
if (distance_to_object(object_brachinus_crepitans) < 48)
{
	var _window_width = window_get_width();
	var _window_height = window_get_height();
	var _sprite_middle = x;
	// capture the width and height of the sprite's collision box
	var ww, hh;
	ww = sprite_get_bbox_left(sprite_index) - sprite_get_bbox_right(sprite_index);
	hh = sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index);
	var _max_width_of_dialog = _window_width * 0.25;
	var _max_height_of_dialog = _window_height * 0.125;
	// padding for the text within the rectangle
	var _dialog_padding = _max_height_of_dialog * 0.1;
	
	// algorithm for breaking up a string into segments which fit within a specific width on screen
	var _string_to_parse = string("This is a really really long string of text. My gosh, it's so long, I really cannot begin to emphasize just how long this is. It is so long that this is the third sentence.");
	var _string_array = string_split(_string_to_parse, " ");
	var _total_parsed_characters = 0;
	var _parsed_index = 0;
	var _final_parsed_list = [];
	draw_reset();
	draw_set_font(font_big);
	//while (string_length(_string_to_parse) >= _total_parsed_characters) {
		// starting at the parsed index, add the word to the list to the temp string
		// measure the length of the temp string
		// if length of temp string exceeds allowed width, append a newline character and add the previous temp list to the final parsed list
		// if length of temp string does not exceed allowed width, add new line increment parsed_index
		
	//}
	
	// draw a background rectangle so the text will be visible in all biomes
	//draw_healthbar(x - (sprite_width / 3), y - 1 * (sprite_height / 100), x + (sprite_width * 1.5), y - (sprite_height * 0.25), 100, c_gray, c_gray, c_gray, 0, false, true);
	draw_set_colour(c_gray);
	//draw_rectangle(_sprite_middle - (_max_width_of_dialog / 2), y - _max_height_of_dialog, _sprite_middle + (_max_width_of_dialog / 2), y, false); 
	draw_rectangle(x + (_max_width_of_dialog / 2), y - (hh / 2) - _max_height_of_dialog, x - (_max_width_of_dialog / 2), y - (hh / 2), false);
	
	// draw the text
	draw_reset();
	draw_set_font(font_big);
	draw_set_halign(fa_left);
    draw_text(x - (_max_width_of_dialog / 2) + _dialog_padding, y - (hh / 2) - _max_height_of_dialog + _dialog_padding, string("Press '{0}' \nto interact", global.interact));
	
}

