extends Control

onready var _transition_rect := $SceneTransitionRect


func _on_Button_pressed() -> void:
	_transition_rect.transition_to("res://MainScreen.tscn")
