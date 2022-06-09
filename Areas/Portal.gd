extends Area2D

signal portal_entered

export(PackedScene) var target_scene


func next_level():
	get_tree().change_scene_to(target_scene)


func _on_Portal_body_entered(body: Node) -> void:
	emit_signal("portal_entered")
	next_level()
