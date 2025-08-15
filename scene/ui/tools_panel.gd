extends PanelContainer
@onready var tool_tilling: Button = $MarginContainer/HBoxContainer/ToolTilling
@onready var tool_watering_can: Button = $MarginContainer/HBoxContainer/ToolWateringCan
@onready var tool_corn: Button = $MarginContainer/HBoxContainer/ToolCorn
@onready var tool_tomato: Button = $MarginContainer/HBoxContainer/ToolTomato
@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe

 
func _ready() -> void:
	#tool_tomato.disabled = true;
	#tool_corn.disabled = true;
	#tool_watering_can.disabled = true;
	#tool_tilling.disabled = true;
	GameDialogueManager.sg_give_seed.connect(on_give_seed);


func on_give_seed():
	pass


func _on_tool_axe_pressed() -> void:
	ToolManager.select_tool(DataType.Tool.AxeWood);


func _on_tool_tilling_pressed() -> void:
	ToolManager.select_tool(DataType.Tool.TillGround);


func _on_tool_watering_can_pressed() -> void:
	ToolManager.select_tool(DataType.Tool.WaterCrops);


func _on_tool_corn_pressed() -> void:
	ToolManager.select_tool(DataType.Tool.PlantCorn);


func _on_tool_tomato_pressed() -> void:
	ToolManager.select_tool(DataType.Tool.PlantTomato);
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			ToolManager.select_tool(DataType.Tool.None);
			tool_axe.release_focus();
			tool_watering_can.release_focus();
			tool_corn.release_focus();
			tool_tomato.release_focus();
			tool_axe.release_focus();
		
		
