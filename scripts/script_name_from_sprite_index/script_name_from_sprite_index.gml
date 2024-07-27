// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function name_from_sprite_index(sprite_index)
{
	var thy_name_is = "";
	switch (sprite_index)
	{
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
	}
	
	return thy_name_is;
}