/// @description Pause game key

if (room == rm_game)
{
	set_game_paused(true);
}
else if (room == rm_pause)
{
	set_game_paused(false);
}
