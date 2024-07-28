/// @description Insert description here
// You can write your code in this editor
// https://www.youtube.com/watch?v=3FGMKQ_8bIc

is_showing_inventory = false;
debug_inventory = true; 

selected = [];
current_item = 0;
current_recipe = 0;
choose_recipe = false;

highlight_row = 0;
highlight_column = 0;

inventory = new Recipe(); // recipe inherits inventory, yay OOP


// ingredients
var unknown = struct_from_sprite_index(sprite_unknown_2);
var foxtail = struct_from_sprite_index(sprite_plants_foxtail);
var star_thistle = struct_from_sprite_index(sprite_plant_star_thistle);
var small_twig = struct_from_sprite_index(sprite_plant_small_twig);
var seed_sunflower = struct_from_sprite_index(sprite_plant_seed_sunflower);
var seed_dandelion = struct_from_sprite_index(sprite_plant_seed_dandelion);
var sea_plantain = struct_from_sprite_index(sprite_plant_sea_plantain);
var pinecone_fragment = struct_from_sprite_index(sprite_plant_pinecone_fragment);
var pine_needle = struct_from_sprite_index(sprite_plant_pine_needle);
var acorn_top = struct_from_sprite_index(sprite_plant_pine_acorn_top);
var mote_of_sunglight = struct_from_sprite_index(sprite_plant_mote_of_sunlight);
var leaf_dandelion = struct_from_sprite_index(sprite_plant_leaf_dandelion);
var leaf_oak = struct_from_sprite_index(sprite_plant_leaf_oak);
var water_droplet = struct_from_sprite_index(sprite_misc_water_droplet);
var sand_grass = struct_from_sprite_index(sprite_misc_sand_grass);
var pollen = struct_from_sprite_index(sprite_misc_pollen);
var mud = struct_from_sprite_index(sprite_misc_mud);
var leaf_fragment = struct_from_sprite_index(sprite_misc_leaf_fragment);
var honey = struct_from_sprite_index(sprite_misc_honey);
var gravel = struct_from_sprite_index(sprite_misc_gravel);
var grass = struct_from_sprite_index( sprite_misc_grass);
var berry_blue = struct_from_sprite_index(sprite_misc_berry_red);
var berry_red = struct_from_sprite_index(sprite_misc_berry_blue);
var mushroom_pink_bonnet = struct_from_sprite_index(sprite_mushroom_pink_bonnet);
var mushroom_pig_ear = struct_from_sprite_index(sprite_mushroom_pig_ear);
var mushroom_peziza_ammophilia = struct_from_sprite_index(sprite_mushroom_peziza_ammophilia);
var mushroom_pale_brittlestem = struct_from_sprite_index( sprite_mushroom_pale_brittlestem);
var mushroom_morel = struct_from_sprite_index(sprite_mushroom_morel);
var mushroom_marasmius_haematocephalus = struct_from_sprite_index(sprite_mushroom_marasmius_haematocephalus);
var mushroom_hericium_erinsceus = struct_from_sprite_index(sprite_mushroom_hericium_erinsceus);
var mushroom_favolaschia_calocera = struct_from_sprite_index(sprite_mushroom_favolaschia_calocera);
var mushroom_entoloma_hochstetteri = struct_from_sprite_index(sprite_mushroom_entoloma_hochstetteri);
var mushroom_straw = struct_from_sprite_index(sprite_mushroom_straw);
var mushroom_veiled_lady = struct_from_sprite_index(sprite_mushroom_veiled_lady);
var mushroom_amanita_muscaria = struct_from_sprite_index(sprite_mushroom_amanita_muscaria);
var vial = struct_from_sprite_index(sprite_vial);
var vial_blood = struct_from_sprite_index(sprite_vial_blood);
var vial_urine = struct_from_sprite_index(sprite_vial_urine);
var vial_water =struct_from_sprite_index(sprite_vial_water);
var flower_yellow_petals = struct_from_sprite_index(sprite_flower_yellow_petals);
var flower_white_petals = struct_from_sprite_index(sprite_flower_white_petals);
var flower_red_petals = struct_from_sprite_index(sprite_flower_red_petals);
var flower_purple_petals = struct_from_sprite_index(sprite_flower_purple_petals);
var flower_blue_petals = struct_from_sprite_index(sprite_flower_blue_petals);
var bug_pill_shell_fragment  = struct_from_sprite_index(sprite_bug_pill_shell_fragment);
var bug_ant_antenna  = struct_from_sprite_index(sprite_bug_ant_antenna);
var water_strider_leg = struct_from_sprite_index(sprite_bug_water_strider_leg);
var mud_wasp_wing  = struct_from_sprite_index(sprite_bug_mud_wasp_wing);
var scorpian_stinger = struct_from_sprite_index(sprite_bug_scorpian_stinger);

// resultant potions
var speech_ant = {name: "Ant Speech 101", quantity: 1, sprite: sprite_vial_blood};

inventory.recipe_add("Discover Me", [unknown, unknown, unknown, unknown, unknown], [unknown], unknown.sprite, false);
inventory.recipe_add("Ant Speech 101", [mushroom_amanita_muscaria, leaf_fragment, honey, flower_white_petals, bug_ant_antenna], [speech_ant], speech_ant.sprite, false, "Let's ask them about bridges");

inventory.recipe_add("Love Potion Number 9", [{name: "12ngue Mushroom", quantity: 1}], [{name: "Pheromone", quantity: 1, sprite: sprite_vial}], sprite_vial);
inventory.recipe_add("Dank Meme", [{name: "13ngue Mushrm", quantity: 1, sprite: sprite_mushroom_truffle_potato_esque}, {name: "4e Mushroom", quantity: 1, sprite: sprite_vial_blood}], [{name: "Also pheromones?", quantity: 1, sprite: sprite_vial_urine}], sprite_vial_urine);
inventory.recipe_add("Blood. It's just blood", [{name: "4e Mushroom", quantity: 2, sprite: sprite_vial_blood}], [{name: "Blood", quantity: 2, sprite: sprite_vial_blood}], sprite_vial_blood);

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

if (debug_inventory)
{
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

