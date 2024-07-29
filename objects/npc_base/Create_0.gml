/// @description Insert description here
// You can write your code in this editor

// grab the size of the window
_window_width = window_get_width();
_window_height = window_get_height();
// capture the width and height of the sprite's collision box
ww = sprite_get_bbox_left(sprite_index) - sprite_get_bbox_right(sprite_index);
hh = sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index);
// relative to the size of the window set the size of the dialog
_max_width_of_dialog = _window_width * 0.35;
_max_height_of_dialog = _window_height * 0.2;
// set the padding for the text within the rectangle
_dialog_padding = _max_height_of_dialog * 0.1;

// npc dialog loaded
dialog_loaded = false;
dialog_message = string("");