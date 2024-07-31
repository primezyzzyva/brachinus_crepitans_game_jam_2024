// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function build_npc(object_type, pos_x, pos_y, dialog){
	// create sprite of type object at location (x, y)
	_new_id = instance_create_layer(pos_x, pos_y, "Instances", object_type);
	// Append the following dialog to this sprite's list of dialogs
	array_push(_new_id.dialog_message_list, dialog);
	
	return _new_id;
	
}

// A function which clears out the dialogs for a particular npc
function reset_npc_dialog(npc_id){
	while array_length(npc_id.dialog_message_list) > 0 {
		array_pop(npc_id.dialog_message_list);
	}
	return;
}

// A function that allows you to add or append dialogs to NPCs without having to create them.
function add_new_npc_dialog(npc_id, overwrite_old_dialog, new_dialog){
	
	if overwrite_old_dialog {
		reset_npc_dialog(npc_id);
	}
	
	array_push(npc_id.dialog_message_list, new_dialog);
	
	return npc_id;
	
}

// This function contains a list of build_npc functions with which it populates the world
function script_dialog(){
	
	global.npc_list = [];
	
	// Example of creating an NPC.
	_old_pillbug_id = build_npc(object_pillbug_old, 31085, 11352, "I once rolled up a mountain top.");
	// Example of pushing the NPC's id to a global resource.
	array_push(global.npc_list, _old_pillbug_id);
	// Example of instance append message.
	array_push(_old_pillbug_id.dialog_message_list, "But that was a long time ago.");
	
	
	// Mr. Stink
	_mr_stink_id = build_npc(object_mr_stink, 35100, 5000, string("Hail! Come hither!\nUse '{0}{1}{2}{3}' to move and press '{4}' while next to me to talk.", global.up1, global.left1, global.down1, global.right1, global.interact));
	array_push(global.npc_list, _mr_stink_id);
	// Example of instance append message.
	//_mr_stink_id = build_npc(object_mr_stink, 35100, 5000, string("Hail! Come hither!\nUse '{0}{1}{2}{3}' to move and press '{4}' while next to me to talk.", global.up1, global.left1, global.down1, global.left1, global.interact));
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
	
	// Lady Bogue
	_lady_bogue_id = build_npc(object_ladybogue, 34600, 2750, "My loyal alchemist, have you yet found a potion which can translate my words for the shadow to understand?");
	array_push(global.npc_list, _lady_bogue_id);
	// Example of instance append message.
	array_push(_lady_bogue_id.dialog_message_list, "No? Never fear, I have full confidence that you will succeed and we will save the land.");
	array_push(_lady_bogue_id.dialog_message_list, " ");
	
	// Walker the Water Strider
	_walker_water_strider_id = build_npc(object_waterstrider, 26250, 10750, "Hey there pardner. What can I do you for?");
	array_push(global.npc_list, _walker_water_strider_id);
	// Example of instance append message.
	array_push(_walker_water_strider_id.dialog_message_list, "Trying to take care of the shadow huh?");
	array_push(_walker_water_strider_id.dialog_message_list, "That's a mighty nobel task. Might be able to help you with that.");
	array_push(_walker_water_strider_id.dialog_message_list, "See we got some of these here wriggling worms along the river bank.");
	array_push(_walker_water_strider_id.dialog_message_list, "Not the most complex creatures you've ever come across. Certainly simpler than you or I.");
	array_push(_walker_water_strider_id.dialog_message_list, "All they do is eat, grow and reproduce. Nothing really keeps them down or deters them from their essentials of living.");
	array_push(_walker_water_strider_id.dialog_message_list, " ");
	array_push(_walker_water_strider_id.dialog_message_list, "Imagine if some got inside of you.");
	array_push(_walker_water_strider_id.dialog_message_list, "Imagine if some got inside of the shadow...");
	array_push(_walker_water_strider_id.dialog_message_list, "They'd just keep on doing their thing. Until they ate it alive!");
	array_push(_walker_water_strider_id.dialog_message_list, "You might have to make them a little stronger, a little more e.x.c.i.t.e.d.");
	array_push(_walker_water_strider_id.dialog_message_list, "But I think that would end it.");
	array_push(_walker_water_strider_id.dialog_message_list, "Does this notion sicken a bug of your status.");
	array_push(_walker_water_strider_id.dialog_message_list, "Just think on it...");
	array_push(_walker_water_strider_id.dialog_message_list, " ");
	array_push(_walker_water_strider_id.dialog_message_list, " ");
	
	// Andy the ant
	_andy_ant_id = build_npc(object_ant, 36050, 4550, "...");
	array_push(global.npc_list, _andy_ant_id);
	// Example of instance append message.
	// array_push(_walker_water_strider_id.dialog_message_list, "Trying to take care of the shadow huh?");
	
	
	
	
	
}

function unlock_ant_dialog() {
	for (var i = 0; i < array_length(global.npc_list); i += 1) {
		if (global.npc_list[i].object_index == object_ant) { 
			reset_npc_dialog(global.npc_list[i]);
			array_push(global.npc_list[i].dialog_message_list, "Praise the land!");
			array_push(global.npc_list[i].dialog_message_list, "Treasure the earth!");
			array_push(global.npc_list[i].dialog_message_list, "A curse upon all who despoil it!");
			array_push(global.npc_list[i].dialog_message_list, "Let they be chased by those that rip and tear. Gnash and snarl.");
			array_push(global.npc_list[i].dialog_message_list, "Let this chant rise until long into the night.");
			array_push(global.npc_list[i].dialog_message_list, "We chant the items that bring out this ancient revenger!");
			array_push(global.npc_list[i].dialog_message_list, "Potent Pheromone, Ant Antenna, Mud Wasp Wing, Small Twig, Water Strider Leg!");
		}
	}
}