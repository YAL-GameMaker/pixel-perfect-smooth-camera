//if (live_call()) exit;
// keep the actual camera at integer coordinates:
camera_set_view_pos(view_camera[0], floor(x), floor(y));

// toggling smooth camera:
if (keyboard_check_pressed(vk_space)) {
	smooth = !smooth;
	// when enabling smooth camera, we set the view to draw to a surface
	// and disable application_surface so that the game doesn't clear it for nothing:
	application_surface_enable(!smooth);
	
	// in smooth camera mode, the view is made 1px wider and taller so that we can
	// comfortably move it up/left by 0..1px without any seams coming up:
	var pad = smooth ? 1 : 0;
	camera_set_view_size(view_camera[0], game_width + pad, game_height + pad);
}

// [re-]create the surface if needed
if (smooth) {
	if (!surface_exists(view_surf)) {
		view_surf = surface_create(game_width + 1, game_height + 1);
	}
	view_surface_id[0] = view_surf;
} else {
	if (surface_exists(view_surf)) {
		surface_free(view_surf);
		view_surf = -1;
	}
	view_surface_id[0] = -1;
}