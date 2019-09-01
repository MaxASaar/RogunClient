//server_handle_connect(socket_id);

var socket_id = argument0;

l = instance_create_layer(0, 0, "Instances", obj_server_client);
l.socket_id = socket_id;
l.client_id = client_id_counter++;

if(client_id_counter >= 65000){
	client_id_counter = 0;
}

// client map (ds map) will hold all of clients objects
clientmap[? string(socket_id)] = l;

buffer_seek(send_buffer, buffer_seek_start, 0);
buffer_write(send_buffer, buffer_u8, MESSAGE_GETID);
buffer_write(send_buffer, buffer_u16, l.client_id);
network_send_raw(socket_id, send_buffer, buffer_tell(send_buffer));