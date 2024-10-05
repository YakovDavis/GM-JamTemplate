
if (!focused)
{
	return;
}

var _frac = (mouse_x - (x + knob_lmargin)) / (sprite_width - knob_rmargin - knob_lmargin);
slider_pos = clamp(_frac, 0, 1);

event_user(0);
