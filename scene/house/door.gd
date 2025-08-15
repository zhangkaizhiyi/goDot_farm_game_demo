extends StaticBody2D


@onready var interection_compoment = $InterectionCompoment;
@onready var animated_sprite_2d = $AnimatedSprite2D;


func _ready() -> void:
	collision_layer = 1;
	# interection_compoment 是单独的一个组件，单独设置一个Collsion_layer只为了检测玩家emit事件
	interection_compoment.interable_activated.connect(on_interable_activated);
	interection_compoment.interable_deactivated.connect(on_interable_deactivated);


 

func on_interable_activated():
	animated_sprite_2d.play("open_door");
	collision_layer = 2;


func on_interable_deactivated():
	animated_sprite_2d.play("close_door");
	collision_layer = 1;
