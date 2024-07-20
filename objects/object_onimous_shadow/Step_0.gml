/// @description Insert description here
// You can write your code in this editor

delta_x = abs(object_brachinus_crepitans.x - x);
delta_y = abs(object_brachinus_crepitans.y - y);


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
	show_debug_message("delta_X: {0}, delta_y: {1}, sprite_height {2}", delta_x, delta_y, sprite_height)
	show_debug_message("current time: {0}", current_second)
}