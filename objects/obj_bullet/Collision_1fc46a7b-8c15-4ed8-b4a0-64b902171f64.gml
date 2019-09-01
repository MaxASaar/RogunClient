instance_destroy();

repeat(10){
	instance_create_layer(x,y,"Obstacles", obj_debris);
}

// Get access to the dummy
with(other){
	// instance_destroy();
	// repeat(10){
	// 	  instance_create_layer(x,y,"Obstacles", obj_debris);
	// }
}