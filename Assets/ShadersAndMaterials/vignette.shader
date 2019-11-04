shader_type canvas_item;

uniform sampler2D vignette;
uniform float lightness : hint_range(0.0, 10.0);
uniform float blury : hint_range(0.0, 6.0);

void fragment() {
	vec3 vignette_color = texture(vignette, UV).rgb;
	// Screen texture stores gaussian blurred copies on mipmaps
	COLOR.rgb = textureLod(SCREEN_TEXTURE, SCREEN_UV, (1.0 - vignette_color.r) * blury).rgb;
	COLOR.rgb *= min(vec3(lightness).rgb * (vignette_color.rgb + 0.01), vec3(1));
	
	}