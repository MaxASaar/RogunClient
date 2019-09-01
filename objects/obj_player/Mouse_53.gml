

show_debug_message("bullet!");

var bullet_direction = point_direction(x, y, mouse_x, mouse_y);

var inst = instance_create_layer(x,y, "Player", obj_bullet);
inst.direction = bullet_direction;
inst.image_angle = bullet_direction;