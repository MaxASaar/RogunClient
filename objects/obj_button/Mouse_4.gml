if(txt == "create server"){
	with(obj_button) instance_destroy();
	
	instance_create_layer(0,0, "Instances", obj_server);
}else{
	with(obj_button) instance_destroy();
	
	instance_create_layer(0,0, "Instances", obj_client);
	instance_create_layer(100,100,"Instances", obj_playerr);
}