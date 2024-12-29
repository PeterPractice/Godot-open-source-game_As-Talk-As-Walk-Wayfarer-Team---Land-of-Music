// Provenance: https://godotshaders.com/shader/wind-waker-2d-water-shader-canvas_item/

shader_type canvas_item;

uniform vec4 WATER_COL: hint_color = vec4(0.262745, 0.333333, 0.349019, 1.0);
uniform vec4 WATER2_COL: hint_color = vec4(0.2078431, 0.274509, 0.301960, 1.0);
uniform vec4 FOAM_COL: hint_color = vec4(0.396078, 0.466666, 0.482352, 1.0);

uniform vec2 tile = vec2(1.0, 1.0);

uniform vec2 time_factor = vec2(1.0, 1.0);
uniform vec2 offset_factor = vec2(1.0, 1.0);
uniform vec2 amplitude = vec2(0.05, 0.05);
uniform int directionX = 1; // Rang: 1, or -1 
uniform int directionY = 1; // Rang: 1, or -1

float circ(vec2 pos, vec2 c, float s)
{
	c = abs(pos - c);
	c = min(c, 1.0 - c);
	
	return smoothstep(0.0, 0.002, sqrt(s) - sqrt(dot(c, c))) * -1.0;
}

float waterlayer(vec2 uv)
{
	uv = mod(uv, 1.0); // Clamp to [0..1]
	
	float ret = 1.0;
	ret += circ(uv, vec2(0.99, 0.28), 0.008);
	ret += circ(uv, vec2(0.22, 0.20), 0.015);
	ret += circ(uv, vec2(0.16, 0.52), 0.03);
	ret += circ(uv, vec2(0.40, 0.88), 0.05);
	ret += circ(uv, vec2(0.90, 0.90), 0.07);
	ret += circ(uv, vec2(0.62, 0.39), 0.08);
	
	return max(ret, 0.0);
}

void fragment()
{
	vec2 tiled_uvs = UV * tile;
	
	vec2 wave_uv_offset;
	wave_uv_offset.x += sin((TIME * time_factor.x) + (float(directionX) * tiled_uvs.x * offset_factor.x));
	wave_uv_offset.y += cos((TIME * time_factor.y) + (float(directionY) * tiled_uvs.y * offset_factor.y));
	
	vec2 tiled_uvs1 = tiled_uvs + wave_uv_offset * amplitude;
	vec2 tiled_uvs2 = vec2(1.0) - tiled_uvs1;
	
	vec3 ret = mix(WATER_COL.rgb, WATER2_COL.rgb, waterlayer(tiled_uvs1));
	ret = mix(ret, FOAM_COL.rgb, waterlayer(tiled_uvs2));
	
	COLOR.rgb = vec3(ret);
}