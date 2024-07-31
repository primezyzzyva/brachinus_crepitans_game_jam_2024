/// @description Insert description here
// You can write your code in this editor

debug = false;
can_collect = false;

tilemap_get_tileset()
switch floor(random_range(0, 20))
{
	case 0: sprite_index = sprite_mushroom_agaric_gilled_solid; break;
	case 1: sprite_index = sprite_mushroom_agaric_gilled_spots; break;
	case 2: sprite_index = sprite_mushroom_agaric_gilled_stripe; break;
	case 3: sprite_index = sprite_mushroom_bolete_spongy; break;
	case 4: sprite_index = sprite_mushroom_bracket_shelve; break;
	case 5: sprite_index = sprite_mushroom_bunt_powdery; break;
	case 6: sprite_index = sprite_mushroom_chanterelle_trumpet; break;
	case 7: sprite_index = sprite_mushroom_coral_flat_crust; break;
	case 8: sprite_index = sprite_mushroom_cup; break;
	case 9: sprite_index = sprite_mushroom_earth_tongue; break;
	case 10: sprite_index = sprite_mushroom_earthstar; break;
	case 11: sprite_index = sprite_mushroom_jelly; break;
	case 12: sprite_index = sprite_mushroom_lichen; break;
	case 13: sprite_index = sprite_mushroom_morel_honeycomb_cone; break;
	case 14: sprite_index = sprite_mushroom_mycelium; break;
	case 15: sprite_index = sprite_mushroom_puffball; break;
	case 16: sprite_index = sprite_mushroom_rust_blotches_on_leaves; break;
	case 17: sprite_index = sprite_mushroom_smut_dusty; break;
	case 18: sprite_index = sprite_mushroom_strinkhorn; break;
	case 19: sprite_index = sprite_mushroom_truffle_potato_esque; break;
}

if (debug)
{
	show_debug_message("sprite_index: {0}", sprite_index);
}