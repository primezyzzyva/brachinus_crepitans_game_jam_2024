/// @description Insert description here
// You can write your code in this editor

if (global.paused) return;

if (keyboard_check_released(ord(global.interact)) and distance_to_object(object_brachinus_crepitans) < interaction_distance) {
	current_message_counter += 1;
	if (current_message_counter >= array_length(dialog_message_list)) {
		current_message_counter = 0;
	}
	
}

if (array_length(dialog_message_list) == 0) {
	dialog_message = string("Press '{0}' to interact", global.interact);
	// var dialog_message = initial_message;
	// dialog_loaded = true;
}
else {
	dialog_message = dialog_message_list[current_message_counter];
}

