/// @description Insert description here
// You can write your code in this editor

// https://www.youtube.com/watch?v=qiz-wt7Mb9g

if (keyboard_check_released(ord(global.inventory1)) or (keyboard_check_released(ord(global.inventory2))))
{
	is_showing_inventory = !is_showing_inventory
	
	if(!is_showing_inventory)
	{
		inventory.deselect();
	}
}

if (is_showing_inventory)
{
	if (mouse_check_button_released(mb_left))
	{
		var mx = device_mouse_x_to_gui(0);
		var my = device_mouse_y_to_gui(0);

		var width_half = display_get_gui_width() / 2;
		var item_number_half = inventory._max_inventory_items / 2;
		
		var column_start = width_half - (sprite_width_padding * floor(item_number_half));
		var column_stop = width_half + (sprite_width_padding * floor(item_number_half));

		var _items = inventory.getAll();
		for (var i = 0; i < array_length(_items); i++)
		{
			if (mx > column_start + (i * sprite_width_padding))
			{
				if (mx < column_start + (i * sprite_width_padding + (2 * offset)))
				{
					if (_items[i].hover)
					{
						instance_create_depth(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), depth - 1, object_item_used_text_tutorial)
						inventory.remove(i);
					}
					else
					{
						inventory.select(i);
					}
				}
			}
		}
	}
}

