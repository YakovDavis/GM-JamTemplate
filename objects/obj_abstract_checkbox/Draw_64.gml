
draw_sprite(sprite_index, checked ? 1 : 0, x, y);

draw_set_font(text_font);
draw_set_color(c_white);
draw_set_halign(fa_right)
draw_set_valign(fa_middle)
draw_text(x - text_hoffset, y + text_voffset, text);
