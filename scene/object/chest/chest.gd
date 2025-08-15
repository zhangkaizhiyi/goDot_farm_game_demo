extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var interection_compoment: InterectionCompoment = $InterectionCompoment
@onready var interable_label_compoment: Control = $InterableLabelCompoment
@onready var marker_2d: Marker2D = $Marker2D
@onready var feed_compoment: FeedCompoment = $FeedCompoment



# 如果是纯代码编程，这些属性叫就可以在代码中实例化，但我们是编辑器中实例化
@export var drop_height = 40;
@export var dialogue_start_command:String;
@export var reward_scenes:Array[PackedScene];


var dialogue_scene = preload("res://dialogue/game_dialogue_balloon.tscn")
var corn_scene = preload("res://scene/object/corn/corn_harvest.tscn")
var is_chest_open = false;
var is_you = false; # 是否在和这个箱子互动


func _ready() -> void:
	interable_label_compoment.hide();
	animated_sprite_2d.play("idle");
	
	interection_compoment.interable_activated.connect(on_interable_activated);
	interection_compoment.interable_deactivated.connect(on_interable_deactivated);
	feed_compoment.sg_food_received.connect(on_food_received);
	GameDialogueManager.sg_feed_animal.connect(on_feed_animal);
	

func on_interable_activated():
	interable_label_compoment.show();
	is_you = true;
	
func on_interable_deactivated():
	if is_chest_open:
		animated_sprite_2d.play("chest_close");
		is_chest_open = false;
		
	is_you = false;
	interable_label_compoment.hide();
	
	
	
# 用这个宝箱来保存自己的对话
func _unhandled_input(event: InputEvent) -> void:
	if is_you:
		if event.is_action_pressed("show_dialogue"):
			animated_sprite_2d.play("chest_open");
			interable_label_compoment.hide();
			is_chest_open = true;
			
			var balloon:BaseGameDialogueBalloon = dialogue_scene.instantiate();
			get_tree().root.add_child(balloon);
			balloon.start(load("res://dialogue/conversions/chest.dialogue"),dialogue_start_command); 


func on_feed_animal():
	if is_you:
		var num = InventoryManager.get_object_num('corn');
		if  num == 0:
			return;
		
		for i in range(num):
			var corn = corn_scene.instantiate() as Node2D;
			corn.global_position = Vector2(global_position.x,global_position.y - 40);
			get_tree().root.add_child(corn);
			await  get_tree().create_timer(1.0).timeout;
			
			if corn != null:
				var tween = get_tree().create_tween();
				tween.tween_property(corn,"position",global_position,1);
				tween.tween_property(corn,"scale",Vector2(0.5 ,0.5),1);
				tween.tween_callback(corn.queue_free);
			
				InventoryManager.remove_object_from_inventory('corn')
			
	
	
# 这个箱子只能交互food
func on_food_received(area:Area2D):
	# 应该是为了确保reward都加载了
	call_deferred('add_reward_scene')
	
	
func add_reward_scene():
	for reward_scene in reward_scenes:
		var reward = reward_scene.instantiate() as Node2D;
		reward.global_position = reward_random_position(marker_2d.global_position,20);
		get_tree().root.add_child(reward);
	
	
	
func reward_random_position(center:Vector2,radius:int) -> Vector2i:
	var angel = randf() * TAU;
	# 在圆心生成随机的点，这样会均匀分布
	var distance = sqrt(randf()) * radius;
	
	var x :int = center.x + distance * cos(angel);
	var y :int = center.y + distance * sin(angel);
	
	return Vector2i(x,y);
	
	
