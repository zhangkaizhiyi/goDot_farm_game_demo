class_name GameInputCheck


static func check_input_direction()->Vector2:
	var input_direction = Vector2.ZERO; 
	if Input.is_action_pressed("move_left"):
		input_direction = Vector2.LEFT;
	elif Input.is_action_pressed("move_right"):
		input_direction = Vector2.RIGHT;
	elif Input.is_action_pressed("move_up"):
		input_direction = Vector2.UP;
	elif Input.is_action_pressed("move_down"):
		input_direction = Vector2.DOWN;
	else:
		input_direction = Vector2.ZERO; 
	input_direction = input_direction.normalized();
	return input_direction;
	
	
static func check_input_move()->bool:
	var input_direction = check_input_direction(); 
	var is_input_move =  input_direction != Vector2.ZERO; 
	return is_input_move;


static func check_input_hit(node: Node)->bool:
	var is_input_hit =  Input.is_action_pressed("hit"); 
	return is_input_hit;
	#if Input.is_action_pressed("hit"):
		#var hovered := node.get_viewport().gui_get_hovered_control()
		#if hovered == null:
			#return true
	#return false
