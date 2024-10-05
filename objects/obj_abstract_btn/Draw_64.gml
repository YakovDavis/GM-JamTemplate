
var _subimg = is_disabled ? 2 : (is_focused ? 1 : 0);
_subimg = min(_subimg, sprite_get_number(sprite_index) - 1);

draw_sprite_ext(sprite_index, _subimg, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (should_render_text)
{
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_set_font(text_font); //button_font
	// feather ignore once GM1044
	draw_set_colour(is_focused ? text_color_focused : text_color_unfocused);
	draw_text_ext(x, y, text, text_linesep, sprite_width - text_hmargins * 2);
	draw_set_colour(c_white);
}
