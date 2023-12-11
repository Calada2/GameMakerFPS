


function getPlayerPos()
{
	var target_layer = layer_get_id("Instances"); 


	var target_object = instance_find(Player, 0);
	global.player_x = target_object.x; 
    global.player_y = target_object.y; 
	global.player_angle = target_object.image_angle
}

getPlayerPos()
global.fov = 40
function trace()
{
	var angleStep = global.fov / room_width
	var angleStart = global.player_angle - global.fov / 2
	var precision = 10
	var max_distance = 1000
	for(var n = 0; n < room_width; ++n) if(n % 4 == 0)
	{
		var rX = global.player_x
		var rY = global.player_y
		
		var angle = angleStart + 90 + n * angleStep
		
		var len = 0
		
		
		var end_x = rX + lengthdir_x(max_distance, angle);
		var end_y = rY + lengthdir_y(max_distance, angle);

		var hit = collision_line_point(rX, rY, end_x, end_y, Wall, false, true);
		
		var hitObj = noone

		if (hit[0] != noone) {
			
			hitObj = Sprite25
		} 
		//Sort these based on distance
		if(hitObj == noone)
		{
			hit = collision_line_point(rX, rY, end_x, end_y, Wall2, false, true);

			if (hit[0] != noone) {
				hitObj = Sprite3
			} 
		}
		
		
		if(hitObj != noone)
		{
			var distance = point_distance(rX, rY, hit[1], hit[2]);
			
			distance = cos(degtorad(angleStart + ((n - global.fov/2) * angleStep) - global.player_angle)) * distance
			var miss = (room_height - (room_height / (distance / 15))) / 2 
		
			if(n % 1 == 0)drawLine(n, miss, hitObj, ((round(hit[1] * 10) * 1 + round(hit[2] * 10))), 4)
			//drawLine(n, miss, hitObj, n/4, 1)
			continue
		}
		
	}
}


