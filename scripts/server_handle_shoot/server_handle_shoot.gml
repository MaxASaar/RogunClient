///server_handle_shoot(shootdirection, clientObject)

var shootdirection = argument0;
var tempObject = argument1;

var hit = false; // true if we hit an object
var obj = noone;


var prx = tempObject.x;
var pry = tempObject.y;
var prog = 0;
var tox = prx;
var toy = pry;

with(tempObject){
	
	while(prog < SHOOT_RANGE){
		tox = prx + lengthdir_x(10, shootdirection);
		toy = pry + lengthdir_y(10, shootdirection);
		obj = collision_line(prx, pry, tox, toy, all, false, true);
		if(instance_exists(obj)){
			// We have a hit
			hit = true;
			prog += 10;
			break;
		}
		prx = tox;
		pry = toy;
		prog += 10;
	}
	create_shootline(x, y, tox, toy);
}

if(hit){ // If we hit an object
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_HIT);
	buffer_write(send_buffer, buffer_u16, tempObject.client_id);
	buffer_write(send_buffer, buffer_u16, obj.client_id);
	buffer_write(send_buffer, buffer_u16, shootdirection);
	buffer_write(send_buffer, buffer_u16, prog);
	with(obj_server_client){
		network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
	}
}else{ // If we've missed an object
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_MISS);
	buffer_write(send_buffer, buffer_u16, tempObject.client_id);
	buffer_write(send_buffer, buffer_u16, shootdirection);
	buffer_write(send_buffer, buffer_u16, prog);
	with(obj_server_client){
		network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
	}
}