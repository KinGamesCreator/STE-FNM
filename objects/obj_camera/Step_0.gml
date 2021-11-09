/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var avance = (array_length(global.notes[0])) * (audio_sound_get_track_position(global.music) / global.data.duration);

for (var i = base * 4; i < (base*4 + 3);i++) {
	if abs(global.notes[i][avance]) {
		image_index = i-8;
	}
}

if mouse_check_button_pressed(mb_left) and collision_point(mouse_x,mouse_y,id,1,0) {
	image_index = 1;
}
