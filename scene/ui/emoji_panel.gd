extends Panel
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer


var animate_arr = ["emote_smell","emote_ear","emote_sleep","emote_idle",];



func _ready() -> void:
	InventoryManager.sg_inventory_change.connect(on_inventory_change);


#==============================  MARK:  ============================== 
func on_inventory_change(object_name:String):
	play_emote('emote_cheer')



# 每五秒换一个动画，替换当前的，也有可能马上被换
func play_emote(name:String) -> void:
	animated_sprite_2d.play(name);


# 五秒执行一次
func _on_timer_timeout() -> void:
	var random_value = animate_arr[randi() % animate_arr.size()];
	animated_sprite_2d.play(random_value)
