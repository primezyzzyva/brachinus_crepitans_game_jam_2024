/// @description Insert description here
// You can write your code in this editor
// https://www.youtube.com/watch?v=3FGMKQ_8bIc

is_showing_inventory = false;
debug_inventory = true;
show_recipe_ingredients = false;

selected = [];
current_item = 0;
current_recipe = 0;
current_tab = 0;
choose_recipe = false;

highlight_row = 0;
highlight_column = 0;

inventory = new Recipe(); // recipe inherits inventory, yay OOP


// ingredients drawn by Kate
var unknown = struct_from_sprite_index(sprite_unknown_2, false);
var foxtail = struct_from_sprite_index(sprite_plants_foxtail, false);
var star_thistle = struct_from_sprite_index(sprite_plant_star_thistle, false);
var small_twig = struct_from_sprite_index(sprite_plant_small_twig, false);
var seed_sunflower = struct_from_sprite_index(sprite_plant_seed_sunflower, false);
var seed_dandelion = struct_from_sprite_index(sprite_plant_seed_dandelion, false);
var sea_plantain = struct_from_sprite_index(sprite_plant_sea_plantain, false);
var pinecone_fragment = struct_from_sprite_index(sprite_plant_pinecone_fragment, false);
var pine_needle = struct_from_sprite_index(sprite_plant_pine_needle, false);
var acorn_top = struct_from_sprite_index(sprite_plant_pine_acorn_top, false);
var mote_of_sunglight = struct_from_sprite_index(sprite_plant_mote_of_sunlight, false);
var leaf_dandelion = struct_from_sprite_index(sprite_plant_leaf_dandelion, false);
var leaf_oak = struct_from_sprite_index(sprite_plant_leaf_oak, false);
var water_droplet = struct_from_sprite_index(sprite_misc_water_droplet, false);
var sand_grass = struct_from_sprite_index(sprite_misc_sand_grass, false);
var pollen = struct_from_sprite_index(sprite_misc_pollen, false);
var mud = struct_from_sprite_index(sprite_misc_mud, false);
var leaf_fragment = struct_from_sprite_index(sprite_misc_leaf_fragment, false);
var honey = struct_from_sprite_index(sprite_misc_honey, false);
var gravel = struct_from_sprite_index(sprite_misc_gravel, false);
var grass = struct_from_sprite_index( sprite_misc_grass, false);
var berry_blue = struct_from_sprite_index(sprite_misc_berry_red, false);
var berry_red = struct_from_sprite_index(sprite_misc_berry_blue, false);
var mushroom_pink_bonnet = struct_from_sprite_index(sprite_mushroom_pink_bonnet, false);
var mushroom_pig_ear = struct_from_sprite_index(sprite_mushroom_pig_ear, false);
var mushroom_peziza_ammophilia = struct_from_sprite_index(sprite_mushroom_peziza_ammophilia, false);
var mushroom_pale_brittlestem = struct_from_sprite_index( sprite_mushroom_pale_brittlestem, false);
var mushroom_morel = struct_from_sprite_index(sprite_mushroom_morel, false);
var mushroom_marasmius_haematocephalus = struct_from_sprite_index(sprite_mushroom_marasmius_haematocephalus, false);
var mushroom_hericium_erinsceus = struct_from_sprite_index(sprite_mushroom_hericium_erinsceus, false);
var mushroom_favolaschia_calocera = struct_from_sprite_index(sprite_mushroom_favolaschia_calocera, false);
var mushroom_entoloma_hochstetteri = struct_from_sprite_index(sprite_mushroom_entoloma_hochstetteri, false);
var mushroom_straw = struct_from_sprite_index(sprite_mushroom_straw, false);
var mushroom_veiled_lady = struct_from_sprite_index(sprite_mushroom_veiled_lady, false);
var mushroom_amanita_muscaria = struct_from_sprite_index(sprite_mushroom_amanita_muscaria, false);
var vial = struct_from_sprite_index(sprite_vial, false);
var vial_blood = struct_from_sprite_index(sprite_vial_blood, false);
var vial_urine = struct_from_sprite_index(sprite_vial_urine, false);
var vial_water =struct_from_sprite_index(sprite_vial_water, false);
var flower_yellow_petals = struct_from_sprite_index(sprite_flower_yellow_petals, false);
var flower_white_petals = struct_from_sprite_index(sprite_flower_white_petals, false);
var flower_red_petals = struct_from_sprite_index(sprite_flower_red_petals, false);
var flower_purple_petals = struct_from_sprite_index(sprite_flower_purple_petals, false);
var flower_blue_petals = struct_from_sprite_index(sprite_flower_blue_petals, false);
var bug_pill_shell_fragment  = struct_from_sprite_index(sprite_bug_pill_shell_fragment, false);
var bug_ant_antenna  = struct_from_sprite_index(sprite_bug_ant_antenna, false);
var water_strider_leg = struct_from_sprite_index(sprite_bug_water_strider_leg, false);
var mud_wasp_wing  = struct_from_sprite_index(sprite_bug_mud_wasp_wing, false);
var scorpian_stinger = struct_from_sprite_index(sprite_bug_scorpian_stinger, false);

