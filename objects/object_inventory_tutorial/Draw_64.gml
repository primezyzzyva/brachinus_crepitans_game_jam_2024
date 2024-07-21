/// @description Insert description here
// You can write your code in this editor

// https://www.youtube.com/watch?v=qiz-wt7Mb9g


if (is_showing_inventory)
{
	var item_number_half = inventory._max_inventory_items / 2;
		
	var xx = display_get_gui_width() / 2 - (sprite_width_padding * floor(item_number_half));
	var yy = display_get_gui_height() / 2;
	
	for (var i = 0; i < inventory._max_inventory_items; i++)
	{
		draw_sprite(sprite_inventory_background, 0, xx + (sprite_width_padding * i), yy);
	}

	var _items = inventory.getAll();
	for (var i = 0; i < array_length(_items); i++)
	{
		// draw sprite
		draw_sprite(_items[i].sprite, 0, xx + (sprite_width_padding * i), yy);
		
		// hovering
		if (_items[i].hover)
		{
			draw_set_color(c_white);
			draw_rectangle(xx + (sprite_width_padding * i), yy, xx + (sprite_width_padding * i) + (2 * offset), yy + (2 * offset), true);
		}
		
		//draw text
		draw_set_halign(fa_center); // fa = font alignment
		draw_text_ext_transformed
		(
			xx + (sprite_width_padding * i) + offset,
			yy + (sprite_width_padding / 2) +  + offset,
			_items[i].name,
			24, 50, 0.5, 0.5, 15
		);
	}
}