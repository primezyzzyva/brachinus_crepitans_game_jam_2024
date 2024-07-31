/// @description Insert description here
// You can write your code in this editor

draw_self();  //Ensure that the sprite still gets drawn

// prompt the player when close to the object
if (distance_to_object(object_brachinus_crepitans) < 48)
{
    // draw the text
    draw_reset();
    draw_set_font(font_big);
    draw_set_halign(fa_center);

	if (!interacted)
	{
	    draw_healthbar(rectangle_x1, rectangle_y1, rectangle_x2, rectangle_y2, 100, c_gray, c_gray, c_gray, 0, false, true);
	    draw_text(text_x, text_y, string("Press '{0}' to interact", global.interact));

		// press 'E' to pick up the item and put it into the inventory
	    if (keyboard_check_released(ord(global.interact)))
	    {
			interacted = true;
		}
	}
	else
	{
	    draw_text(text_x, text_y, string("Press '{0}' to select, '{1}' to change", global.interact, global.open_recipe));
		for (var option = 0; option < array_length(teleport_options); option++)
		{
		    draw_healthbar(rectangle_x1, rectangle_y1 - (spacing) - (option * spacing), rectangle_x2, rectangle_y2 - spacing - (option * spacing), 100, c_gray, c_gray, c_gray, 0, false, true);
		}

		if (keyboard_check_released(ord(global.open_recipe)))
		{
			if (selected_option < array_length(teleport_options) - 1)
			{
				selected_option++;
			}
			else
			{
				selected_option = 0;
			}
		}
		
	    draw_healthbar(rectangle_x1, rectangle_y1 - spacing - (selected_option * spacing), rectangle_x2 - 5, rectangle_y2 - spacing - (selected_option * spacing), 95, c_fuchsia, c_gray, c_gray, 1, true, false);

		for (var option = 0; option < array_length(teleport_options); option++)
		{
		    draw_text(text_x, text_y - (spacing) - (option * spacing), string("GOTO: '{0}'", teleport_options[option].name));
		}
		
		// press 'E' to pick up the item and put it into the inventory
	    if (keyboard_check_released(ord(global.interact)))
	    {
			instance_destroy(object_brachinus_crepitans);
	        instance_create_layer(teleport_options[selected_option].x_location, teleport_options[selected_option].y_location, "Instances", object_brachinus_crepitans);
		}
	}
}
else
{
	interacted = false;
}