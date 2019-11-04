shader_type canvas_item;
render_mode unshaded;

uniform float cutoff : hint_range(0, 1);
uniform float blur : hint_range(0, 1);
uniform sampler2D mask : hint_albedo;
uniform vec4 fade_color : hint_color;

void fragment() {
	float val = texture(mask, UV).r;
	float alpha = smoothstep(cutoff, cutoff + blur, val * (1.0 - blur) + blur);
	
	COLOR = vec4(fade_color.rgb, alpha);
	
}