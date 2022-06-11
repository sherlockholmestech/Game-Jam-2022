extends Control

onready var _transition_rect := $SceneTransitionRect


func _on_Button_pressed() -> void:
	$Chirps/AnimationPlayer.play("fade")
	yield(get_tree().create_timer(1), "timeout")
	_transition_rect.transition_to("res://MainScreen.tscn")
