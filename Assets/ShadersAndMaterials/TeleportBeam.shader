shader_type spatial;
render_mode unshaded;

uniform float alpha: hint_range(0, 1, 0.01);
uniform float blur: hint_range(0, 4, 0.01);
uniform float anim_speed: hint_range(0, 1, 0.01);
uniform float force: hint_range(0, 1, 0.01);
uniform sampler2D noise: hint_albedo;

void fragment() {
	ALPHA = alpha;
	
	vec2 moving_uv = UV;
	moving_uv.y -= TIME * -anim_speed;
	
	vec2 distort_uv = texture(noise, moving_uv).rg;
	distort_uv -= vec2(0.5);
	distort_uv *= vec2(UV.y);
	distort_uv *= vec2(force);
	
	vec3 distorted_texture = textureLod(SCREEN_TEXTURE, SCREEN_UV + distort_uv, blur).rgb;
	vec3 color_texture;
	ALBEDO = distorted_texture;
}