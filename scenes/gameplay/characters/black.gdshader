shader_type canvas_item;
uniform float SPEED = 1.0;
void fragment(){
	COLOR /= abs(cos(TIME*SPEED+(FRAGCOORD.x/FRAGCOORD.y)))* 0.9;
	COLOR.r *= 1.25 + abs(sin(TIME*3.0-SPEED/(FRAGCOORD.x+FRAGCOORD.y))*1.25);
//	COLOR -= abs(tan(TIME * SPEED * FRAGCOORD.x/FRAGCOORD.y)/6.0);
}