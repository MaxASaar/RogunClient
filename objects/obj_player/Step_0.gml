/// @description Insert description here
// You can write your code in this editor

// Player movement

current_velocity_x = 0;
current_velocity_y = 0;
if(left){
	current_velocity_x -= movespeed;
}
if(up){
	current_velocity_y -= movespeed;
}
if(right){
	current_velocity_x += movespeed;
}
if(down){
	current_velocity_y += movespeed;
}

// If both velocities are nonzero, multiply them by sqrt2 / 2
if(current_velocity_x != 0 && current_velocity_y != 0){
	current_velocity_x = current_velocity_x * sqrt(2)/2;
	current_velocity_y = current_velocity_y * sqrt(2)/2;
}

x += current_velocity_x;
y += current_velocity_y;