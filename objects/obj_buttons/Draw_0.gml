/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

for (var i = 0; i < (sprite_get_number(sprite_index)-1); i++) {
	if (i != 0) {
		draw_sprite(sprite_index,i+1,x+12*i,y);
	} else {
		draw_sprite(sprite_index,!audio_is_paused(global.music),x+12*i,y);
	}
}

for (var i = 0; i < (sprite_get_number(sprite_index)-1); i++) {
	if point_in_rectangle(mouse_x,mouse_y,x+12*i,y,x+12*i+11,y+12) and global.interact {
		draw_set_alpha(0.1 + 0.1 * mouse_check_button(mb_left));
		draw_rectangle(x+12*i,y,x+12*i+11,y+11,0);
		draw_set_alpha(1);
	}
}

draw_sprite_ext(spr_saved,0,(image_number-1)*12,y,1,1,0,c_white,saved);
