extends Node

var score = 0
var isonfire = false
var isfrozen = false


func _process(delta: float) -> void:
	if score > 0:
		$CanvasLayer/Label.visible = true
		$CanvasLayer/Label.text = "Score: %s" % score
	else:
		$CanvasLayer/Label.visible = false

