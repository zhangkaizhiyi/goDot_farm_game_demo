extends BaseGameDialogueBalloon

@onready var emoji_panel: Panel = $Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/EmojiPanel





func start(dialogue_resource: DialogueResource, 
	title: String, 
	extra_game_states: Array = []) -> void:
	super.start(dialogue_resource,title,extra_game_states);
	emoji_panel.play_emote('emote_talk');


func next(next_id: String) -> void:
	super.next(next_id);
	emoji_panel.play_emote('emote_talk');
