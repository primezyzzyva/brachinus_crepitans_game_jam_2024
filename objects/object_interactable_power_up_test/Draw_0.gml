/// @description Insert description here
// You can write your code in this editor

draw_self();  //Ensure that the sprite still gets drawn

// prompt the player when close to the object
if (distance_to_object(object_brachinus_crepitans) < 100)
{
	// draw a background rectangle so the text will be visible in all biomes
	draw_healthbar(x - (sprite_width / 3), y - 1 * (sprite_height / 100), x + (sprite_width * 1.5), y - (sprite_height * 0.25), 100, c_gray, c_gray, c_gray, 0, false, true);

	// draw the text		
	draw_set_font(font_big);
	draw_set_halign(fa_left);
    draw_text(x - (sprite_width / 4), y - 1 * (sprite_height / 5), "Walk over to collect");
		
	if (distance_to_object(object_brachinus_crepitans) < 5)
	{
		switch (image_index)
		{
			case 0:
			show_debug_message("case 0");
			object_brachinus_crepitans.steps = object_brachinus_crepitans.steps * 1.5; break;
			
			case 1:
			show_debug_message("case 1");
			object_brachinus_crepitans.steps = object_brachinus_crepitans.steps * 0.5; break;

			case 2:
			show_debug_message("case 2");
			object_brachinus_crepitans.steps = object_brachinus_crepitans.base_steps; break;
		}
		instance_destroy();
	}
		
}
	
// destroy the instance if the player gets too far away
if (distance_to_object(object_brachinus_crepitans) > 5 * room_get_viewport(room_game_main, 0)[3])
{
	instance_destroy();
}

show_debug_message("{0}", object_brachinus_crepitans.steps);