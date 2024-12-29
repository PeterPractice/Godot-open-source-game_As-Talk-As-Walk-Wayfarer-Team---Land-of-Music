// Provenance: https://godotshaders.com/shader/2d-water-shader/

shader_type canvas_item;

uniform vec2 time_factor = vec2(1.0, 1.0);
uniform vec2 offset_factor = vec2(1.0, 1.0);
uniform vec2 amplitude = vec2(0.05, 0.05);
uniform int directionX = 1; // Rang: 1, or -1 
uniform int directionY = 1; // Rang: 1, or -1

void fragment() {
	vec2 tiled_uvs = UV;
	
	vec2 wave_uv_offset;
	wave_uv_offset.x += sin((TIME * time_factor.x) + (float(directionX) * tiled_uvs.x * offset_factor.x));
	wave_uv_offset.x += cos((TIME * time_factor.y) + (float(directionY) * tiled_uvs.y * offset_factor.y));
	
	COLOR = texture(TEXTURE, tiled_uvs + wave_uv_offset * amplitude);
}