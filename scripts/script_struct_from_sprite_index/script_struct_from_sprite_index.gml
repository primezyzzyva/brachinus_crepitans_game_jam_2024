// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function struct_from_sprite_index(sprite_index, _usable = false, _quantity = 1)
{
	return {name: name_from_sprite_index(sprite_index), quantity: _quantity, sprite: sprite_index, usable: _usable};
}