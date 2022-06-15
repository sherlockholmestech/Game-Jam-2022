extends Control

onready var _transition_rect := $SceneTransitionRect

func _ready() -> void:
	PlayerData.timer_on = false

func _on_Button_pressed() -> void:
	$WindowDialog.visible = true


func _on_About_pressed() -> void:
	$Ambient/AnimationPlayer.play("fade")
	yield(get_tree().create_timer(1), "timeout")
	_transition_rect.transition_to("res://About.tscn")


func _on_Quit_pressed() -> void:
	$Ambient/AnimationPlayer.play("fade")
	yield(get_tree().create_timer(1), "timeout")
	get_tree().quit()


func _on_Ok_pressed() -> void:
	PlayerData.username = $WindowDialog/LineEdit.text
	print(PlayerData.username)
	$WindowDialog.visible = false
	$Ambient/AnimationPlayer.play("fade")
	yield(get_tree().create_timer(1), "timeout")
	_transition_rect.transition_to("res://Levels/Introduction.tscn")
