shader_type canvas_item;

uniform float blury : hint_range(0.0, 6.0);

void fragment() {
	
	COLOR.rgb = textureLod(SCREEN_TEXTURE,SCREEN_UV, blury).rgb;
	
}
