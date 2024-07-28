///// @description Insert description here
//// You can write your code in this editor

if (mouse_check_button_released(mb_left))
{
	show_debug_message("x:{0}, y {1}:", device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
}

if (global.paused) return;

script_movement(steps, true, global.movement1, global.movement2);



// Setting parameter for audio
// Credit to @GameMaker Rob on youtube for his tutorial on how to do this
// https://youtu.be/ZpPBlD9FyKw

audio_listener_position(x, y, 0);