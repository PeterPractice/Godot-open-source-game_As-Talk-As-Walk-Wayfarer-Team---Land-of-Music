// Provenance: \godot-demo-projects-3.3-2d4d233\2d\screen_space_shaders\shaders\blur.shader

shader_type canvas_item;

uniform float amount: hint_range(0.0, 5.0);

void fragment() {
	COLOR.rgb = textureLod(SCREEN_TEXTURE, SCREEN_UV, amount).rgb;
}
