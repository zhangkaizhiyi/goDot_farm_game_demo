extends NodeState
@export var animated_sprite_2d:AnimatedSprite2D;
@export var cow: Cow;
@export var navigation_agent_2d: NavigationAgent2D;
@export var speed = 10.0;


func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(on_velocity_computed);
	await get_tree().create_timer(randf_range(0.1,0.5)).timeout
	set_target_position();

func set_target_position():
	var target_position = NavigationServer2D.map_get_random_point(
		navigation_agent_2d.get_navigation_map(),
		navigation_agent_2d.navigation_layers,
		false
	);
	navigation_agent_2d.target_position = target_position;
	speed = randf_range(5,15)


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		cow.current_walk_cycle += 1;
		set_target_position();
		return;
		
	var target_positon = navigation_agent_2d.get_next_path_position();
	var direction = cow.global_position.direction_to(target_positon);
	var velocity = direction * speed;
	if navigation_agent_2d.avoidance_enabled:
		navigation_agent_2d.velocity = velocity;
	else:
		animated_sprite_2d.flip_h = velocity.x < 0 ;
		cow.velocity = velocity;
		cow.move_and_slide();

func on_velocity_computed(velocity:Vector2):
	animated_sprite_2d.flip_h = velocity.x < 0 ;
	cow.velocity = velocity;
	cow.move_and_slide();

func _on_next_transitions() -> void:
	if cow.current_walk_cycle == cow.walk_cycle:
		transition.emit('Idle');


func _on_enter() -> void:
	cow.current_walk_cycle = 0;
	animated_sprite_2d.play('walk');

func _on_exit() -> void:
	animated_sprite_2d.stop();
