
stable_x = 0;
stable_y = 0;

view_camera[0] = camera_create_view(stable_x, stable_y, view_wport[0], view_hport[0]);

screen_shake_active = false;
screen_shake_progress = 0;
screen_shake_start_time = 0;
screen_shake_x_freq = 1;
screen_shake_y_freq = 1;
screen_shake_x_dir = 1;
screen_shake_y_dir = 1;

slide_active = false;
slide_progress = 0;
slide_target_x = 0;
slide_start_x = 0;

shake_curve = animcurve_get_channel(animation_curves, "shake_intensity");
