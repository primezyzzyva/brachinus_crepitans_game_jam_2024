/// @description Insert description here
// You can write your code in this editor

draw_self();
if( show_inventory == true )
{
    draw_sprite(sprite_inventory, -1, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])); // viewport[1], viewport[2]);
}
