extends NodeState

# 相当于复制这玩意需要重新赋值吗，是函数还是固定的
@export var player:Player ;
@export var animated_sprite_2d:AnimatedSprite2D;




func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	var direction = player.facing_direction;
	if direction == Vector2.DOWN:
		animated_sprite_2d.play('idle_front')
	elif direction == Vector2.UP:
		animated_sprite_2d.play('idle_back')
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play('idle_left')
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play('idle_right')
	else:
		animated_sprite_2d.play('idle_front')


func _on_next_transitions() -> void:
	if GameInputCheck.check_input_move():
		transition.emit('Walk');
	var is_hit = GameInputCheck.check_input_hit(self);
		
		
	if is_hit && player.current_tool == DataType.Tool.AxeWood:
		transition.emit('Chopping');
		
	if is_hit && player.current_tool == DataType.Tool.WaterCrops:
		transition.emit('Watering');
		
	if is_hit && player.current_tool == DataType.Tool.TillGround:
		transition.emit('Tilling');
		

func _on_enter() -> void:
	pass



func _on_exit() -> void:
	animated_sprite_2d.stop();
