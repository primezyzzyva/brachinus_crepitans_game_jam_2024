/// @description Insert description here
// You can write your code in this editor

if (keyboard_check(vk_nokey))
{
	sprite_index = sprite_brachinus_crepitans_standing;
}

if (keyboard_check(vk_left) or keyboard_check(ord("A")))
{
	if !collision_point(x - steps, y, object_collision, true, true)
	{
		x -= steps;
	}
	sprite_index = sprite_brachinus_crepitans_left;
}

if (keyboard_check(vk_right) or keyboard_check(ord("D")))
{
	if !collision_point(x + steps, y, object_collision, true, true)
	{
		x += steps;
	}
	sprite_index = sprite_brachinus_crepitans_right;
}
if (keyboard_check(vk_up) or keyboard_check(ord("W")))
{
	if !collision_point(x, y - steps, object_collision, true, true)
	{
		y -= steps;
	}
	sprite_index = sprite_brachinus_crepitans_up;
}

if (keyboard_check(vk_down) or keyboard_check(ord("S")))
{
	if !collision_point(x, y + steps, object_collision, true, true)
	{
		y += steps;
	}
	sprite_index = sprite_brachinus_crepitans_down;
	
}
