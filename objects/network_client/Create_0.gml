/// @description Insert description here
// You can write your code in this editor
// show_message("Hey!");
//client_udp_socket = network_create_socket(network_socket_udp);
global.server_welcome_socket = network_create_socket(network_socket_tcp);
var server = network_connect_raw(global.server_welcome_socket , "127.0.0.1", 8192);
show_debug_message("friggen server tho: " + string(server));
if server < 0
    {
    //No connection! Failsafe codes here...
	show_debug_message("Couldn't connect to server");
    }
else
    {
	var t_buffer = buffer_create(1024, buffer_grow, 1);
	buffer_seek(t_buffer, buffer_seek_start, 0);
	buffer_write(t_buffer , buffer_string, "Hello");
	network_send_raw(global.server_welcome_socket, t_buffer, buffer_tell(t_buffer));
    // network_send_udp(client_socket, "127.0.0.1", 8192, t_buffer, buffer_tell(t_buffer));
	//Connected!
    }
