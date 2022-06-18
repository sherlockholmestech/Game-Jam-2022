extends Node2D

func _ready() -> void:
	var dialogue = Dialogic.start("Level 1")
	add_child(dialogue)
	PlayerData.timer_on = true
