/// @description Insert description here
// You can write your code in this editor
if (global.paused) return;

if (keyboard_check_released(ord("I")) or keyboard_check_released(ord("B")))
{
	showInventory = !showInventory;
}