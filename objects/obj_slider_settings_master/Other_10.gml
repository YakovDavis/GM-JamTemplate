/// @description On slider position update

global.master_volume = slider_pos;

with (obj_game_controller)
{
	event_user(1);
}
