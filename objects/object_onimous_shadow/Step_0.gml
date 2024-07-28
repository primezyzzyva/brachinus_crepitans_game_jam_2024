/// @description Insert description here
// You can write your code in this editor

if (global.paused) 
{
	speed = 0;
	return;
}
else
{
	speed = 5;
}

// Set the position of the listener
// audio_listener_position(x, y, 0);
// Play the sound of crunching on loop centered at this object
if !audio_playing {
	audio_play_sound_on(sound_emitter, sound_heavy_crunch_pair, true, 1);
	audio_playing = true;
}


if (keyboard_check_released(vk_backspace))
{
	debug_move = !debug_move;
	script_movement(40, false, ["K", "H", "J", "L"]);
}
else
{
	var delta_x = abs(object_brachinus_crepitans.x - x);
	var delta_y = abs(object_brachinus_crepitans.y - y);


	if (delta_x > sprite_height || delta_y > sprite_height)
	{

		if (collision_point(x + speed * direction, y + speed * direction, object_collision, false, true))
		{
			direction = (direction * 2) % 360;
		}

		if (current_second % 56 == 0)
		{
			direction = random_range(0, 360);
		
		}
	}
	else
	{
		if (delta_x <= sprite_height)
		{
			direction = point_direction(x, y, object_brachinus_crepitans.x, object_brachinus_crepitans.y);
		}

		if (delta_y <= sprite_height)
		{
			direction = point_direction(x, y, object_brachinus_crepitans.x, object_brachinus_crepitans.y);
		}
	}

	if (direction >= 90)
	{
		image_angle = direction - 90;
	}
	else
	{
		image_angle = 360 - direction;
	}

	if (debug_shadow)
	{
		show_debug_message("image_angle: {0}", image_angle);
		show_debug_message("direction: {0}", direction);
		show_debug_message("speed: {0}", speed);
		show_debug_message("delta_X: {0}, delta_y: {1}, sprite_height {2}", delta_x, delta_y, sprite_height);
		show_debug_message("current time: {0}", current_second);
	}
}

// after calculating movement, set the new position of the sound emitter
audio_emitter_position(sound_emitter, x, y, 0);
