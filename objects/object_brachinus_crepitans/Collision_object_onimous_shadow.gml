/// @description collision with hero and shadow

// if hero collides with shadow
collision_time = collision_time + 1;
 if (collision_time > 10) {
	
	instance_destroy(object_brachinus_crepitans);
	instance_create_layer(x_location, y_location, "Instances", object_brachinus_crepitans);

}
