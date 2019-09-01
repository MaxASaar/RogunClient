//client_get_objecT(client_id)

var client_id = argument0;

if(client_id == my_client_id){
	if(!instance_exists(obj_playerr))
		instance_create_layer(0,0, "Instances", obj_playerr);
	return obj_playerr.id;
}

// if we've received a message from this client before
if(ds_map_exists(clientmap, string(client_id))){
	return clientmap[? string(client_id)];
}else{
	// if we havent received a message from this client, create
	var l = instance_create_layer(0, 0, "Instances", obj_other_client);
	clientmap[? string(client_id)] = l;
	return l;
}