/// @description Insert description here
// You can write your code in this editor
var n_id = ds_map_find_value(async_load, "id");
if global.server_welcome_socket == n_id
    {
    var t_buffer = ds_map_find_value(async_load, "buffer"); 
    var msg_type = buffer_read(t_buffer, buffer_s32 ); // Size of a java int
    // var inst = ds_map_find_value(socket_list, sock );
    switch (cmd_type)
        {
        case KEY:
            //A key has been pressed so read the keypress data from the buffer
            break;
        case HEALTH:
            //The player has taken a hit so remove health from them
            break;
        //etc...
        }
    }