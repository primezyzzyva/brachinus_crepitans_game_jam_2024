/// @description Insert description here
// You can write your code in this editor


if (global.game_won and !_game_won_hit) {
	show_debug_message("You win!");
	_game_won_hit = true;
	room_goto(room_main_title_screen);
	
}

if (!_has_activated_ant_dialog and global.friends_with_ants) {
	unlock_ant_dialog();
	_has_activated_ant_dialog = true;
}