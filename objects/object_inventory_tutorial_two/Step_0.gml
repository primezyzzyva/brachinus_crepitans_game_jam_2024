/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

// https://www.youtube.com/watch?v=qiz-wt7Mb9g

if (keyboard_check_released(ord(global.inventory1)) or (keyboard_check_released(ord(global.inventory2))))
{
	is_showing_inventory = !is_showing_inventory;
	instance_deactivate_all(true);
}

if (!is_showing_inventory)
{
	instance_activate_all();
}

