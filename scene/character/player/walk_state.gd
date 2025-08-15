extends NodeState

@export var player:Player ;
@export var animated_sprite_2d:AnimatedSprite2D;
@export var speed = 50;

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	var direction = GameInputCheck.check_input_direction();
	
	if GameInputCheck.check_input_move():
		player.facing_direction = direction;
	
	if direction == Vector2.DOWN:
		animated_sprite_2d.play('walk_front')
	elif direction == Vector2.UP:
		animated_sprite_2d.play('walk_back')
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play('walk_left')
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play('walk_right')
	else:
		animated_sprite_2d.play('walk_front')
	
	var next_pos = player.global_position + direction * speed * _delta;
	player.velocity = speed * direction
	player.move_and_slide();
 







func _on_next_transitions() -> void:
	if !GameInputCheck.check_input_move():
		transition.emit('Idle');


func _on_enter() -> void:
	pass



func _on_exit() -> void:
	animated_sprite_2d.stop();
