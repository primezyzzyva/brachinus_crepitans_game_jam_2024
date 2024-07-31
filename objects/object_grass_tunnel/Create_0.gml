/// @description Insert description here
// You can write your code in this editor



teleport_options = [{name: "Grass", x_location: 100, y_location: 200},
					{name: "Desert", x_location: 200, y_location: 300},
					{name: "Gravel", x_location: 400, y_location: 500}];
					
selected_option = 0;
interacted = false;

text_x = x + (sprite_width * 0.45); // x - 500
text_y = y - (sprite_height * 0.37); // y - 110

// sprite is 1064 w x 220 h
rectangle_x1 = x + (sprite_width * 0.4); // x + 400
rectangle_y1 = y - (sprite_height * 0.01);// y - 100
rectangle_x2 = x + (sprite_width * 0.6); //x + 600
rectangle_y2 = y - (sprite_height * 0.25); // y - 50

spacing = 75;
