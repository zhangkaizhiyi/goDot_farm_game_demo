class_name Player
extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D;
@onready var hit_compoment: HitCompoment = $HitCompoment




var facing_direction:Vector2 = Vector2.DOWN;
@export var current_tool = DataType.Tool.None;

#
#func _physics_process(delta: float) -> void:
	#var input_direction = _check_input_direction();
	#
	#if input_direction != Vector2.ZERO:
		#facing_direction = input_direction;
	#
	#
	#if input_direction != Vector2.ZERO:
		#_player_animate('walk');
	#else:
		#_player_animate('idle');
	#
			#
	#velocity = speed * input_direction;
	#move_and_slide();
	

func _ready() -> void:
	ToolManager.tool_selected.connect(on_tool_selected);


func on_tool_selected(tool:DataType.Tool):
	current_tool = tool;
	hit_compoment.tool = tool;


func _check_input_direction()->Vector2:
	var input_direction:Vector2;
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

# 这个函数依赖于相同的命名方式，实际上不同state最好维护自己状态	
func _player_animate(state_name:String):
	var direction_name = 'front';
	if facing_direction.x > 0:
		direction_name = 'right';
	elif facing_direction.x < 0:
		direction_name = 'left';
	elif facing_direction.y < 0:
		direction_name = 'back';
	elif facing_direction.y > 0:
		direction_name = 'front';
	
	var animation_name = state_name + '_' + direction_name;
	animated_sprite_2d.play(animation_name);
