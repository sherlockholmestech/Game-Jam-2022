extends CanvasLayer

var ispaused = false setget set_is_paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.ispaused = !ispaused

func set_is_paused(value):
	ispaused = value
	get_tree().paused = ispaused
	$Pause.visible = ispaused


func _on_Resume_pressed() -> void:
	self.ispaused = false


func _on_Quit_pressed() -> void:
	get_tree().quit()
