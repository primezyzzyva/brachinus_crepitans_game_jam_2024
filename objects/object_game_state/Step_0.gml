/// @description Insert description here
// You can write your code in this editor


if global.game_won {
	room_goto(room_end_credits);
	
}

if (!_has_activated_ant_dialog and global.friends_with_ants) {
	unlock_ant_dialog();
	_has_activated_ant_dialog = true;
}