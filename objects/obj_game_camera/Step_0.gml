
PAUSE_LOGIC

x = stable_x;
y = stable_y;

if (screen_shake_active)
{
	if (screen_shake_progress >= 1)
	{
		screen_shake_active = false;
	}
	else
	{
		screen_shake_progress += delta_time * DELTA_TIME_TO_SECONDS / screen_shake_duration;
		var _time = current_time - screen_shake_start_time;
		var _intensity_mult = animcurve_channel_evaluate(shake_curve, screen_shake_progress);
		x += _intensity_mult * screen_shake_max_intensity * screen_shake_x_dir * sin(_time * screen_shake_x_freq);
		y += _intensity_mult * screen_shake_max_intensity * screen_shake_y_dir * sin(_time * screen_shake_y_freq);
	}
}

camera_set_view_pos(view_camera[0], x, y);
