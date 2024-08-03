/// @description Insert description here
// You can write your code in this editor
// https://www.youtube.com/watch?v=3FGMKQ_8bIc

is_showing_inventory = false;
debug_inventory = true;
debug_end_game_inventory = true;
show_recipe_ingredients = false;

selected = [];
current_item = 0;
current_recipe = 0;
current_tab = 0;
recipes_in_tab = [];
tab_when_recipes_collected = 0;

choose_recipe = false;

highlight_row = 0;
highlight_column = 0;

inventory = new Recipe(); // recipe inherits inventory, yay OOP


// ingredients drawn by Kate
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
var berry_blue = struct_from_sprite_index(sprite_misc_berry_blue, false);
var berry_red = struct_from_sprite_index(sprite_misc_berry_red, false);
var mushroom_pink_bonnet = struct_from_sprite_index(sprite_mushroom_pink_bonnet, false); // inedible, poisonous
var mushroom_pig_ear = struct_from_sprite_index(sprite_mushroom_pig_ear, false); // edible.  earthy with meaty texture
var mushroom_peziza_ammophilia = struct_from_sprite_index(sprite_mushroom_peziza_ammophilia, false); // sand covered cup mushroom, poisonous
var mushroom_pale_brittlestem = struct_from_sprite_index( sprite_mushroom_pale_brittlestem, false); // edible
var mushroom_morel = struct_from_sprite_index(sprite_mushroom_morel, false); // edible
var mushroom_marasmius_haematocephalus = struct_from_sprite_index(sprite_mushroom_marasmius_haematocephalus, false); // edible, sweet
var mushroom_hericium_erinsceus = struct_from_sprite_index(sprite_mushroom_hericium_erinsceus, false); // lions mane, mildly sweet
var mushroom_favolaschia_calocera = struct_from_sprite_index(sprite_mushroom_favolaschia_calocera, false); // inedible
var mushroom_entoloma_hochstetteri = struct_from_sprite_index(sprite_mushroom_entoloma_hochstetteri, false); // Werewere-kokako, not edible
var mushroom_straw = struct_from_sprite_index(sprite_mushroom_straw, false); // edible 
var mushroom_veiled_lady = struct_from_sprite_index(sprite_mushroom_veiled_lady, false); // savory sweetnees
var mushroom_amanita_muscaria = struct_from_sprite_index(sprite_mushroom_amanita_muscaria, false); // poisonous,
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
var unknown = struct_from_sprite_index(sprite_unknown_2, false);
var mushroom_earth_tongue = struct_from_sprite_index(sprite_mushroom_earth_tongue, false);


// translation potions
var speech_ant = struct_from_sprite_index(sprite_vial_white_cylinder, true);
var speech_pill_bug = struct_from_sprite_index(sprite_vial_blue_cylinder, true);
var speech_water_strider = struct_from_sprite_index(sprite_vial_red_cylinder, true);
var speech_wasp = struct_from_sprite_index(sprite_vial_yellow_cylinder, true);
var speech_scorpian = struct_from_sprite_index(sprite_vial_purple_cylinder,true);
inventory.recipe_add("Discover Me", [unknown, unknown, unknown, unknown, unknown], [unknown], unknown.sprite, false, , "You discvoered me. Cheater.");
inventory.recipe_add(speech_ant.name, [mushroom_earth_tongue, grass, honey, flower_white_petals, bug_ant_antenna], [speech_ant], speech_ant.sprite, show_recipe_ingredients, "I wonder if they're some sort\nof hive mind?", "Red, white, and ... yellow?\nClose enough. At least the\nhoney tastes nice.", 0);
inventory.recipe_add(speech_pill_bug.name, [mushroom_earth_tongue, gravel, berry_red, flower_blue_petals, bug_pill_shell_fragment], [speech_pill_bug], speech_pill_bug.sprite, show_recipe_ingredients, "Pill bugs are pretty small...\nWill I even be able to hear them?", "They're pretty cute. So cute I\ncould probably eat one. Or two\n...I probably shouldn't.", 0);
inventory.recipe_add(speech_water_strider.name, [mushroom_earth_tongue, water_droplet, berry_blue, flower_red_petals, water_strider_leg], [speech_water_strider], speech_water_strider.sprite, show_recipe_ingredients, "Talking is the easy part.\nWhat should I do about all that\nwater though?", "I kind of like the lily pads.\nHopefully they keep at least a\nfew around.", 0);
inventory.recipe_add(speech_wasp.name, [mushroom_earth_tongue, mud, pollen, flower_yellow_petals, mud_wasp_wing], [speech_wasp], speech_wasp.sprite, show_recipe_ingredients, "I wonder why they spend so much\ntime in the mud when they can\nfly? I'll have to ask.", "They're pretty good cooks. I\nshould have asked them for a\na recipe book.", 0);
inventory.recipe_add(speech_scorpian.name, [mushroom_earth_tongue, sand_grass, leaf_fragment, flower_purple_petals, scorpian_stinger], [speech_scorpian], speech_scorpian.sprite, show_recipe_ingredients, "Scorpions always get a bad rep.\nIt must the be heat, right?", "*Blush* I don't think I'd want\nto start a conversation with\nthat.", 0);

