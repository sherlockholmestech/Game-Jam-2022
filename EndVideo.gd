extends Control

onready var _transition_rect := $SceneTransitionRect

func _ready() -> void:
	PlayerData.showscore = false
	PlayerData.timer_on = false


func _on_VideoPlayer_finished() -> void:
	_transition_rect.transition_to("res://EndScreen.tscn")
