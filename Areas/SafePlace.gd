extends Area2D

onready var timer = $Timer
var time_left
var time_text
var isRunning = true
export(int) var wait_time

	
func _process(delta: float) -> void:
	timer.wait_time = wait_time
	if time_left == 0:
		time_text = " "
	else:
		time_text = str(time_left)
	$CanvasLayer/RichTextLabel.clear()
	time_left = timer.time_left
	$CanvasLayer/RichTextLabel.add_text("\nTime Left: " + time_text)
	
func _on_Timer_timeout() -> void:
	print("ur ded")


func _on_SafePlace_body_entered(body: Node) -> void:
	timer.stop()


func _on_SafePlace_body_exited(body: Node) -> void:
	timer.start()


func _on_Portal_portal_entered() -> void:
	timer.stop()
