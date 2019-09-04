gun_angle = round(point_direction(x, y, mouse_x, mouse_y));

if(keyboard_check(ord("D"))) x += movespeed;
if(keyboard_check(ord("A"))) x -= movespeed;
if(keyboard_check(ord("W"))) y -= movespeed;
if(keyboard_check(ord("S"))) y += movespeed;