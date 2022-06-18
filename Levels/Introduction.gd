extends Node2D

func _ready() -> void:
	var dialogue = Dialogic.start("Introduction")
	add_child(dialogue)
	PlayerData.timer_on = false
