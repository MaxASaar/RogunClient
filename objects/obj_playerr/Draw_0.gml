// Shadow
draw_sprite(spr_cowboy_placeholder_shadow, 0, x, y + 28);
// Body
draw_self();
// Gun
draw_sprite_ext(spr_gun_placeholder, 0, x, y, 1, 1, gun_angle, c_white, 1);	
// Head
draw_sprite(spr_cowboy_placeholder_head, 0 ,x,y);


// Healthbar
draw_healthbar(x-24, y-36, x+24, y-32, hp * 5, c_white, c_red, c_green, 0, false, false);