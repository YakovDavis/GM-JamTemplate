/// @description Pause event

var _pause_bkg_surf_0 = surface_create(room_width, room_height);
var _pause_bkg_surf_1 = surface_create(room_width, room_height);

gpu_set_tex_filter(true);
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);

surface_set_target(_pause_bkg_surf_0);
draw_clear_alpha(c_black,0)
shader_set(sh_blur_2pass);
shader_set_uniform_f(blur_invres_uniform, 1.0 / room_width, 1.0 / room_height);
shader_set_uniform_i(blur_vertical_uniform, false);
draw_surface(application_surface, 0, 0);
surface_reset_target();

surface_set_target(_pause_bkg_surf_1);
draw_clear_alpha(c_black,0)
shader_set_uniform_i(blur_vertical_uniform, true);
draw_surface(_pause_bkg_surf_0, 0, 0);

gpu_set_tex_filter(false);
gpu_set_blendmode(bm_normal);
shader_reset();
surface_reset_target();

pause_bkg_spr = sprite_create_from_surface(_pause_bkg_surf_1, 0, 0,
	surface_get_width(_pause_bkg_surf_1), surface_get_height(_pause_bkg_surf_1), false, false, 0, 0);
surface_free(_pause_bkg_surf_0);
surface_free(_pause_bkg_surf_1);

room_goto(rm_pause);
