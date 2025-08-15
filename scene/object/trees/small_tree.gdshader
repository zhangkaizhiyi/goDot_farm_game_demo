shader_type canvas_item;


uniform float shake_intensity = 0.0;
uniform float shake_speed = 20.0;


void vertex() {
	//float height_factor = clamp(-VERTEX.y / 30.0, 0.0, 1.0);
	if (VERTEX.y < 0.0){
		// 这还是固定套路，越相位统一，越觉得幅度小？
		VERTEX.x += sin(TIME * shake_speed + VERTEX.y) * shake_intensity;
	}

	//VERTEX.x += sin(TIME * shake_speed) * shake_intensity * height_factor;
}


//void fragment() {
	//vec4 col = texture(TEXTURE, UV);
	//float gray = col.x * 0.299 + col.y * 0.587 + col.z * 0.114;
    ////float gray = dot(col.rgb, vec3(0.299, 0.587, 0.114));
    //COLOR = vec4(vec3(gray), col.a);
//}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
