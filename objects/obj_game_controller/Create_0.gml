
#macro DELTA_TIME_TO_SECONDS 0.000001

#macro DEBUG_MODE 0 // 0 - off, 1 - game debug options, 2 - game debug options and overlay
#macro CHEAT_MODE false

#macro PAUSE_LOGIC if(global.is_paused){return;}

enum GAMEOVER_REASON
{
	OUT_OF_STARS,
	SQUASHED
}

// Ensure existance of only one game controller
if (variable_global_exists("game_controller"))
{
	if (global.game_controller.id == id)
	{
		return;
	}
	if (DEBUG_MODE > 0)
	{
		show_debug_message("[obj_game_controller] Destroying extra controller");
	}
	instance_destroy(self);
	return;
}
global.game_controller = self;
global.is_paused = false;
global.is_ingame = false;

// Setup technical params
if (DEBUG_MODE > 1)
{
	show_debug_log(true);
}
randomize();
base_width = view_wport[0];
base_height = view_hport[0];
width = base_width;
height = base_height;
pause_bkg_spr = -1;

// Cursor
window_set_cursor(cr_none);
instance_create_layer(x, y, "Instances", obj_cursor);

// Load CSVs
base_params_grid = load_csv("csv/BaseParams.csv");

// Setup shader uniforms
blur_invres_uniform = shader_get_uniform(sh_blur_2pass, "u_vInvRes");
blur_vertical_uniform = shader_get_uniform(sh_blur_2pass, "u_bVertical");

// Setup audio
global.sfx_emitter = audio_emitter_create();
global.bgm_emitter = audio_emitter_create();

// Set up user settings
global.screenshake_enabled = true;
global.master_volume = 1.0;
global.sfx_volume = 1.0;
global.music_volume = 1.0;
if (file_exists(settings_filename))
{
	ini_open(settings_filename);
	
	global.screenshake_enabled = ini_read_real("Accessibility", "screen_shake_enabled", 1) > 0;
	
	window_set_fullscreen(ini_read_real("Video", "fullscreen_enabled", 0) > 0);
	
	global.master_volume = ini_read_real("Sound", "master_volume", global.master_volume);
	global.sfx_volume = ini_read_real("Sound", "sfx_volume", global.sfx_volume);
	global.music_volume = ini_read_real("Sound", "music_volume", global.music_volume);
	
	ini_close();
}
else
{
	event_user(1);
}
audio_emitter_gain(global.sfx_emitter, global.master_volume * global.sfx_volume);
audio_emitter_gain(global.bgm_emitter, global.master_volume * global.music_volume);
