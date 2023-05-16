shader_type canvas_item;
uniform float speed; 
void fragment(){
	COLOR.r /= 0.70 - sin(TIME*speed + VERTEX.x/VERTEX.y)*0.1;
}