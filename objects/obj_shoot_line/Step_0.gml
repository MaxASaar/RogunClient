/// @description Insert description here
// You can write your code in this editor
fade -= 1 / (room_speed * 0.1);
if(fade <= 0){
	instance_destroy();
}