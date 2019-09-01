//client_handle_message(buffer)

var buffer = argument0;

while(true){
	var message_id = buffer_read(buffer, buffer_u8);
	
	switch(message_id){
		
		case MESSAGE_GETID:
			my_client_id = buffer_read(buffer, buffer_u16);
			break;
		case MESSAGE_MOVE:
			// Reading data from the server, putting other clients positions
			var client = buffer_read(buffer, buffer_u16);
			var xx = buffer_read(buffer, buffer_u16);
			var yy = buffer_read(buffer, buffer_u16);
			
			clientObject = client_get_object(client);
			
			clientObject.tim = 0;
			clientObject.prx = clientObject.x;
			clientObject.pry = clientObject.y;
			clientObject.tox = xx;
			clientObject.toy = yy;
			
			with(obj_server_client){
				if(client_id != client_id_current){
					network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
				}
			}
			
		break;
		
		case MESSAGE_JOIN:
		
			var client = buffer_read(buffer, buffer_u16);
			var username = buffer_read(buffer, buffer_string);
			clientObject = client_get_object(client);
			
			clientObject.name = username;
		break;
			
		case MESSAGE_LEAVE:
		
			var client = buffer_read(buffer, buffer_u16);
			tempObject = client_get_object(client);
			
			with(tempObject)
			instance_destroy();
		break;
	}
	
	// Failsafe
	if(buffer_tell(buffer) == buffer_get_size(buffer)){
		break;
	}
}