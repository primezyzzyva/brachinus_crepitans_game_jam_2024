// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function name_from_sprite_index(sprite_index)
{
	var thy_name_is = "";
	switch (sprite_index)
	{
		// Max's sprites
		case sprite_mushroom_agaric_gilled_solid: thy_name_is = "Solid Gilled Mushroom"; break;
		case sprite_mushroom_agaric_gilled_spots: thy_name_is = "Spotted Gilled Mushroom"; break;
		case sprite_mushroom_agaric_gilled_stripe: thy_name_is = "Striped Gilled Mushroom"; break;
		case sprite_mushroom_bolete_spongy: thy_name_is = "Spongey Bolete Mushroom"; break;
		case sprite_mushroom_bracket_shelve: thy_name_is = "Turkey Tail Mushroom"; break;
		case sprite_mushroom_bunt_powdery: thy_name_is = "Powdery Bunt Mushroom"; break;
		case sprite_mushroom_chanterelle_trumpet: thy_name_is = "Trumpet Chanterelle Mushroom"; break;
		case sprite_mushroom_coral_flat_crust: thy_name_is = "Flat Crust Coral Mushroom"; break;
		case sprite_mushroom_cup: thy_name_is = "Cup Mushroom"; break;
		case sprite_mushroom_earth_tongue: thy_name_is = "Earth Tongue Mushroom"; break;
		case sprite_mushroom_earthstar: thy_name_is = "Earth Star Mushroom"; break;
		case sprite_mushroom_jelly: thy_name_is = "Jelly Mushroom"; break;
		case sprite_mushroom_lichen: thy_name_is = "Lichen isn't a Mushroom"; break;
		case sprite_mushroom_morel_honeycomb_cone: thy_name_is = "Honeycomb Morel Mushroom"; break;
		case sprite_mushroom_mycelium: thy_name_is = "Mycleim of Mushroom"; break;
		case sprite_mushroom_puffball: thy_name_is = "Puffball Mushroom"; break;
		case sprite_mushroom_rust_blotches_on_leaves: thy_name_is = "Rust on leaves isn't a Mushroom"; break;
		case sprite_mushroom_smut_dusty: thy_name_is = "Dusty Smut isnt a Mushroom"; break;
		case sprite_mushroom_strinkhorn: thy_name_is = "Stink Horn Mushroom"; break;
		case sprite_mushroom_truffle_potato_esque: thy_name_is = "Truffle Mushroom"; break;
		
		// Kate's sprites
		case sprite_plants_foxtail: thy_name_is = "Foxtail"; break;
		case sprite_plant_star_thistle: thy_name_is = "Star Thistle"; break;
		case sprite_plant_small_twig: thy_name_is = "Small Twig"; break;
		case sprite_plant_seed_sunflower: thy_name_is = "Sunflower Seed"; break;
		case sprite_plant_seed_dandelion: thy_name_is = "Dandelion Seed"; break;
		case sprite_plant_sea_plantain: thy_name_is = "Sea Plantain"; break;
		case sprite_plant_pinecone_fragment: thy_name_is = "Pinecone Fragment"; break;
		case sprite_plant_pine_needle: thy_name_is = "Pine Needle"; break;
		case sprite_plant_pine_acorn_top: thy_name_is = "Acorn Top"; break;
		case sprite_plant_mote_of_sunlight: thy_name_is = "Mote of Sunlight"; break;
		case sprite_plant_leaf_dandelion: thy_name_is = "Dandelion Leaf"; break;
		case sprite_plant_leaf_oak: thy_name_is = "Oak Leaf"; break;
		case sprite_misc_water_droplet: thy_name_is = "Water Droplet"; break;
		case sprite_misc_sand_grass: thy_name_is = "Sand Grass"; break;
		case sprite_misc_pollen: thy_name_is = "Pollen"; break;
		case sprite_misc_mud: thy_name_is = "Mud"; break;
		case sprite_misc_leaf_fragment: thy_name_is = "Leaf Fragment"; break;
		case sprite_misc_honey: thy_name_is = "Honey"; break;
		case sprite_misc_gravel: thy_name_is = "Gravel"; break;
		case sprite_misc_grass: thy_name_is = "Grass"; break;
		case sprite_misc_berry_red: thy_name_is = "Red Berry"; break;
		case sprite_misc_berry_blue: thy_name_is = "Blue Berry"; break;
		case sprite_mushroom_pink_bonnet: thy_name_is = "Pink Bonnet Mushroom"; break;
		case sprite_mushroom_pig_ear: thy_name_is = "Pig Ear Mushroom"; break;
		case sprite_mushroom_peziza_ammophilia: thy_name_is = "Peziza ammopphilia Mushroom"; break;
		case sprite_mushroom_pale_brittlestem: thy_name_is = "Pale Brittlestem Mushroom"; break;
		case sprite_mushroom_morel: thy_name_is = "Morel Mushroom"; break;
		case sprite_mushroom_marasmius_haematocephalus: thy_name_is = "Marasmius haematocephalus Mushroom"; break;
		case sprite_mushroom_hericium_erinsceus: thy_name_is = "Hericium erinsceus Mushroom"; break;
		case sprite_mushroom_favolaschia_calocera: thy_name_is = "Favolashia calocera Mushroom"; break;
		case sprite_mushroom_entoloma_hochstetteri: thy_name_is = "Entoloma hochstetteri Mushroom"; break;
		case sprite_mushroom_straw: thy_name_is = "Staw Mushroom"; break;
		case sprite_mushroom_veiled_lady: thy_name_is = "Veiled Lady Mushroom"; break;
		case sprite_mushroom_amanita_muscaria: thy_name_is = "Amanita muscaria Mushroom"; break;
		case sprite_vial: thy_name_is = "Empty Vial"; break;
		case sprite_vial_blood: thy_name_is = "Vial of Blood"; break;
		case sprite_vial_urine: thy_name_is = "Vial of Urine"; break;
		case sprite_vial_water: thy_name_is = "Vial of Water"; break;
		case sprite_unknown: thy_name_is = "Unknown"; break;
		case sprite_flower_yellow_petals: thy_name_is = "Yellow Flower Petals"; break;
		case sprite_flower_white_petals: thy_name_is = "White Flower Petals"; break;
		case sprite_flower_red_petals: thy_name_is = "Red Flower Petals"; break;
		case sprite_flower_purple_petals: thy_name_is = "Purple Flower Petals"; break;
		case sprite_flower_blue_petals: thy_name_is = "Blue Flower Petals"; break;
		case sprite_bug_pill_shell_fragment: thy_name_is = "Pill Bug Shell Fragment"; break;
		case sprite_bug_ant_antenna: thy_name_is = "Ant Antenna"; break;
		case sprite_bug_water_strider_leg: thy_name_is = "Water Strider Leg"; break;
		case sprite_bug_mud_wasp_wing: thy_name_is = "Mud Wasp Wing"; break;
		case sprite_bug_scorpian_stinger: thy_name_is = "Scoprian Stinger"; break;
	}
	
	return thy_name_is;
}