shader_type canvas_item;
uniform float speed; 
void fragment(){
	if(COLOR.b > 0.2)
		COLOR.r /= abs(fract(TIME*speed + SCREEN_UV.x + SCREEN_UV.y));
}