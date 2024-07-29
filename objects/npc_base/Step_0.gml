/// @description Insert description here
// You can write your code in this editor

if (global.paused) return;

if !dialog_loaded {
	dialog_message = string("Press '{0}' to interact lots and lots and lots of times", global.interact);
	// var dialog_message = initial_message;
	dialog_loaded = true;
}

