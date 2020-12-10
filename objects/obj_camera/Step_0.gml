//if (live_call()) exit;

// standard-issue arrow key movement:
var kx = (keyboard_check(vk_right) - keyboard_check(vk_left));
var ky = (keyboard_check(vk_down) - keyboard_check(vk_up));
var kd = point_distance(0, 0, kx, ky);
if (kd > 1) { kx /= kd; ky /= kd; }
friction = 0.3;
var acc = 0.5;
hspeed += kx * acc;
vspeed += ky * acc;
speed = min(speed, 2.5);

// sloow pan
if (keyboard_check(vk_shift)) { x += 0.1; y += 0.05; }

// all this trouble to get fractional mouse coordinates!
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _wnd_w = window_get_width();
var _wnd_h = window_get_height();
gui_scale = min(_wnd_w / _gui_w, _wnd_h / _gui_h);
var _gui_x = (_wnd_w - _gui_w * gui_scale) div 2;
var _gui_y = (_wnd_h - _gui_h * gui_scale) div 2;
gui_mouse_x = (window_mouse_get_x() - _gui_x) / gui_scale;
gui_mouse_y = (window_mouse_get_y() - _gui_y) / gui_scale;

// see https://yal.cc/gamemaker-click-n-drag-to-pan-view/
if (mouse_check_button_pressed(mb_left)) {
	dragging = true;
	drag_x = gui_mouse_x;
	drag_y = gui_mouse_y;
}
if (dragging) {
	if (mouse_check_button(mb_left)) {
		x -= gui_mouse_x - drag_x;
		y -= gui_mouse_y - drag_y;
		drag_x = gui_mouse_x;
		drag_y = gui_mouse_y;
	} else dragging = false;
}
