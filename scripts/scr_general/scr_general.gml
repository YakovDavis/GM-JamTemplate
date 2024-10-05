/// @function set_game_paused(_paused);
/// @param {Bool} _paused pause or unpause game
/// @returns {Any}
function set_game_paused(_paused)
{
	if (global.is_paused == _paused)
	{
		return;
	}
	with (obj_abstract_gameobject)
	{
		if (visible_in_game)
		{
			visible = !_paused;
		}
	}
	if (_paused)
	{
		with (obj_game_controller)
		{
			event_user(2);
		}
	}
	else
	{
		room_goto(rm_game);
	}
	global.is_paused = _paused;
}

/// @function start_game();
/// @returns {Any}
function start_game()
{
	global.is_paused = false;
	global.is_ingame = true;
	with (obj_game_controller)
	{
		event_user(0);
	}
}

/// @function quit_to_menu();
/// @returns {Any}
function quit_to_menu()
{
	clear_persistent_objects();
	global.is_ingame = false;
	room_goto(rm_menu);
}

/// @function clear_persistent_objects();
/// @description Removes persistent objects created in game (except game controller, cursor etc)
/// @returns {Any}
function clear_persistent_objects()
{
	with (obj_abstract_gameobject)
	{
		instance_destroy();
	}
}

/// @function game_over();
/// @returns {Any}
function game_over()
{
	set_game_paused(true);
	room_goto(rm_gameover);
	clear_persistent_objects();
}