// quest potions
var quest_sweetest_mead = struct_from_sprite_index(sprite_vial_yellow_triangle, true);
var quest_berry_fertiliser = struct_from_sprite_index(sprite_vial_red_triangle, true);
var quest_lily_pads_herbicide = struct_from_sprite_index(sprite_vial_orange_triangle, true);
var quest_parasite_larva_feed = struct_from_sprite_index(sprite_vial_white_triangle, true);
var quest_desert_relief = struct_from_sprite_index(sprite_vial_blue_triangle, true);
inventory.recipe_add(quest_sweetest_mead.name, [honey, mushroom_marasmius_haematocephalus, water_droplet, flower_yellow_petals,mushroom_hericium_erinsceus], [quest_sweetest_mead], quest_sweetest_mead.sprite, show_recipe_ingredients, "Ancient ant legend tells of\ntells of mead so sweet and \nso good you'll cry", "Well... it makes you cry.", 1);
inventory.recipe_add(quest_berry_fertiliser.name, [mud, grass, sand_grass, leaf_dandelion, leaf_fragment], [quest_berry_fertiliser], quest_berry_fertiliser.sprite, show_recipe_ingredients, "Pill bugs love berries. I'm\nsure some compost would win\ntheir favor.", "Solid ingredients turned\ninto a liquid potion? Wow,\nI'm good.", 1);
inventory.recipe_add(quest_lily_pads_herbicide.name, [mushroom_amanita_muscaria, scorpian_stinger, mushroom_favolaschia_calocera, mushroom_pink_bonnet, mushroom_peziza_ammophilia], [quest_lily_pads_herbicide], quest_lily_pads_herbicide.sprite, show_recipe_ingredients, "Everyone knows that water\nstriders hate traffic jams.", "Lazy devs probably won't\neven implement dynamic lily\npad removal for this quest.", 1);
inventory.recipe_add(quest_parasite_larva_feed.name, [star_thistle, sea_plantain, berry_blue, pollen, seed_sunflower], [quest_parasite_larva_feed], quest_parasite_larva_feed.sprite, show_recipe_ingredients, "Nasty little buggers. Make\nan excellent snack. Full of\nnutrients rich ingredients.", "They grow up so fast :')", 1);
inventory.recipe_add(quest_desert_relief.name, [water_droplet, mushroom_veiled_lady, mushroom_pale_brittlestem, leaf_oak, acorn_top], [quest_desert_relief], quest_desert_relief.sprite, show_recipe_ingredients, "It's so hot in the desert.\nSomething to drink and a\nlittle shade would be nice.", "A dessert [sic] treat so\nnice I'll have it twice...\nbut you craft the next one.", 1);

// win conidtion pre-cursors
// berry fertilizer -> very dark compost -> peaceful (good) ending: camoflague so the chicken doesn't see you
// herbicide -> very
// sweet mead -> very powerful animal pheromone -> neutral ending: summon a bigger fish (literally? a fox or ferret maybe)
// parasite feed -> very cute little parasite -> bad ending: kill the chicken with a parsite
// desert relief -> very
var compost = struct_from_sprite_index(sprite_mushroom_mycelium, false, 999);
var pheromone = struct_from_sprite_index(sprite_vial_urine, false, 999);
var parasite = struct_from_sprite_index(sprite_mushroom_jelly, false, 999);


// final win condition potions
var win_good_camouflage = struct_from_sprite_index(sprite_vial_green_round_long, true);
var win_neutral_scare = struct_from_sprite_index(sprite_vial_yellow_round_long, true);
var win_bad_kill = struct_from_sprite_index(sprite_vial_red_round_long, true);
inventory.recipe_add(win_good_camouflage.name, [compost, mud, pine_needle, pinecone_fragment, grass], [win_good_camouflage], win_good_camouflage.sprite, show_recipe_ingredients, "It's how you win. Probably\ndon't have any hints hiding\nhere then.", "'Hiding' get it? Yes, we're\nall terribly clever here.", 2);
inventory.recipe_add(win_neutral_scare.name, [pheromone, bug_ant_antenna, mud_wasp_wing, small_twig, water_strider_leg], [win_neutral_scare], win_neutral_scare.sprite, show_recipe_ingredients, "It's like the opposite of a\nscarecrow. Something will\ncome for this.", "*Shudder* There's always a\nbigger fish it seems.", 2);
inventory.recipe_add(win_bad_kill.name, [parasite, mushroom_veiled_lady, mushroom_pale_brittlestem, leaf_oak, acorn_top], [win_bad_kill], win_bad_kill.sprite, show_recipe_ingredients, "I have a bad feeling about\nthis. Violence is fine in\nvideo games though, right?", "Best not to think about it.", 2);


// other
var perfume_for_lady_bogue = struct_from_sprite_index(sprite_vial_purple_tear, true);
inventory.recipe_add(perfume_for_lady_bogue.name, [flower_blue_petals, flower_purple_petals, flower_red_petals, flower_white_petals, flower_yellow_petals], [perfume_for_lady_bogue], perfume_for_lady_bogue.sprite, show_recipe_ingredients, "A little something nice for\nthe fairest Lady.", "It was just all the flowers\nin alphabetical order. Easy..", 3);



if (debug_end_game_inventory)
{
	inventory.item_add_from_struct(compost);
	inventory.item_add_from_struct(pheromone);
	inventory.item_add_from_struct(parasite);
}


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

_recipes = inventory.recipe_get();
number_of_tabs = array_last(_recipes).tab + 1;
