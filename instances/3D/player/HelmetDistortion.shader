shader_type canvas_item;

uniform float power: hint_range(0, 2);
uniform vec2 offset = vec2(0.5, 0.5);

void fragment() {
	vec2 dist_uv = SCREEN_UV;
	dist_uv -= offset;
	vec2 norm_uv = normalize(dist_uv);
	float len = length(dist_uv);
	dist_uv = (sin(len * power) / power) * norm_uv;
	dist_uv += offset;
	COLOR.rgb = texture(SCREEN_TEXTURE, dist_uv).rgb;
}
