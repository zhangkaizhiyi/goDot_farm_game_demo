extends Node2D
@onready var hurt_compoment: HurtCompoment = $HurtCompoment
@onready var grow_cycle_compoment: GrowCycleCompoment = $GrowCycleCompoment
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var watering_particles_2d: GPUParticles2D = $WateringParticles2D

var tomato_scene = preload("res://scene/object/tomato/tomato_harvest.tscn")


func _ready() -> void:
	watering_particles_2d.emitting = false;
	hurt_compoment.sg_hurt.connect(on_hurt);
	grow_cycle_compoment.sg_harvest.connect(on_harvest);
	
func _process(delta: float) -> void:
	sprite_2d.frame = grow_cycle_compoment.current_grow_state + 6;
	
	
func on_hurt(damage:int):
	if !grow_cycle_compoment.is_watered:
		watering_particles_2d.emitting = true;
		await  get_tree().create_timer(5).timeout;
		watering_particles_2d.emitting = false;
		grow_cycle_compoment.is_watered = true;

func on_harvest():
	var tomato = tomato_scene.instantiate() as Node2D;
	tomato.global_position = global_position;
	get_parent().add_child(tomato);
	
	queue_free();
