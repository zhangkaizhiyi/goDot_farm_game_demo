extends PanelContainer
@onready var lb_log: Label = $MarginContainer/VBoxContainer/ItemLog/lbLog
@onready var lb_egg: Label = $MarginContainer/VBoxContainer/PanelContainer2/lbEgg
@onready var lb_pubble: Label = $MarginContainer/VBoxContainer/PanelContainer3/lbPubble
@onready var lb_corn: Label = $MarginContainer/VBoxContainer/PanelContainer4/lbCorn
@onready var lb_tomato: Label = $MarginContainer/VBoxContainer/PanelContainer5/lbTomato
@onready var lb_milk: Label = $MarginContainer/VBoxContainer/PanelContainer6/lbMilk




func _ready() -> void:
	InventoryManager.sg_inventory_change.connect(_on_inventory_change);


func _on_inventory_change(object_name:String):
	if object_name == 'log':
		lb_log.text = str(InventoryManager.inventory[object_name]);
	elif object_name == 'egg':
		lb_egg.text = str(InventoryManager.inventory[object_name]);
	elif object_name == 'milk':
		lb_milk.text = str(InventoryManager.inventory[object_name]);
	elif object_name == 'corn':
		lb_corn.text = str(InventoryManager.inventory[object_name]);
	elif object_name == 'tomato':
		lb_tomato.text = str(InventoryManager.inventory[object_name]);
	elif object_name == 'stone':
		lb_pubble.text = str(InventoryManager.inventory[object_name]);
	
