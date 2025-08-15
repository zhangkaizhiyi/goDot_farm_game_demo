extends NodeState

@export var player:Player ;
@export var animated_sprite_2d:AnimatedSprite2D;

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass
		


func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit('Idle');


func _on_enter() -> void:
	var direction = player.facing_direction;

	if direction == Vector2.DOWN:
		animated_sprite_2d.play('tilling_front')
	elif direction == Vector2.UP:
		animated_sprite_2d.play('tilling_back')
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play('tilling_left')
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play('tilling_right')
	else:
		animated_sprite_2d.play('tilling_front')



func _on_exit() -> void:
	animated_sprite_2d.stop();
