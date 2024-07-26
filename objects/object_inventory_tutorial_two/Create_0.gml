/// @description Insert description here
// You can write your code in this editor
// https://www.youtube.com/watch?v=3FGMKQ_8bIc

inventory = new Inventory2();

inventory.item_add("Morel Mushroom", 1, sprite_mushroom_morel_honeycomb_cone);
inventory.item_add("Morel Mushroom", 1, sprite_mushroom_morel_honeycomb_cone);
inventory.item_add("Morel Mushroom", 1, sprite_mushroom_morel_honeycomb_cone);
inventory.item_add("Mushroom mycelium", 1, sprite_mushroom_mycelium);
inventory.item_add("Earth Tongue Mushroom", 100, sprite_mushroom_earth_tongue);

//inventory.item_subtract("Morel Mushroom", 1);
//inventory.item_subtract("Earth Tongue Mushroom", 100);



show_debug_message(inventory);

// UI Information
display_set_gui_size(1280,720);

color_background = #FDC789;
color_border = #A0410D;
color_box = #DD995E;

inventory_columns = 9;
inventory_rows = 6;

ui_padding_x = 64;
ui_padding_y = 64;
ui_panel_left = 320;
ui_border_size = 8;
ui_inventory_padding = 48;
ui_inventory_box = 64;
ui_inventory_margin = 16;

