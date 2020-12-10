var vc = view_camera[0];
var vw = camera_get_view_width(vc);
var vh = camera_get_view_height(vc);
// this will be target game resolution:
game_width = vw;
game_height = vh;

// prevent default scaling behaviour:
surface_resize(application_surface, vw, vh);
display_set_gui_size(vw, vh);

smooth = false;
view_surf = -1;

// dragging variables:
dragging = false;
drag_x = 0;
drag_y = 0;