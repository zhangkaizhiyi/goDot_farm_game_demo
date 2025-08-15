extends NodeState

@export var player:Player ;
@export var animated_sprite_2d:AnimatedSprite2D;
@export var hit_collision_shape_2d: CollisionShape2D


func _ready() -> void:
	pass;
	#hit_collision_shape_2d.disabled = true;
	#hit_collision_shape_2d.position = Vector2(0,0);



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
		animated_sprite_2d.play('watering_front')
		hit_collision_shape_2d.position = Vector2(0,3);
	elif direction == Vector2.UP:
		animated_sprite_2d.play('watering_back')
		hit_collision_shape_2d.position = Vector2(0,-18);
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play('watering_left')
		hit_collision_shape_2d.position = Vector2(-9,0);
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play('watering_right')
		hit_collision_shape_2d.position = Vector2(9,0);
	else:
		animated_sprite_2d.play('watering_front')
		hit_collision_shape_2d.position = Vector2(0,3);
		
	hit_collision_shape_2d.disabled = false;


func _on_exit() -> void:
	animated_sprite_2d.stop();
	hit_collision_shape_2d.disabled = true;
	hit_collision_shape_2d.position = Vector2(0,0);
