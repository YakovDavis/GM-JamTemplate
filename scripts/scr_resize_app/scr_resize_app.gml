/// @function resize_app(_bw, _bh, _cw, _ch);
/// @param {Real} _bw Base width
/// @param {Real} _bh Base height
/// @param {Real} _cw Current width
/// @param {Real} _ch Current height
/// @returns {Any}

function resize_app(_bw, _bh, _cw, _ch)
{
	var _aspect = (_bw / _bh);
	
	view_wport[0] = (_ch *_aspect);
	view_hport[0] = _ch;
	
	window_set_size(view_wport[0], view_hport[0]);
	
	window_center();
	
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}
