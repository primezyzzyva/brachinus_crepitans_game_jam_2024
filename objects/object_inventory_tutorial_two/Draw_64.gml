/// @description Insert description here
// You can write your code in this editor

var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

// shadow
draw_set(c_black, 0.2);
draw_rectangle(ui_padding_x + ui_border_size, ui_padding_y + ui_border_size, gui_width - ui_padding_x + ui_border_size,
			   gui_height - ui_padding_y + ui_border_size, false);

// full rectangle
draw_set(color_border, 1);
draw_rectangle(ui_padding_x, ui_padding_y, gui_width - ui_padding_x, gui_height - ui_padding_y, false);

// inner rectangle
draw_set(color_background,0.62);
draw_rectangle(ui_padding_x + ui_border_size, ui_padding_y + ui_border_size, gui_width - ui_padding_x - ui_border_size,
			   gui_height - ui_padding_y - ui_border_size, false);

// horizontal line
draw_set(color_border, 1);
draw_rectangle(ui_padding_x + ui_panel_left, ui_padding_y + ui_border_size, ui_padding_x + ui_panel_left +
				ui_border_size, gui_height - ui_padding_y - ui_border_size, false);

// font
draw_set_font(font_inventory_tutorial);
text_align(fa_left, fa_top);

// text shadow
draw_set(c_black, 0.5);
draw_text(ui_padding_x + (ui_border_size * 3) + 4, ui_padding_y + (ui_border_size * 4) + 4, "Stats");

// text 
draw_set(c_white, 1);
draw_text(ui_padding_x + (ui_border_size * 3), ui_padding_y + (ui_border_size * 4), "Stats");

// text shadow
draw_set(c_black, 0.5);
draw_text(ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
		  ui_padding_y + (ui_border_size * 4) + 4, "Inventory");

// text 
draw_set(c_white, 1);
draw_text(ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
		  ui_padding_y + (ui_border_size * 4), "Inventory");

// boxes
var inventory_items = inventory.item_get();
for (var row = 0; row < inventory_rows; row++)
{
	var position_y = ui_padding_y + (ui_border_size * 13) + (row * (ui_inventory_margin + ui_inventory_box));
	
	for (var column = 0; column < inventory_columns; column++)
	{
		var position_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
		
		// draw box shadow
		draw_sprite_ext(sprite_inventory_background, 0, position_x + 4, position_y + 4, 1, 1, 0, c_black, 0.4);
		
		// draw box shadow
		draw_sprite_ext(sprite_inventory_background, 0, position_x, position_y, 1, 1, 0, c_grey, 1);
	
		var inventory_index = (row * inventory_columns) + column;
		
		if (inventory_index <= array_length(inventory_items) - 1)
		{
			draw_sprite(inventory_items[inventory_index].sprite, 0, position_x, position_y);
		}
		
		if (inventory_index <= array_length(inventory_items) - 1)
		{
			draw_set(#232323, 1);
			draw_circle(position_x + ui_inventory_box - 10, position_y + ui_inventory_box - 10, 14, false);
		
			draw_set(c_white, 1);
			text_align(fa_center, fa_middle);
			draw_set_font(-1);
		
			draw_text(position_x + ui_inventory_box - 10, position_y + ui_inventory_box - 10, inventory_items[inventory_index].quantity);
		}
	}
}