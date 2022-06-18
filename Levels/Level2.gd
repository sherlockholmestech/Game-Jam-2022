extends Node2D

func _ready() -> void:
	var dialogue = Dialogic.start("Level 2")
	add_child(dialogue)