// other items drawn by Max, hopefully we can replace these with Kate's art
var mushroom_earth_tongue = struct_from_sprite_index(sprite_mushroom_earth_tongue, false);


// resultant potions
var speech_ant = struct_from_sprite_index(sprite_vial_white_cylinder, true);
var speech_pill_bug = struct_from_sprite_index(sprite_vial_blue_cylinder, true);
var speech_water_strider = struct_from_sprite_index(sprite_vial_red_cylinder, true);
var speech_wasp = struct_from_sprite_index(sprite_vial_yellow_cylinder, true);
var speech_scorpian = struct_from_sprite_index(sprite_vial_purple_cylinder,true);

var test = struct_from_sprite_index(sprite_vial_orange_cylinder,true);


inventory.recipe_add("Discover Me", [unknown, unknown, unknown, unknown, unknown], [unknown], unknown.sprite, false, , "You discvoered me. Cheater.");
inventory.recipe_add(speech_ant.name, [mushroom_earth_tongue, grass, honey, flower_white_petals, bug_ant_antenna], [speech_ant], speech_ant.sprite, show_recipe_ingredients, "Red, white, and ... green?\nClose enough. At least the\nhoney should help", "I wonder if they're some sort\nof hive mind?", 0);
inventory.recipe_add(speech_pill_bug.name, [mushroom_earth_tongue, gravel, berry_red, flower_blue_petals, bug_pill_shell_fragment], [speech_pill_bug], speech_pill_bug.sprite, show_recipe_ingredients, "Pill bugs are pretty small...\nWill I even be able to hear them?", "They're pretty cute. So cute I\ncould probably eat one. Or two\n...I probably shouldn't.", 0);
inventory.recipe_add(speech_water_strider.name, [mushroom_earth_tongue, water_droplet, berry_blue, flower_red_petals, water_strider_leg], [speech_water_strider], speech_water_strider.sprite, show_recipe_ingredients, "Talking is the easy part.\nWhat should I do about all that\nwater though?", "I kind of like the lily pads.\nHopefully they keep at least a\nfew around.", 0);
inventory.recipe_add(speech_wasp.name, [mushroom_earth_tongue, mud, pollen, flower_yellow_petals, mud_wasp_wing], [speech_wasp], speech_wasp.sprite, show_recipe_ingredients, "I wonder why they spend so much\ntime in the mud when they can\nfly? I'll have to ask.", "They're pretty good cooks. I\nshould have asked them for a\na recipe book.", 0);
inventory.recipe_add(speech_scorpian.name, [mushroom_earth_tongue, sand_grass, leaf_fragment, flower_purple_petals, scorpian_stinger], [speech_scorpian], speech_scorpian.sprite, show_recipe_ingredients, "Scorpians always get a bad rep.\nIt must the be heat, right?", "*Blush* I don't think I'd want\nto start a conversation with\nthat.", 0);

inventory.recipe_add(test.name, [mushroom_earth_tongue, sand_grass, leaf_fragment, flower_purple_petals, scorpian_stinger], [speech_scorpian], speech_scorpian.sprite, show_recipe_ingredients, "Scorpians always get a bad rep.\nIt must the be heat, right?", "*Blush* I don't think I'd want\nto start a conversation with\nthat.", 1);


