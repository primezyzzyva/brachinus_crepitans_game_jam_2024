// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_movement(steps, use_sprites = true, other_keys = ["W", "A", "S", "D"])
{
	var left = (keyboard_check(vk_left) or keyboard_check(ord(other_keys[1])) or keyboard_check(ord("A")));
	var right = (keyboard_check(vk_right) or keyboard_check(ord(other_keys[3])) or keyboard_check(ord("D")));
	var up = (keyboard_check(vk_up) or keyboard_check(ord(other_keys[0])) or keyboard_check(ord("W")));
	var down = (keyboard_check(vk_down) or keyboard_check(ord(other_keys[2])) or keyboard_check(ord("S")));

	var horizontal_speed = right - left;
	var vertical_speed = down - up;
	
    var dir = point_direction(0, 0, horizontal_speed, vertical_speed);
    var length = steps * (horizontal_speed != 0 || vertical_speed != 0);
    x += lengthdir_x(length, dir);
    y += lengthdir_y(length, dir);

	if (!keyboard_check(vk_nokey))
    {
		sprite_direction = round(dir / 45);
	}
	else
	{
		sprite_direction = 12;
	}
	
	if (use_sprites)
	{
	    switch(sprite_direction)
		{
			case 12: sprite_index = sprite_brachinus_crepitans_standing; break;
			case 0: case 8: sprite_index = sprite_brachinus_crepitans_right; break;
			case 1: sprite_index = sprite_brachinus_crepitans_up_right; break;
			case 2: sprite_index = sprite_brachinus_crepitans_up; break;
			case 3: sprite_index = sprite_brachinus_crepitans_up_left; break;
			case 4: sprite_index = sprite_brachinus_crepitans_left; break;
			case 5: sprite_index = sprite_brachinus_crepitans_down_left; break;
			case 6: sprite_index = sprite_brachinus_crepitans_down; break;
			case 7: sprite_index = sprite_brachinus_crepitans_down_right; break;
		}
	}
}