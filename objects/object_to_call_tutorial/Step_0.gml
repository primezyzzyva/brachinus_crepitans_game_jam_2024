/// @description Insert description here
// You can write your code in this editor


y -= 3;

image_alpha = lerp(image_alpha, 0, 0.02);

if (image_alpha <= 0.1)
{
	instance_destroy();
}