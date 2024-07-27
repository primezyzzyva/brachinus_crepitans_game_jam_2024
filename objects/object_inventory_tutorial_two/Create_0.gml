/// @description Insert description here
// You can write your code in this editor
// https://www.youtube.com/watch?v=3FGMKQ_8bIc

is_showing_inventory = false;

selected = [];
current_item = 0;
highlight_row = 0;
highlight_column = 0;

inventory = new Recipe(); // recipe inherits inventory, yay OOP

inventory.item_add("0Moel Mushroom", 1, sprite_mushroom_morel_honeycomb_cone);
inventory.item_add("1Mol Mushroom", 1, sprite_mushroom_morel_honeycomb_cone);
inventory.item_add("2Mol Mushroom", 2, sprite_mushroom_morel_honeycomb_cone);
inventory.item_add("3Mushroom mycelium", 3, sprite_mushroom_mycelium);
inventory.item_add("4e Mushroom", 4, sprite_vial_blood);
inventory.item_add("5gue Mushroom", 5, sprite_vial);
inventory.item_add("6Mushroom", 6, sprite_vial_urine);
inventory.item_add("7Tongue Mushroom", 7, sprite_vial_water);
inventory.item_add("8arth Tongue Mushroom", 8, sprite_mushroom_agaric_gilled_solid);
inventory.item_add("9rth Tongue Mushroom", 9, sprite_mushroom_agaric_gilled_stripe);
inventory.item_add("10th Tongue Mushroom", 10, sprite_mushroom_agaric_gilled_spots);
inventory.item_add("11h Tongue Mushroom", 11, sprite_mushroom_jelly);
inventory.item_add("12ngue Mushroom", 12, sprite_mushroom_truffle_potato_esque);
inventory.item_add("13ngue Mushrm", 13, sprite_mushroom_truffle_potato_esque);

inventory.recipe_add("Love Potion Number 9", [{name: "12ngue Mushroom", quantity: 1}], [{name: "Pheromone", quantity: 1, sprite: sprite_vial}], sprite_vial);
inventory.recipe_add("Dank Meme", [{name: "13ngue Mushrm", quantity: 1}, {name: "4e Mushroom", quantity: 1}], [{name: "Also pheromones?", quantity: 1, sprite: sprite_vial_urine}], sprite_vial_urine);




//inventory.item_subtract("Morel Mushroom", 1);
//inventory.item_subtract("Earth Tongue Mushroom", 100);



show_debug_message(inventory);
show_debug_message(recipe_get);

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

