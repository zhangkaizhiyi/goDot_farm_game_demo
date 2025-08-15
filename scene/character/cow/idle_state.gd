extends NodeState
@export var animated_sprite_2d:AnimatedSprite2D;
@export var cow: CharacterBody2D;
@export var wait_interval = 5;
@onready var wait_timer:Timer = Timer.new();
var waite_timer_timeout = false;

func _ready() -> void:
	wait_timer.wait_time = wait_interval;
	wait_timer.timeout.connect(on_wait_timer_timeout);
	add_child(wait_timer);

func on_wait_timer_timeout():
	waite_timer_timeout = true;

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if waite_timer_timeout:
		transition.emit('Walk');


func _on_enter() -> void:
	waite_timer_timeout = false;
	animated_sprite_2d.play('idle');
	wait_timer.start();

func _on_exit() -> void:
	animated_sprite_2d.stop();
	wait_timer.stop();
