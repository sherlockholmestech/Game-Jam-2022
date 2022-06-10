extends Control

onready var _transition_rect := $SceneTransitionRect



func _on_Button_pressed() -> void:
	_transition_rect.transition_to("res://Levels/Introduction.tscn")


func _on_About_pressed() -> void:
	_transition_rect.transition_to("res://About.tscn")


func _on_Quit_pressed() -> void:
	get_tree().quit()
