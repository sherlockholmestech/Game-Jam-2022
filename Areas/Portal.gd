extends Area2D

signal portal_entered


export(String, FILE, "*.tscn") var target_scene


func next_level():
	get_tree().change_scene(target_scene)


func _on_Portal_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		emit_signal("portal_entered")
		yield(get_tree().create_timer(1.2), "timeout")
		next_level()
	else:
		pass
