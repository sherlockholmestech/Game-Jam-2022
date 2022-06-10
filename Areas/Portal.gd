extends Area2D

signal portal_entered

onready var _transition_rect := $SceneTransitionRect

export(String, FILE, "*.tscn") var target_scene


func next_level():
	get_tree().change_scene(target_scene)


func _on_Portal_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		emit_signal("portal_entered")
		next_level()
	else:
		pass
