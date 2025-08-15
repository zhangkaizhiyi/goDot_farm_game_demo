extends NodeState

@export var animated_sprite_2d: AnimatedSprite2D;
@export var navigation_agent_2d: NavigationAgent2D;
@export var chicken: Chicken;
@export var speed = 0.0;
@export var max_speed = 15.0;
@export var min_speed = 5.0;


# 这里执行的时候还是在Idle的时候，
func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(on_velocity_computed);
	await get_tree().create_timer(randf_range(0.1,0.5)).timeout
	set_target_postion();

func set_target_postion():
	var target_position = NavigationServer2D.map_get_random_point(
		navigation_agent_2d.get_navigation_map(),
		navigation_agent_2d.navigation_layers,
		false
	);
	navigation_agent_2d.target_position = target_position;
	speed = randf_range(max_speed,min_speed);


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		chicken.current_walk_cycle += 1;
		set_target_postion();
		return;
	
	var target_postion = navigation_agent_2d.get_next_path_position();
	var direction = chicken.global_position.direction_to(target_postion);
	animated_sprite_2d.flip_h = direction.x < 0 ;
	var velocity = direction * speed;
	if navigation_agent_2d.avoidance_enabled:
		navigation_agent_2d.velocity = velocity;
	else:
		chicken.velocity = velocity;
		chicken.move_and_slide();

func on_velocity_computed(velocity:Vector2):
	chicken.velocity = velocity;
	chicken.move_and_slide();



func _on_next_transitions() -> void:
	if chicken.current_walk_cycle == chicken.walk_cycle:
		chicken.velocity = Vector2.ZERO;
		transition.emit('Idle')


func _on_enter() -> void:
	chicken.current_walk_cycle = 0;
	animated_sprite_2d.play("walk");
	

func _on_exit() -> void:
	animated_sprite_2d.stop();
	