if (debug_inventory)
{
	inventory.item_add_from_struct(mushroom_amanita_muscaria);
	inventory.item_add_from_struct(mushroom_amanita_muscaria);
	inventory.item_add_from_struct(leaf_fragment);
	inventory.item_add_from_struct(leaf_fragment);
	inventory.item_add_from_struct(honey);
	inventory.item_add_from_struct(honey);
	inventory.item_add_from_struct(flower_white_petals);
	inventory.item_add_from_struct(flower_white_petals);
	inventory.item_add_from_struct(bug_ant_antenna);
	inventory.item_add_from_struct(bug_ant_antenna);
	inventory.item_add_from_struct(mushroom_earth_tongue);
	inventory.item_add_from_struct(mushroom_earth_tongue);
	inventory.item_add_from_struct(mushroom_earth_tongue);
	inventory.item_add_from_struct(mushroom_earth_tongue);
	inventory.item_add_from_struct(mushroom_earth_tongue);
	inventory.item_add_from_struct(mushroom_earth_tongue);

	// all items
	inventory.item_add_from_struct(unknown);
	inventory.item_add_from_struct(foxtail);
	inventory.item_add_from_struct(star_thistle);
	inventory.item_add_from_struct(small_twig);
	inventory.item_add_from_struct(seed_sunflower);
	inventory.item_add_from_struct(seed_dandelion);
	inventory.item_add_from_struct(sea_plantain);
	inventory.item_add_from_struct(pinecone_fragment);
	inventory.item_add_from_struct(pine_needle);
	inventory.item_add_from_struct(acorn_top);
	inventory.item_add_from_struct(mote_of_sunglight);
	inventory.item_add_from_struct(leaf_dandelion);
	inventory.item_add_from_struct(leaf_oak);
	inventory.item_add_from_struct(water_droplet);
	inventory.item_add_from_struct(sand_grass);
	inventory.item_add_from_struct(pollen);
	inventory.item_add_from_struct(mud);
	inventory.item_add_from_struct(leaf_fragment);
	inventory.item_add_from_struct(honey);
	inventory.item_add_from_struct(gravel);
	inventory.item_add_from_struct(grass);
	inventory.item_add_from_struct(berry_blue);
	inventory.item_add_from_struct(berry_red);
	inventory.item_add_from_struct(mushroom_pink_bonnet);
	inventory.item_add_from_struct(mushroom_pig_ear);
	inventory.item_add_from_struct(mushroom_peziza_ammophilia);
	inventory.item_add_from_struct(mushroom_pale_brittlestem);
	inventory.item_add_from_struct(mushroom_morel);
	inventory.item_add_from_struct(mushroom_marasmius_haematocephalus);
	inventory.item_add_from_struct(mushroom_hericium_erinsceus);
	inventory.item_add_from_struct(mushroom_favolaschia_calocera);
	inventory.item_add_from_struct(mushroom_entoloma_hochstetteri);
	inventory.item_add_from_struct(mushroom_straw);
	inventory.item_add_from_struct(mushroom_veiled_lady);
	inventory.item_add_from_struct(mushroom_amanita_muscaria);
	inventory.item_add_from_struct(vial);
	inventory.item_add_from_struct(vial_blood);
	inventory.item_add_from_struct(vial_urine);
	inventory.item_add_from_struct(vial_water);
	inventory.item_add_from_struct(flower_yellow_petals);
	inventory.item_add_from_struct(flower_white_petals);
	inventory.item_add_from_struct(flower_red_petals);
	inventory.item_add_from_struct(flower_purple_petals);
	inventory.item_add_from_struct(flower_blue_petals);
	inventory.item_add_from_struct(bug_pill_shell_fragment );
	inventory.item_add_from_struct(bug_ant_antenna );
	inventory.item_add_from_struct(water_strider_leg);
	inventory.item_add_from_struct(mud_wasp_wing );
	inventory.item_add_from_struct(scorpian_stinger);
}

//inventory.item_subtract("Morel Mushroom", 1);
//inventory.item_subtract("Earth Tongue Mushroom", 100);
//inventory.item_add("3Mushroom mycelium", 3, sprite_mushroom_mycelium);
//inventory.item_add("4e Mushroom", 4, sprite_vial_blood);


// UI Information
display_set_gui_size(1280,720);

color_background = #FDC789;
color_border = #A0410D;
color_box = #DD995E;
color_highlight = #ff00ff; //#6b0a66;

inventory_columns = 9;
inventory_rows = 6;

ui_padding_x = 64;
ui_padding_y = 64;
ui_panel_left = 320;
ui_border_size = 8;
ui_inventory_padding = 48;
ui_inventory_box = 64;
ui_inventory_margin = 16;

