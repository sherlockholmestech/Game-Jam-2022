extends Control


func _on_Button_pressed() -> void:
	$CanvasLayer/UI.visible = false
	get_tree().reload_current_scene()


func _on_Player_die_screen() -> void:
	$CanvasLayer/UI.visible = true
