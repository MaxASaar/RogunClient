///client_send_movement()

buffer_seek(send_buffer, buffer_seek_start, 0);
buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE);
buffer_write(send_buffer, buffer_u16, round(obj_playerr.x));
buffer_write(send_buffer, buffer_u16, round(obj_playerr.y));
buffer_write(send_buffer, buffer_u16, round(obj_playerr.gun_angle));

network_send_raw(socket, send_buffer, buffer_tell(send_buffer));