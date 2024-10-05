/// @function shake_screen();
/// @returns {Any}
function shake_screen()
{
	if (!global.screenshake_enabled)
	{
		return;
	}
	with (obj_game_camera)
	{
		event_user(1);
	}
}
