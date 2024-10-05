/// @description Start screen shake

screen_shake_active = true;
screen_shake_progress = 0;
screen_shake_start_time = current_time;

screen_shake_x_freq = random_range(screen_shake_min_freq, screen_shake_max_freq);
screen_shake_y_freq = random_range(screen_shake_min_freq, screen_shake_max_freq);
screen_shake_x_dir = choose(-1, 1);
screen_shake_y_dir = choose(-1, 1);
