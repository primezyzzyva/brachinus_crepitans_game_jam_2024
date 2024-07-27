///// @description Insert description here
//// You can write your code in this editor

if (global.paused) return;

script_movement(steps, true, global.movement1, global.movement2);

if (mouse_check_button_released(mb_left))
{
	show_debug_message("x:{0}, y {1}:", device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
}