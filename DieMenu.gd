extends Control

var scoretext

func _on_Button_pressed() -> void:
	$CanvasLayer/UI.visible = false
	PlayerData.timer_on = true
	get_tree().reload_current_scene()


func _on_Player_die_screen() -> void:
	scoretext = str(PlayerData.score)
	$CanvasLayer/UI.visible = true
	$CanvasLayer/UI/Time.clear()
	$CanvasLayer/UI/Time.add_text("Score: " + scoretext)
