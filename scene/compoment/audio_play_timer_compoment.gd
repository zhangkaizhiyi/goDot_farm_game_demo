class_name AudioPlayTimerCompoment
extends Timer

@export var audio_player:AudioStreamPlayer2D;


func _on_timeout() -> void:
	audio_player.play();
