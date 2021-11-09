/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var avance = (array_length(global.notes[0])) * (audio_sound_get_track_position(global.music) / global.data.duration);

var rythm = false;
var quien = 0;
for (var i = base * 4; i < (base*4 + 4);i++) {
	if abs(global.notes[i][avance]) {
		if (global.notes[i][avance] == 1) and (floor(avance) != ultim) {
			rythm = true;
			quien = i;
			obj_pista.rythms[i] = 0.125;
		} else if global.notes[i][avance] > 1 {
			if floor(avance) != ultim {
				rythm = true;
				quien = i;
			}
			obj_pista.rythms[i] = 0.1;
		} else if global.notes[i][avance] = -1 {
			obj_pista.rythms[i] = 0.1;
		}
	}
}

if (floor(avance) != ultim) {
	ultim = floor(avance);
}

if rythm {
	alarm[0] = 4;
	image_index = quien + base + 1;
}
