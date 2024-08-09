/// @description Insert description here
// You can write your code in this editor


if (current_second % 25 == 0)
{
	if (distance_to_object(object_brachinus_crepitans) < 5 * room_get_viewport(room_game_main, 0)[3])
	{
		if (instance_count < quantity)
		{
			for (var index = 0; index < quantity; index++)
			{
				var coordinates = spawner.get_random_biome_coordinates(x, y);
				instance_create_layer(coordinates[0], coordinates[1], "Instances", object_ingredient);
			}
		}
	}
	
	if keyboard_check_released(ord("P"))
	{
		show_debug_message(instance_count);
	}
}