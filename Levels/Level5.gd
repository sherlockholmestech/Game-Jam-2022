extends Node2D

func _ready() -> void:
	var dialogue = Dialogic.start("Level 5")
	add_child(dialogue)
