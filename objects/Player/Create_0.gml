/// @description Insert description here
// You can write your code in this editor


function move(dx, dy)
{
var pspeed = .1
var angle = degtorad(image_angle)
var x_speed = (cos(angle) * dx + sin(angle) * dy) * pspeed; 
var y_speed = (sin(angle) * dx + cos(angle) * dy) * pspeed;

var other_obj = instance_position(x + x_speed, y + y_speed, Wall);

if (other_obj != noone) {
    
     x_speed = 0; 
     y_speed = 0;
    
}


x += x_speed;
y += y_speed;

}


function rotate(change)
{
	image_angle += change
}


