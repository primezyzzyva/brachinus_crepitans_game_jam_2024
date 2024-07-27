/// @description Insert description here
// You can write your code in this editor

if (is_showing_inventory)
{
	var gui_width = display_get_gui_width();
	var gui_height = display_get_gui_height();

	// shadow
	draw_set(c_black, 0.2);
	draw_rectangle(ui_padding_x + ui_border_size, ui_padding_y + ui_border_size, gui_width - ui_padding_x + ui_border_size,
				   gui_height - ui_padding_y + ui_border_size, false);

	// full rectangle
	draw_set(color_border, 1);
	draw_rectangle(ui_padding_x, ui_padding_y, gui_width - ui_padding_x, gui_height - ui_padding_y, false);

	// inner rectangle
	draw_set(color_background,0.62);
	draw_rectangle(ui_padding_x + ui_border_size, ui_padding_y + ui_border_size, gui_width - ui_padding_x - ui_border_size,
				   gui_height - ui_padding_y - ui_border_size, false);

	// horizontal line
	draw_set(color_border, 1);
	draw_rectangle(ui_padding_x + ui_panel_left, ui_padding_y + ui_border_size, ui_padding_x + ui_panel_left +
					ui_border_size, gui_height - ui_padding_y - ui_border_size, false);

	// font
	draw_set_font(font_inventory_tutorial);
	text_align(fa_left, fa_top);

	// text shadow
	draw_set(c_teal, 0.15);
	draw_text(ui_padding_x + (ui_border_size * 3) + 4, ui_padding_y + (ui_border_size * 4) + 4, "Recipes");

	// text 
	draw_set(c_navy, 1);
	draw_text(ui_padding_x + (ui_border_size * 3), ui_padding_y + (ui_border_size * 4), "Recipes");

	// boxes
	var inventory_items = inventory.item_get();
	for (var row = 0; row < inventory_rows; row++)
	{
		var position_y = ui_padding_y + (ui_border_size * 13) + (row * (ui_inventory_margin + ui_inventory_box));
	
		for (var column = 0; column < inventory_columns; column++)
		{
			var position_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
		
			// draw box shadow
			draw_sprite_ext(sprite_inventory_background, 0, position_x + 4, position_y + 4, 1, 1, 0, c_black, 0.4);
		
			// draw box shadow
			draw_sprite_ext(sprite_inventory_background, 0, position_x, position_y, 1, 1, 0, c_grey, 1);
	
			var inventory_index = (row * inventory_columns) + column;
		
			if (inventory_index <= array_length(inventory_items) - 1)
			{
				draw_sprite(inventory_items[inventory_index].sprite, 0, position_x, position_y);
			}
		
			if (inventory_index <= array_length(inventory_items) - 1)
			{
				// quantity circle
				draw_set(#232323, 1);
				draw_circle(position_x + ui_inventory_box - 10, position_y + ui_inventory_box - 10, 14, false);
		
				draw_set(c_white, 1);
				text_align(fa_center, fa_middle);
				draw_set_font(-1);
				
				// quantity text
				draw_text(position_x + ui_inventory_box - 10, position_y + ui_inventory_box - 10, inventory_items[inventory_index].quantity);
			}
		}
	}
	
	// recipe time
	var _recipes = inventory.recipe_get();
	var pos_x = ui_padding_x + (ui_border_size *  3) + 4;

	for (var recipe_index = 0; recipe_index < array_length(_recipes); recipe_index++)
	{
		var pos_y = ui_padding_y + (ui_border_size * 13) + (recipe_index * (ui_inventory_margin + ui_inventory_box));
	
		draw_sprite(sprite_inventory_recipe_box, 0, pos_x, pos_y);
		draw_sprite(_recipes[recipe_index].sprite, 0, pos_x, pos_y);
		show_debug_message("x: {0}, y: {1}", pos_x, pos_y);
	}
	
	// forgive me, for things are about to get "clever"
	if (keyboard_check_released(vk_left) or keyboard_check_released(ord(global.left1)) or keyboard_check_released(ord(global.left2)))
	{
		if (current_item > 0)
		{
			current_item--;
		}
		else
		{
			current_item = array_length(inventory_items) - 1;
		}
	}
				
	if (keyboard_check_released(vk_right) or keyboard_check_released(ord(global.right1)) or keyboard_check_released(ord(global.right2)))
	{
		if (current_item < array_length(inventory_items) - 1)
		{
			current_item++;
		}
		else
		{
			current_item = 0;
		}
	}
				
	if (keyboard_check_released(vk_up) or keyboard_check_released(ord(global.up1)) or keyboard_check_released(ord(global.up2)))
	{
		if (floor(current_item / inventory_columns) == 0)
		{
			adjust = current_item + (floor((array_length(inventory_items) - 1) / inventory_columns) * inventory_columns);
			
			if ((adjust) < array_length(inventory_items))
			{
				current_item = adjust;
			}
		}
		else
		{
			current_item -= inventory_columns;
		}
	}
					
	if (keyboard_check_released(vk_down) or keyboard_check_released(ord(global.down1)) or keyboard_check_released(ord(global.down2)))
	{
		if (floor(current_item / inventory_columns) == floor((array_length(inventory_items)) / inventory_columns))
		{
			adjust = current_item - (floor((array_length(inventory_items) - 1) / inventory_columns) * inventory_columns);
			
			if (adjust < array_length(inventory_items) and adjust >= 0)
			{
				current_item = adjust;
			}
		}
		else
		{
			if (current_item + inventory_columns < array_length(inventory_items))
			{
				current_item += inventory_columns;
			}
		}
	}

	highlight_row = floor(current_item / inventory_columns);
	highlight_column =  current_item % inventory_columns;
	
	// draw "hovering over" box
	draw_set(color_highlight, 0.1);
	var highlight_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (highlight_column * (ui_inventory_margin + ui_inventory_box));
	var highlight_y = ui_padding_y + (ui_border_size * 13) + (highlight_row * (ui_inventory_margin + ui_inventory_box));
	draw_rectangle(highlight_x, highlight_y, highlight_x + ui_inventory_box, highlight_y + ui_inventory_box, false);
	draw_reset();
	
	for (var i = 0; i < array_length(selected); i++)
	{
		selected_row = floor(selected[i] / inventory_columns);
		selected_column =  selected[i] % inventory_columns;
				
		draw_set(c_black, 1);
		var selected_x = ui_padding_x * 1.5 + ui_panel_left + ui_border_size + ui_inventory_padding + (selected_column * (ui_inventory_margin + ui_inventory_box));
		var selected_y = ui_padding_y * 1.5 + (ui_border_size * 13) + (selected_row * (ui_inventory_margin + ui_inventory_box));
	
		draw_set_font(font_big);
		text_align(fa_center, fa_middle);
		draw_text(selected_x,  selected_y, i + 1);
	}
	
	if (keyboard_check_released(ord(global.interact)))
	{
		var item_index = array_get_index(selected, current_item)
		if (item_index == -1 and array_length(selected) < 5)
		{
			array_push(selected, current_item);
		}
		else
		{
			if (-1 != array_get_index(selected, current_item))
			{
				array_delete(selected, item_index, 1);
			}
		}
	}
	else
	{
		var ui_text = "";
		
		if (array_length(selected) < 5)
		{
			ui_text = string("Inventory - Pres '{0}' to (de)select", global.interact);
		}
		else
		{
			ui_text = string("Inventory - Press '{0}' to craft; '{1}' to deselect", global.craft, global.interact);
		}
		
		draw_set_font(font_inventory_tutorial);
		text_align(fa_left, fa_top);
		
		// text shadow
		draw_set(c_teal, 0.15);
		draw_text(ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
					ui_padding_y + (ui_border_size * 4) + 4, ui_text);

		// text 
		draw_set(c_navy, 1);
		draw_text(ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
					ui_padding_y + (ui_border_size * 4), ui_text);
	}
	
	if (keyboard_check_released(ord(global.craft)))
	{
		if (array_length(selected) == 5)
		{
			for (var i = 0; i < array_length(selected); i++)
			{
				inventory.item_subtract(inventory_items[selected[i]].name, 1);
			}
			
			instance_create_depth(ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
									  ui_padding_y * 1.5 + (ui_border_size * 4) + 4, depth - 1, object_item_used_text_tutorial);
		
			selected = [];
		}
		
	}
}



