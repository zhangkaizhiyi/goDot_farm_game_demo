shader_type canvas_item;

// 这个source_color的作用看起来是声明了这是一个颜色选择器而已
uniform vec4 target_color_1:source_color;
uniform vec4 target_color_2:source_color;
uniform vec4 replace_color_1:source_color;
uniform vec4 replace_color_2:source_color;
const float precision = 0.1;


void fragment() {
	vec4 color = texture(TEXTURE, UV);
	if(distance(target_color_1,color) <= precision){
		color = replace_color_1;
	}

	if(distance(target_color_2,color) <= precision){
		color = replace_color_2;
	}

	COLOR = color;
}
