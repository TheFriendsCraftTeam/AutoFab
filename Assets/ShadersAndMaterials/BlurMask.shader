shader_type canvas_item;

uniform sampler2D mask : hint_albedo;
uniform float blury : hint_range(0.0, 6.0);
uniform vec4 modulate : hint_color;

void fragment() {
	COLOR.rgb = mix(textureLod(SCREEN_TEXTURE, SCREEN_UV, blury * texture(mask, UV).a).rgb, modulate.rgb, modulate.a);
	COLOR.a = texture(mask, UV).a;
	
}
