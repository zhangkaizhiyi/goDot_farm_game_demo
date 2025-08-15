extends Node2D
var ballon_scene = preload('res://dialogue/game_dialogue_balloon.tscn'); 


@onready var interable_label_compoment: Control = $InterableLabelCompoment
@onready var interection_compoment: InterectionCompoment = $InterectionCompoment

func _ready() -> void:
	interable_label_compoment.hide();
	interection_compoment.interable_activated.connect(on_interable_activated);
	interection_compoment.interable_deactivated.connect(on_interable_deactivated);

func on_interable_activated():
	interable_label_compoment.show();


func on_interable_deactivated():
	interable_label_compoment.hide();


func _unhandled_input(event: InputEvent) -> void:
	if interable_label_compoment.visible:
		if event.is_action_pressed("show_dialogue"):
			var balloon:BaseGameDialogueBalloon = ballon_scene.instantiate();
			get_tree().root.add_child(balloon);
			balloon.start(load("res://dialogue/conversions/ guide.dialogue"),'start'); 
