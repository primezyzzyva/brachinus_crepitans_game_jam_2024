// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function build_npc(object_type, pos_x, pos_y, dialog){
	// create sprite of type object at location (x, y)
	_new_id = instance_create_layer(pos_x, pos_y, "Instances", object_type);
	// Append the following dialog to this sprite's list of dialogs
	array_push(_new_id.dialog_message_list, dialog);
	
	return _new_id;
	
}

// This function contains a list of build_npc functions with which it populates the world
function script_dialog(){
	
	// Example of creating an NPC.
	_old_pillbug_id = build_npc(object_pillbug_old, 31085, 11352, "I once rolled up a mountain top.");
	// Example of instance append message.
	array_push(_old_pillbug_id.dialog_message_list, "But that was a long time ago.");
	
	
	// Mr. Stink
	_mr_stink_id = build_npc(object_mr_stink, 35100, 5000, "Hail! Come hither!\nUse 'WASD' to move and press 'E' while next to me to talk.");
	// Example of instance append message.
	array_push(_mr_stink_id.dialog_message_list, "Good! It is a pleasure to make your acquaintance Sir Bombardier. Congratulations on your knighthood.");
	array_push(_mr_stink_id.dialog_message_list, "But knighthood is more than fighting battles and attending court.");
	array_push(_mr_stink_id.dialog_message_list, "You are now a vassal of Lady Bogue. A representative of her Ladyship to the swarms!");
	array_push(_mr_stink_id.dialog_message_list, "And... an ambassador to her enemies.");
	array_push(_mr_stink_id.dialog_message_list, "We need you now more than ever. There is a terrible menace that stalks this land.");
	array_push(_mr_stink_id.dialog_message_list, "You will know that it is near when your hear the sound of crunching growing louder!");
	array_push(_mr_stink_id.dialog_message_list, "I shudder recalling what happened to those were not quick enough to avoid its shadow.");
	array_push(_mr_stink_id.dialog_message_list, "Our task is simple, yet impossible. We must learn the secret of it's scent.");
	array_push(_mr_stink_id.dialog_message_list, "If we can discover the language it speaks with, we may be able to sue for peace with this monstrosity.");
	array_push(_mr_stink_id.dialog_message_list, "To that end, we need skilled alchemists such as yourself to experiment with the elements of this world.");
	array_push(_mr_stink_id.dialog_message_list, "Travel around to the five biomes of this world. Speak to the denizens residing therein.");
	array_push(_mr_stink_id.dialog_message_list, "They have each been plagued by this menace and likely have information you need for your quest.");
	array_push(_mr_stink_id.dialog_message_list, "If you see the Avatar in your journeys, tell him to get back in his own franchise.");
	array_push(_mr_stink_id.dialog_message_list, "But to speak to them, you will first need to craft a potion to translate your scents into their language.");
	array_push(_mr_stink_id.dialog_message_list, "Let's prepare by crafting a potion which will let you speak with the local ants.");
	array_push(_mr_stink_id.dialog_message_list, "For this, you will need the following ingredients, which as a skilled alchemist, I am sure you already have:");
	array_push(_mr_stink_id.dialog_message_list, "An earth tongue mushroom, \na bit of grass, \nsome honey, \na pair of white flower petals, \nand a bit of the species you want to talk to.");
	array_push(_mr_stink_id.dialog_message_list, "Press 'I' to open your inventory and craft your recipe.");
	array_push(_mr_stink_id.dialog_message_list, "To consume your potion select it from within your inventory and use it.");
	array_push(_mr_stink_id.dialog_message_list, "Ha ha! I can see from your reaction that tingles a bit. Don't worry, it will fade.");
	array_push(_mr_stink_id.dialog_message_list, "You can now talk to any ants you meet in your journey.");
	array_push(_mr_stink_id.dialog_message_list, "When you find our salvation, return to Lady Bogue in the north-east and present it to her.");
	array_push(_mr_stink_id.dialog_message_list, "That's all. Now go forth and save the insects of this realm!");
	array_push(_mr_stink_id.dialog_message_list, " ");
	array_push(_mr_stink_id.dialog_message_list, " ");
	array_push(_mr_stink_id.dialog_message_list, "Go on. The land needs you. Adventure awaits!");
	array_push(_mr_stink_id.dialog_message_list, " ");
	array_push(_mr_stink_id.dialog_message_list, " ");
	array_push(_mr_stink_id.dialog_message_list, "This is getting awkward. Go on. Get to adventuring.");
	array_push(_mr_stink_id.dialog_message_list, " ");
	array_push(_mr_stink_id.dialog_message_list, " ");
	array_push(_mr_stink_id.dialog_message_list, "Hmm...");
	array_push(_mr_stink_id.dialog_message_list, "Go on.");
	array_push(_mr_stink_id.dialog_message_list, " ");
	array_push(_mr_stink_id.dialog_message_list, " ");
	array_push(_mr_stink_id.dialog_message_list, "Well, now it's fully awkward.");
	array_push(_mr_stink_id.dialog_message_list, "FINE! I can make it awkward too.");
	array_push(_mr_stink_id.dialog_message_list, "I'm gonna pretend like we've never talked before...");
	array_push(_mr_stink_id.dialog_message_list, " ");
	array_push(_mr_stink_id.dialog_message_list, "I will.");
	array_push(_mr_stink_id.dialog_message_list, " ");
	
}