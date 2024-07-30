/// @description Proceed to gameplay

// Press Space to Continue...
// Including commented code below if we want to add some specialized game start functionality for the game control object
if (room == room_transition_title_to_game) {
	//if (global.gameStart == false) {
		audio_stop_all();  // for stopping title page music before transitioning to game play with its own music
	//	global.gameStart = true;
		room_goto(room_game_main);
	//}
}