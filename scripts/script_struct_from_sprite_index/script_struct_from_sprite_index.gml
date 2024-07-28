// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function struct_from_sprite_index(sprite_index)
{
	return {name: name_from_sprite_index(sprite_index), quantity: 1, sprite: sprite_index};
}