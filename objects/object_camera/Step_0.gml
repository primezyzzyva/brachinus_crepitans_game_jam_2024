/// @description Insert description here
// You can write your code in this editor

if (keyboard_check(ord("C")))
{
	indicate_camera = true;
	script_movement(following.steps, false, ["K", "H", "J", "L"]);
}
else
{
	indicate_camera = false
	x = clamp(x, following.x - horizontal_border, following.x + horizontal_border);
	y = clamp(y, following.y - vertical_border, following.y + vertical_border);
}
