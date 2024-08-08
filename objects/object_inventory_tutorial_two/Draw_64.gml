/// @description Insert description here
// You can write your code in this editor

if (is_showing_inventory)
{
	var gui_width = display_get_gui_width();
	var gui_height = display_get_gui_height();

	// draw the inventory UI and the ingredients
	{
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

		// vertical line
		draw_set(color_border, 1);
		draw_rectangle(ui_padding_x + ui_panel_left, ui_padding_y + ui_border_size, ui_padding_x + ui_panel_left +
						ui_border_size, gui_height - ui_padding_y - ui_border_size, false);

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
		
				// draw sprite
				if (inventory_index <= array_length(inventory_items) - 1)
				{
					draw_sprite_ext(inventory_items[inventory_index].sprite, 0, position_x + (ui_inventory_box * 0.45), position_y + (ui_inventory_box * 0.55),
									sprite_get_width(sprite_inventory_background) / sprite_get_width(inventory_items[inventory_index].sprite) - 0.10,
									sprite_get_height(sprite_inventory_background) / sprite_get_height(inventory_items[inventory_index].sprite) - 0.10, 0,
									c_white, 1);
				}
		
				if (inventory_index <= array_length(inventory_items) - 1)
				{
					// quantity circle
					draw_set(#232323, 1);
					draw_circle(position_x + ui_inventory_box - 5, position_y + ui_inventory_box - 5, 10, false);
		
					draw_set(c_white, 1);
					text_align(fa_center, fa_middle);
					draw_set_font(-1);
				
					// quantity text
					draw_text(position_x + ui_inventory_box - 5, position_y + ui_inventory_box - 5, inventory_items[inventory_index].quantity);
				}
			}
		}
	}
	
	// draw the recipes and tabs
	{
		// draw recipe tabs
		var tab_y = (ui_border_size * 13) + 0.65 * ui_inventory_box;
		for (var tab_index = 0; tab_index < number_of_tabs; tab_index++)
		{
			var tab_x =  ui_padding_x + (ui_border_size *  3) + 4 + (64 * tab_index);
			draw_sprite_ext(sprite_recipe_tab, 0, tab_x + 3, tab_y + 3, 48 / 64, 16 / 16, 0, c_grey, 1);
		}

		// clear out the recipe tab if the tab is changed
		//if (choose_recipe and (
		//	(keyboard_check_released(vk_left) or keyboard_check_released(ord(global.left1)) or keyboard_check_released(ord(global.left2))) or
		//	(keyboard_check_released(vk_right) or keyboard_check_released(ord(global.right1)) or keyboard_check_released(ord(global.right2)))))
		//{
		if (tab_when_recipes_collected != current_tab)
		{
			recipes_in_tab = [];
		}
	
		// fill up the recipe tab
		if (array_length(recipes_in_tab) == 0)
		{
			for (var recipe_index = 0; recipe_index < array_length(_recipes); recipe_index++)
			{
				if (_recipes[recipe_index].tab == current_tab)
				{
					array_push(recipes_in_tab, _recipes[recipe_index]);
				}
			}
		
			tab_when_recipes_collected = current_tab;
		}
	
		// draw recipes	
		var pos_x = ui_padding_x + (ui_border_size *  3) + 4;
		for (var recipe_index = 0; recipe_index < array_length(recipes_in_tab); recipe_index++)
		{
			var pos_y = ui_padding_y + (ui_border_size * 13) + (recipe_index * (ui_inventory_margin + 0.50 * ui_inventory_box));
	
			// draw recipe box
			draw_sprite_ext(sprite_inventory_recipe_box, 0, pos_x + 3, pos_y + 3, 282 / 288, 36 / 64, 0, c_grey, 1);
			draw_sprite_ext(recipes_in_tab[recipe_index].sprite, 0, pos_x + 8, pos_y + 16,
							20 / sprite_get_width(recipes_in_tab[recipe_index].sprite),
							20 / sprite_get_height(recipes_in_tab[recipe_index].sprite), 0, c_white, 1);
			draw_set_halign(fa_left);
			draw_text(pos_x + 56, pos_y + 10, recipes_in_tab[recipe_index].name);
		
			draw_set_halign(fa_right);
			draw_set_font(font_inventory_small);
			if (inventory.recipe_has((recipes_in_tab[recipe_index].name)))
			{
				draw_text_transformed_color(pos_x + 282, pos_y + 33, "Craftable", 0.75, 0.75, 0, #02360f, #02360f, #02360f, #02360f , 1);
			}
			else
			{
				draw_text_transformed_color(pos_x + 282, pos_y + 27, "Missing\nIngredients", 0.75, 0.65, 0, c_maroon, c_maroon, c_maroon, c_maroon , 1);
			}
			draw_set_font(-1);
	
			// display the required ingredients
			for (var requirement_index = 0; requirement_index < array_length(recipes_in_tab[recipe_index].requirements); requirement_index++)
			{
				if (recipes_in_tab[recipe_index].discovered)
				{
					draw_sprite_ext(recipes_in_tab[recipe_index].requirements[requirement_index].sprite, 0,
									pos_x + 48 + (32 * requirement_index), pos_y + 36,
									15 / sprite_get_width(recipes_in_tab[recipe_index].requirements[requirement_index].sprite), 
									15 / sprite_get_height(recipes_in_tab[recipe_index].requirements[requirement_index].sprite), 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(sprite_unknown_2, 0, pos_x + 48 + (32 * requirement_index), pos_y + 36, 0.75, 0.75, 0, c_white, 1);
				}
			}
		}
	}
	
	if (!global.mouse_mode && keyboard_check_released(ord(global.open_recipe)))
	{
		choose_recipe = !choose_recipe;
	}
	
	if (!global.mouse_mode)
	{
		// keyboard the highlight box around the recipe side
		if (choose_recipe)
		{
			if (keyboard_check_released(vk_left) or keyboard_check_released(ord(global.left1)) or keyboard_check_released(ord(global.left2)))
			{
				if (current_tab > 0)
				{
					current_tab--;
				}
				else
				{
					current_tab = number_of_tabs - 1;
				}
				
				//if (current_recipe >= array_length(recipes_in_tab))
				//{
				//	if (array_length(recipes_in_tab) != 0)
				//	{
				//		current_recipe = array_length(recipes_in_tab) - 1;
				//	}
				//	else
				//	{
				//		current_recipe = 0;
				//	}
				//}
				current_recipe = 0;
			}
				
			if (keyboard_check_released(vk_right) or keyboard_check_released(ord(global.right1)) or keyboard_check_released(ord(global.right2)))
			{
				if (current_tab < number_of_tabs - 1)
				{
					current_tab++;
				}
				else
				{
					current_tab = 0;
				}
				
				//if (current_recipe >= array_length(recipes_in_tab))
				//{
				//	if (array_length(recipes_in_tab) != 0)
				//	{
				//		current_recipe = array_length(recipes_in_tab) - 1;
				//	}
				//	else
				//	{
				//		current_recipe = 0;
				//	}
				//}
				current_recipe = 0;
			}
			if (keyboard_check_released(vk_up) or keyboard_check_released(ord(global.up1)) or keyboard_check_released(ord(global.up2)))
			{
				if (current_recipe == 0)
				{
					current_recipe = array_length(recipes_in_tab) - 1;
				}
				else
				{
					current_recipe--;
				}
			}
					
			if (keyboard_check_released(vk_down) or keyboard_check_released(ord(global.down1)) or keyboard_check_released(ord(global.down2)))
			{
				if (current_recipe == array_length(recipes_in_tab) - 1)
				{
					current_recipe = 0;
				}
				else
				{
					current_recipe++;
				}
			}
		}
		else // move the box around the ingredient side
	{
		if (array_length(inventory_items) != 0)
		{
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
		}
	}
	
		highlight_row = floor(current_item / inventory_columns);
		highlight_column =  current_item % inventory_columns;
	
		// draw "hovering over" box for ingredient
		draw_set(color_highlight, 0.1);
		var highlight_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (highlight_column * (ui_inventory_margin + ui_inventory_box));
		var highlight_y = ui_padding_y + (ui_border_size * 13) + (highlight_row * (ui_inventory_margin + ui_inventory_box));
		draw_rectangle(highlight_x, highlight_y, highlight_x + ui_inventory_box, highlight_y + ui_inventory_box, false);
		draw_reset();
	
		// draw "hovering over" box for recipe
		var pos_x = ui_padding_x + (ui_border_size *  3) + 4;
		var pos_y = ui_padding_y + (ui_border_size * 13) + (current_recipe * (ui_inventory_margin + 0.50 * ui_inventory_box));
		draw_set(color_highlight, 0.1);
		draw_rectangle(pos_x - 4, pos_y - 4, pos_x + ui_panel_left  - 28, pos_y + (40), false);
		draw_reset();
	
		// draw "hovering over" for recipe tab
		var highlight_tab_y = (ui_border_size * 13) + 0.65 * ui_inventory_box;
		var highlight_tab_x =  ui_padding_x + (ui_border_size *  3) + 4 + (64 * tab_when_recipes_collected);
		draw_sprite_ext(sprite_recipe_tab, 0, highlight_tab_x + 3, highlight_tab_y + 3, 48 / 64, 16 / 16, 0, c_fuchsia, 1);
	}
	else
	{
		var mx = device_mouse_x_to_gui(0);
		var my = device_mouse_y_to_gui(0);
		
		if (mx < (ui_padding_x + ui_panel_left))
		{
			choose_recipe = true;
		}
		else
		{
			choose_recipe = false;
		}
		
		// draw "hovering over" box for ingredient
		for (var ingredient = 0; ingredient < array_length(inventory_items); ingredient++)
		{
			highlight_row = floor(ingredient / inventory_columns);
			highlight_column =  ingredient % inventory_columns;
			
			draw_set(color_highlight, 0.1);
			var highlight_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (highlight_column * (ui_inventory_margin + ui_inventory_box));
			var highlight_y = ui_padding_y + (ui_border_size * 13) + (highlight_row * (ui_inventory_margin + ui_inventory_box));
			
			if (( highlight_x < mx) && (mx < highlight_x + ui_inventory_box))
			{
				if (( highlight_y < my) && (my < highlight_y + ui_inventory_box))
				{
					draw_rectangle(highlight_x, highlight_y, highlight_x + ui_inventory_box, highlight_y + ui_inventory_box, false);
					draw_reset();
					current_item = ingredient;
					
					// click to use or select
					if (mouse_check_button_released(mb_left))
					{
						if (inventory_items[ingredient].usable)
						{
							inventory.item_use(inventory_items[ingredient].sprite);
							
							if (current_item >= array_length(inventory_items))
							{
								if (array_length(inventory_items) != 0)
								{
									current_item = array_length(inventory_items) -1 ;
								}
								else
								{
									current_item = 0;
								}
							}
						}
						else
						{
							var item_index = array_get_index(selected, ingredient)
							if (item_index == -1 and array_length(selected) < 5)
							{
								array_push(selected, ingredient);
							}
							else
							{
								if (-1 != array_get_index(selected, ingredient))
								{
									array_delete(selected, item_index, 1);
								}
							}
						}
					}
				}
			}
		}
	
		// draw "hovering over" box for recipe
		for (var recipe = 0; recipe < array_length(recipes_in_tab); recipe++)
		{
			var pos_x = ui_padding_x + (ui_border_size *  3) + 4;
			var pos_y = ui_padding_y + (ui_border_size * 13) + (recipe * (ui_inventory_margin + 0.50 * ui_inventory_box));
			draw_set(color_highlight, 0.1);
			
			if (( (pos_x - 4) < mx) && (mx <  pos_x + (ui_panel_left  - 28) ))
			{
				if ((  (pos_y - 4) < my) && (my <  (pos_y + 40) ))
				{
					draw_rectangle(pos_x - 4, pos_y - 4, pos_x + ui_panel_left  - 28, pos_y + (40), false);
					draw_reset();
					current_recipe = recipe;
				}
			}
		}
	
		// draw "hovering over" for recipe tab
		for (var tab = 0; tab < number_of_tabs; tab++)
		{
			var highlight_tab_x =  ui_padding_x + (ui_border_size *  3) + 4 + (64 * tab);
			var highlight_tab_y = (ui_border_size * 13) + 0.65 * ui_inventory_box;
			
			if ((highlight_tab_y < my) && (my < highlight_tab_y + 16))
			{
				if ((highlight_tab_x < mx) && (mx < highlight_tab_x + 48))
				{
					draw_sprite_ext(sprite_recipe_tab, 0, highlight_tab_x + 3, highlight_tab_y + 3, 48 / 64, 16 / 16, 0, #ffaaff, 1);
					
					if (mouse_check_button_released(mb_left))
					{
						current_recipe = 0;
						current_tab = tab;
					}
				}
			}
		}
		var highlighted_tab_x = ui_padding_x + (ui_border_size *  3) + 4 + (64 * tab_when_recipes_collected);
		draw_sprite_ext(sprite_recipe_tab, 0, highlighted_tab_x + 3, highlight_tab_y + 3, 48 / 64, 16 / 16, 0, c_fuchsia, 1);

	}
	
	// draw selection numbers over the selected ingredients
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
	
	if (!global.mouse_mode)
	{
		// select ingredients
		if (!choose_recipe)
		{
			if (keyboard_check_released(ord(global.interact)) and array_length(inventory_items) != 0)
			{
				if (inventory_items[current_item].usable)
				{
					inventory.item_use(inventory_items[current_item].sprite);
					if (current_item >= array_length(inventory_items))
					{
						if (array_length(inventory_items) != 0)
						{
							current_item = array_length(inventory_items) -1 ;
						}
						else
						{
							current_item = 0;
						}
					}
				}
				else
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
			}
			else
			{
				// draw text above inventory
				var ui_text = "";
		
				if (array_length(inventory_items) == 0)
				{
					ui_text = "Your inventory is empty, go explore! :)"
				}
				else
				{
					if (array_length(selected) < 5)
					{
						ui_text = string("Inventory - Pres '{0}' to (de)select or use", global.interact);
					}
					else
					{
						ui_text = string("Inventory - Press '{0}' to craft; '{1}' to deselect or use", global.craft, global.interact);
					}
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
			
				draw_set_font(font_inventory_recipe);
				var usable_string = "";
				if (inventory_items[current_item].usable)
				{
					usable_string = string(" - Press {0} to drink me!", global.interact);
				}
			
				var name_usable = string("{0}{1}", inventory_items[current_item].name, usable_string);
				draw_text(ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
						  ui_padding_y + (ui_border_size * 4) + 34, name_usable);
			}
	
			// craft from ingredients
			if (keyboard_check_released(ord(global.craft)))
			{
				if (array_length(selected) == 5)
				{
					var attempt_recipe = [];
					for (var i = 0; i < array_length(selected); i++)
					{
						array_push(attempt_recipe, inventory_items[selected[i]])
					}
				
					if (!inventory.recipe_craft_from_ingredients(attempt_recipe))
					{
						instance_create_depth(ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
											  ui_padding_y * 1.5 + (ui_border_size * 4) + 4, depth - 1, object_item_used_text_tutorial);
					}
				
					selected = [];
				
					if (current_item >= array_length(inventory_items))
					{
						if (array_length(inventory_items) != 0)
						{
							current_item = array_length(inventory_items) - 1;
						}
						else
						{
							current_item = 0;
						}
					}
				}
			}
			draw_set_font(font_inventory_tutorial);
			var inventory_recipe_ui = string("Recipes - Press '{0}'", global.open_recipe)
	
			// text shadow
			draw_set(c_teal, 0.15);
			draw_text(ui_padding_x + (ui_border_size * 3) + 4, ui_padding_y + (ui_border_size * 4) + 4, inventory_recipe_ui);

			// text 
			draw_set(c_navy, 1);
			draw_text(ui_padding_x + (ui_border_size * 3), ui_padding_y + (ui_border_size * 4), inventory_recipe_ui);
		}
		else
		{
			var ui_text = string("Press '{0}' to craft known recipe; '{1}' to switch back", global.craft, global.open_recipe);
		
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
	
			var inventory_recipe_ui = "";
			if (!recipes_in_tab[current_recipe].discovered)
			{
				inventory_recipe_ui = string("{0}", recipes_in_tab[current_recipe].description);
			}
			else
			{
				inventory_recipe_ui = string("{0}", recipes_in_tab[current_recipe].pre_discovery_description);
			}
			draw_set_font(font_inventory_recipe);

			// text shadow
			draw_set(c_teal, 0.15);
			draw_text(ui_padding_x + (ui_border_size * 3) + 4, ui_padding_y + (ui_border_size * 4) + 4, inventory_recipe_ui);

			// text  above recipe
			draw_set(c_navy, 1);
			draw_text(ui_padding_x + (ui_border_size * 3), ui_padding_y + (ui_border_size * 4), inventory_recipe_ui);
		
			if (keyboard_check_released(ord(global.craft)))
			{
				draw_set_font(font_inventory_tutorial);
				if (inventory.recipe_has(recipes_in_tab[current_recipe].name) and recipes_in_tab[current_recipe].discovered)
				{
					inventory.recipe_craft(recipes_in_tab[current_recipe].name);
				
					if (current_item >= array_length(inventory_items))
					{
						if (array_length(inventory_items) != 0)
						{
							current_item = array_length(inventory_items) - 1;
						}
						else
						{
							current_item = 0;
						}
					}
				}
				else
				{
					var pos_x = ui_padding_x + (ui_border_size *  3) + 4;
					var pos_y = ui_padding_y + (ui_border_size * 13) + (current_recipe * (ui_inventory_margin + 0.75 * ui_inventory_box));
					instance_create_depth(pos_x, pos_y, depth - 1, object_item_used_text_tutorial);
				}
			}
		}
	}
	else
	{
		if (choose_recipe)
		{
			var ui_text = string("Click to craft known recipe");
		
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
	
			var inventory_recipe_ui = "";
			if (!recipes_in_tab[current_recipe].discovered)
			{
				inventory_recipe_ui = string("{0}", recipes_in_tab[current_recipe].description);
			}
			else
			{
				inventory_recipe_ui = string("{0}", recipes_in_tab[current_recipe].pre_discovery_description);
			}
			draw_set_font(font_inventory_recipe);

			// text shadow
			draw_set(c_teal, 0.15);
			draw_text(ui_padding_x + (ui_border_size * 3) + 4, ui_padding_y + (ui_border_size * 4) + 4, inventory_recipe_ui);

			// text  above recipe
			draw_set(c_navy, 1);
			draw_text(ui_padding_x + (ui_border_size * 3), ui_padding_y + (ui_border_size * 4), inventory_recipe_ui);
		
			if (mouse_check_button_released(mb_left))
			{
				if ((ui_border_size * 13) + 0.65 * ui_inventory_box + 16 < device_mouse_y_to_gui(0))
				{
					draw_set_font(font_inventory_tutorial);
					if (inventory.recipe_has(recipes_in_tab[current_recipe].name) and recipes_in_tab[current_recipe].discovered)
					{
						inventory.recipe_craft(recipes_in_tab[current_recipe].name);
						if (current_item >= array_length(inventory_items))
						{
							if (array_length(inventory_items) != 0)
							{
								current_item = array_length(inventory_items) -1 ;
							}
							else
							{
								current_item = 0;
							}
						}
					}
					else
					{
						var pos_x = ui_padding_x + (ui_border_size *  3) + 4;
						var pos_y = ui_padding_y + (ui_border_size * 13) + (current_recipe * (ui_inventory_margin + 0.75 * ui_inventory_box));
						instance_create_depth(pos_x, pos_y, depth - 1, object_item_used_text_tutorial);
					}
				}
			}
		}
		else
		{
			// draw text above inventory
			var ui_text = "";
		
			if (array_length(inventory_items) == 0)
			{
				ui_text = "Your inventory is empty, go explore! :)"
			}
			else
			{
				if (array_length(selected) < 5)
				{
					ui_text = string("Click to (de)select or use");
				}
				else
				{
					ui_text = string("Inventory - R Click to craft; Click to (de)select or use");
				}
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
			
			draw_set_font(font_inventory_recipe);
			var usable_string = "";
			if (inventory_items[current_item].usable)
			{
				usable_string = string(" - Left Click to drink me!");
			}
			
			var name_usable = string("{0}{1}", inventory_items[current_item].name, usable_string);
			draw_text(ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
						ui_padding_y + (ui_border_size * 4) + 34, name_usable);
	
			// craft from ingredients
			if (mouse_check_button_released(mb_right))
			{
				if (array_length(selected) == 5)
				{
					var attempt_recipe = [];
					for (var i = 0; i < array_length(selected); i++)
					{
						array_push(attempt_recipe, inventory_items[selected[i]])
					}
				
					if (!inventory.recipe_craft_from_ingredients(attempt_recipe))
					{
						instance_create_depth(ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
												ui_padding_y * 1.5 + (ui_border_size * 4) + 4, depth - 1, object_item_used_text_tutorial);
					}
					
					if (current_item >= array_length(inventory_items))
					{
						if (array_length(inventory_items) != 0)
						{
							current_item = array_length(inventory_items) -1 ;
						}
						else
						{
							current_item = 0;
						}
					}
				
					selected = [];
				}
			}
		}
	}
}



