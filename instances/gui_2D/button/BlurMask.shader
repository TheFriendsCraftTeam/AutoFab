shader_type canvas_item;

uniform sampler2D mask : hint_albedo;
uniform float blury : hint_range(0.0, 6.0);
uniform vec4 modulate : hint_color;
uniform vec2 uv_adder = vec2(0.0);

void fragment() {
	COLOR.rgb = mix(COLOR.rgb, modulate.rgb * texture(mask, UV + uv_adder).a, texture(mask, UV + uv_adder).a);
	COLOR.rgb = mix(COLOR.rgb, textureLod(SCREEN_TEXTURE, SCREEN_UV, blury * texture(mask, UV).a).rgb, texture(mask, UV).a);
	COLOR.a = texture(mask, UV + uv_adder).a;
	
}
