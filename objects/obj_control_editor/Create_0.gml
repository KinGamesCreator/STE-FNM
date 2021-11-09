/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

global.interact = true;

global.selected = [-1,-1];

global.editor_version = "v1.0.0-FNM";
menu = true;

while(menu) {
	
	msg = get_string("Write the name of a project\nType \"create\" to create a new one.\nType \"convert\" to import an original FNF level","");
	if (msg == "create") {
		msg = get_string("Project's name","");
		if (msg != "") and (msg != noone) {
			if !file_exists("proyects\\" + string_lower(msg) + "\\data.json") {
				show_message("input music in .ogg format...");
				var temp_music = get_open_filename("music|*.ogg","music.ogg");
				if (temp_music != "") and (temp_music != noone) {
					file_copy(temp_music,"proyects\\" + string_lower(msg) + "\\music.ogg");
					show_message(string_lower(msg) + "project created successfully.\nWhen you try to open it, it will ask you for the BPM.");
				} else {
					show_message("...music?");
					game_end();
					break;
				}
			} else {
				show_message("The project already exists.");
			}
		} else {
			show_message("...");
			game_end();
			break;
		}
	} else if msg == "convert"{
		room_goto(Room2);
		break;
	} else if (msg != "") and (msg != noone) {
		if file_exists("proyects\\" + string_lower(msg) + "\\music.ogg") {
			global.name = string_lower(msg);
			menu = false;
		} else {
			show_message("the project does not exist");
		}
	} else {
		show_message("totno.");
		game_end();
		break;
	}
	
}

if (!menu) {

music_stream = audio_create_stream("proyects\\" + global.name + "\\music.ogg");
global.music = audio_play_sound(music_stream,1,1);

if file_exists("proyects\\" + global.name + "\\data.json") {
	var temp_load = file_text_open_read("proyects\\" + global.name + "\\data.json");
	global.data = json_parse(file_text_read_string(temp_load));
	file_text_close(temp_load);
} else {
	global.data = {
		duration: 0,
		bpm		: get_integer("Ingresa el BPM",120),
		pistas	: [[]],
		version : global.editor_version
	}
	global.data.duration = audio_sound_length(global.music);
	global.data.pistas = array_create(11,array_create(floor(global.data.duration * (global.data.bpm / 60) * 4)+1));
}

if global.editor_version != global.data.version {
	array_resize(global.data.pistas,11);
	for (var i = 0; i < array_length(global.data.pistas);i++) {
		if global.data.pistas[i] != 0 {
			array_resize(global.data.pistas[i],floor(global.data.duration * (global.data.bpm / 60) * 4)+1);
		} else {
			global.data.pistas[i] = array_create(floor(global.data.duration * (global.data.bpm / 60) * 4)+1,0);
		}
	}
}

global.notes = global.data.pistas;

resize_scene();
}