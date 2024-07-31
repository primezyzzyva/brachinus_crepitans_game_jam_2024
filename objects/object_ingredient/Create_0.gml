/// @description Insert description here
// You can write your code in this editor

debug = true;
can_collect = false;

ingredients_list_to_use = object_ingredient_spawner.spawner.spawn_ingredient_by_biome(x, y);

index = floor(random(1) * array_length(ingredients_list_to_use));
//show_debug_message("sprite: {0}, index: {1}", ingredients_list_to_use, ingredients_list_to_use);

sprite_index = ingredients_list_to_use[index];

if (debug)
{
	show_debug_message("sprite_index: {0}", sprite_index);
}