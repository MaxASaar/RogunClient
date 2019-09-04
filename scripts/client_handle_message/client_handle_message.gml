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
			var dir = buffer_read(buffer, buffer_u16);
			
			clientObject = client_get_object(client);
			
			clientObject.tim = 0;
			clientObject.prx = clientObject.x;
			clientObject.pry = clientObject.y;
			clientObject.tox = xx;
			clientObject.toy = yy;
			
			
			// Set the players gun angle to the received dir
			clientObject.gun_angle = dir;
			
			
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
		
		case MESSAGE_HIT:
		
			var clientshootid = buffer_read(buffer, buffer_u16);
			var clientshoot = client_get_object(clientshootid);
			var clientshotid = buffer_read(buffer, buffer_u16);
			var clientshot = client_get_object(clientshotid);
			var shootdirection = buffer_read(buffer, buffer_u16);
			var shootlength = buffer_read(buffer, buffer_u16);
		
			var hit_x = clamp(clientshoot.x + lengthdir_x(shootlength, shootdirection), clientshot.x, clientshot.x+16);
			var hit_y = clamp(clientshoot.y + lengthdir_x(shootlength, shootdirection), clientshot.y, clientshot.y+16);				
		
			clientshot.hp = buffer_read(buffer, buffer_u8);
		
			create_shootline(clientshoot.x, clientshoot.y, hit_x, hit_y);
		
		break;
		case MESSAGE_MISS:
				
			var clientshootid = buffer_read(buffer, buffer_u16);
			var clientshoot = client_get_object(clientshootid);
			var shootdirection = buffer_read(buffer, buffer_u16);
			var shootlength = buffer_read(buffer, buffer_u16);
		
			create_shootline(clientshoot.x, clientshoot.y,
					clientshoot.x + lengthdir_x(shootlength, shootdirection),
					clientshoot.y + lengthdir_y(shootlength, shootdirection),
			);
		break;
	}
	
	// Failsafe
	if(buffer_tell(buffer) == buffer_get_size(buffer)){
		break;
	}
}