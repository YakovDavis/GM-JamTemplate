
draw_self();

draw_sprite(knob_sprite, 0, x + knob_lmargin + slider_pos * (sprite_width - knob_rmargin - knob_lmargin), y + knob_vofffset);

draw_set_font(text_font);
draw_set_halign(fa_right)
draw_set_valign(fa_middle)
draw_text(x - text_hoffset, y + text_voffset, text);
