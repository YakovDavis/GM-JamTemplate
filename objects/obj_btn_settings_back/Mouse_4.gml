
event_inherited();

if (global.is_ingame)
{
	room_goto(rm_pause);
}
else
{
	room_goto(rm_menu);
}
