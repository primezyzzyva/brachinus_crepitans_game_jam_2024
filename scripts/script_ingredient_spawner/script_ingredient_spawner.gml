// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function ingredient_spawner() constructor
{
	_ingredients_grass =[sprite_plants_foxtail, sprite_plant_star_thistle, sprite_plant_small_twig, sprite_plant_seed_sunflower,
						 sprite_misc_honey, sprite_bug_ant_antenna, sprite_plant_seed_dandelion, sprite_vial_urine, sprite_flower_white_petals,
						 sprite_plant_leaf_oak, sprite_misc_grass];
	
	_ingredients_gravel = [sprite_mushroom_marasmius_haematocephalus, sprite_plant_pinecone_fragment, sprite_misc_gravel, sprite_misc_berry_red,
						   sprite_plant_leaf_dandelion, sprite_plant_pine_acorn_top, sprite_misc_leaf_fragment, sprite_flower_blue_petals, sprite_mushroom_mycelium,
						   sprite_bug_pill_shell_fragment]
	
	_ingredients_sand = [sprite_mushroom_marasmius_haematocephalus, sprite_mushroom_straw, sprite_plant_mote_of_sunlight, sprite_misc_sand_grass,
						 sprite_mushroom_hericium_erinsceus, sprite_mushroom_pale_brittlestem, sprite_flower_purple_petals, sprite_bug_scorpian_stinger,
						 sprite_mushroom_jelly, sprite_mushroom_veiled_lady];
	
	_ingredients_mud = [sprite_mushroom_hericium_erinsceus, sprite_mushroom_morel, sprite_misc_pollen, sprite_misc_mud, sprite_flower_yellow_petals,
						sprite_mushroom_entoloma_hochstetteri, sprite_mushroom_favolaschia_calocera, sprite_mushroom_earth_tongue, sprite_bug_mud_wasp_wing];
	
	_ingredients_water = [sprite_mushroom_marasmius_haematocephalus, sprite_mushroom_peziza_ammophilia, sprite_mushroom_pig_ear, sprite_mushroom_amanita_muscaria,
						  sprite_plant_pine_needle, sprite_mushroom_pink_bonnet, sprite_plant_sea_plantain, sprite_misc_water_droplet,
						  sprite_misc_berry_blue, sprite_flower_red_petals, sprite_bug_water_strider_leg, sprite_mushroom_amanita_muscaria, ];

	_all_ingredients = [_ingredients_grass, _ingredients_gravel,_ingredients_sand,_ingredients_mud,_ingredients_water];
	
	_room_width = 99840;
	_room_height = 30720;
	
	// room is 99840 x 30720. Divide into 16 pieces of 12480 x 3840
	_biomes = [[["sand"], ["sand"], ["grass"], ["grass"], ["grass", "gravel"], ["grass"], ["grass"], ["grass"]],
			   [["water"], ["water", "mud"], ["sand", "grass"], ["sand", "grass", "gravel"], ["gravel", "grass"], ["grass"], ["grass"], ["grass"]],
			   [["mud", "water"], ["water", "mud"], ["sand", "mud"], ["sand", "gravel"], ["grass"], ["grass"], ["grass"], ["grass"]],
			   [["mud"], ["water"], ["water", "mud", "gravel"], ["grass", "gravel"], ["grass", "mud"], ["grass"], ["grass"], ["grass"]],
			   [["mud"], ["water", "mud", "grass"], ["water"], ["water", "mud"], ["water", "mud"], ["water", "mud", "grass"], ["grass"], ["gravel"]],
			   [["grass"], ["grass", "sand"], ["water", "mud", "gravel"], ["sand", "water"], ["sand", "water"], ["water"], ["water", "mud"], ["gravel", "mud"]],
			   [["grass"], ["sand", "grass"], ["sand", "gravel"], ["sand", "water", "mud"], ["sand"], ["sand", "gravel", "water"], ["water", "gravel"], ["water", "mud"]],
			   [["grass"], ["sand", "grass"], ["sand", "gravel"], ["water", "sand", "mud"], ["sand", "water"], ["gravel", "sand"], ["gravel"], ["water", "gravel"]]]

	get_biomes = function(_x_coordinate, _y_coordinate)
	{
		// 0-12480, 12481-24960, 24961-37440, 37441-49920, 49921-62400, 62401-74880, 74881-87360, 87361-99840
		var column = floor(_room_width / (_x_coordinate)); // give col of 2d array
		if (column >= 8)
		{
			column = 0;
		}
		else if (column > 1)
		{
			column--;
		}
		
		// 0-3840, 3841-7680, 7681-11520, 11521-15360, 15361-19200, 19201-23040, 23041-26880, 26881-30720
		var row = floor(_room_height / (_y_coordinate)); //give row of 2d array
		if (row >= 8)
		{
			row = 0;
		}
		else if (row > 1)
		{
			row--;
		}
		
		return _biomes[row][column];
	}
	
	get_random_biome_coordinates = function(_x_coordinate, _y_coordinate)
	{
		//var biome_x = [[0, 12480], [12481, 24960], [24961, 37440], [37441, 49920], [49921, 62400], [62401, 74880], [74881, 87360], [87361, 99840]];
		//var column = floor(_room_width / _x_coordinate); // give col of 2d array
		//var random_x_coordinate = random_range(biome_x[column][0], biome_x[column][1]);
		
		//var biome_y = [[0, 3840], [3841, 7680], [7681, 11520], [11521, 15360],[ 15361, 19200], [19201, 23040], [23041, 26880], [26881, 30720]];
		//var row = floor(_room_height / _y_coordinate); //give row of 2d array
		//var random_y_coordinate = random_range(biome_y[column][0], biome_x[column][1]);
		var far_away = 20000;
		var random_x_coordinate = random_range(object_brachinus_crepitans.x - far_away, object_brachinus_crepitans.x + far_away)
		var random_y_coordinate = random_range(object_brachinus_crepitans.y - far_away, object_brachinus_crepitans.y + far_away)
		
		random_x_coordinate = clamp(random_x_coordinate, 300, 99840 - 300)
		random_y_coordinate = clamp(random_y_coordinate, 300, 30720 - 300)
		
		return [random_x_coordinate, random_y_coordinate];
	}

	spawn_ingredient_by_biome = function(_x_coordinate, _y_coordinate)
	{
		var biomes = get_biomes(_x_coordinate, _y_coordinate);
		var ingredients_list_to_use = [];
		for (var biome = 0; biome < array_length(biomes); biome++)
		{
			switch biomes[biome]
			{
				case "grass":
				for (var ingredient = 0; ingredient < array_length(_all_ingredients[0]); ingredient++)
				{
					array_push(ingredients_list_to_use, _all_ingredients[0][ingredient]);
				}
				break;
				
				case "gravel":
				for (var ingredient = 0; ingredient < array_length(_all_ingredients[1]); ingredient++)
				{
					array_push(ingredients_list_to_use, _all_ingredients[1][ingredient]);
				}
				break;
				
				case "mud":
				for (var ingredient = 0; ingredient < array_length(_all_ingredients[2]); ingredient++)
				{
					array_push(ingredients_list_to_use, _all_ingredients[2][ingredient]);
				}
				break;
				
				case "sand":
				for (var ingredient = 0; ingredient < array_length(_all_ingredients[3]); ingredient++)
				{
					array_push(ingredients_list_to_use, _all_ingredients[3][ingredient]);
				}
				break;
				
				case "water":
				for (var ingredient = 0; ingredient < array_length(_all_ingredients[4]); ingredient++)
				{
					array_push(ingredients_list_to_use, _all_ingredients[4][ingredient]);
				}
				break;
			}
		}
		
		return ingredients_list_to_use;
	}
}
