// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function build_npc(object_type, pos_x, pos_y, dialog){
	// create sprite of type object at location (x, y)
	_new_id = instance_create_layer(pos_x, pos_y, "Instances", object_type);
	// Append the following dialog to this sprite's list of dialogs
	array_push(_new_id.dialog_message_list, dialog);
	
	return _new_id;
	
}

function script_dialog(){
	
	// This function takes in a list of build_npc functions and populates the world
	_old_pillbug_id = build_npc(object_pillbug_old, 31085, 11352, "I once rolled up a mountain top.");
	array_push(_old_pillbug_id.dialog_message_list, "But that was a long time ago.");
	// instance append message

}