/// @description Save settings to ini event

ini_open(settings_filename);

ini_write_real("Accessibility", "screen_shake_enabled", global.screenshake_enabled ? 1 : 0);

ini_write_real("Video", "fullscreen_enabled", window_get_fullscreen() ? 1 : 0);

ini_write_real("Sound", "master_volume", global.master_volume);
ini_write_real("Sound", "sfx_volume", global.sfx_volume);
ini_write_real("Sound", "music_volume", global.music_volume);

ini_close();
