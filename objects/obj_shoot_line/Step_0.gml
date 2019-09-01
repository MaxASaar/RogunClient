/// @description Insert description here
// You can write your code in this editor
fade -= 1 / (room_speed * 0.7);
if(fade <= 0){
	instance_destroy();
}