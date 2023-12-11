
function drawStart()
{
	
	var cutout_surface = -1;
	if (!surface_exists(cutout_surface)) {
		cutout_surface = surface_create(room_width, room_height);
	}
	surface_set_target(cutout_surface);
	draw_clear_alpha(c_black, 0);
}
function drawFinish()
{
	var cutout_surface = surface_get_target()
	surface_reset_target();
	draw_surface(cutout_surface, 0, 0);
	surface_free(cutout_surface);
}
function drawLine(x, y, sprite, offset, width)
{
	
var original_sprite = sprite
var original_width = sprite_get_width(original_sprite);
var original_height = sprite_get_height(original_sprite);
var h = room_height - (y * 2)


draw_sprite_part_ext(
		original_sprite,
		-1,
		(offset) % original_width,
		0,
		width,
		original_height,
		x,
		y,
		width,
		h / original_height,
		c_white,
		2 - (y / 300)
	)
	
}
function drawFps()
{
	draw_set_color(c_white);
	draw_text(10, 10, "FPS: " + string(round(fps)));
}

