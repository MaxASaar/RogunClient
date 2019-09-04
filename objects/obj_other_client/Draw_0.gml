// Shadow
draw_sprite(spr_cowboy_placeholder_shadow, 0, x, y + 28);

// Player Body
draw_sprite(spr_cowboy_placeholder_body, 0, x, y);

// Gun
draw_sprite_ext(spr_gun_placeholder, 0, x, y, 1, 1, gun_angle, c_white, 1);

// Head
draw_sprite(spr_cowboy_placeholder_head, 0 ,x,y);

// Name
draw_set_font(f_orange_kid_12);
draw_set_color(c_black);
draw_text(x,y - 48, name);

// Healthbar
draw_healthbar(x-24, y-36, x+24, y-32, hp * 5, c_white, c_red, c_green, 0, false, false);