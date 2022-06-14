extends Area2D

signal portal_entered


export(String, FILE, "*.tscn") var target_scene

func _ready() -> void:
	PlayerData.levelup = false

func next_level():
	PlayerData.levelup = true
	get_tree().change_scene(target_scene)


func _on_Portal_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		emit_signal("portal_entered")
		PlayerData.level = PlayerData.level + 1
		yield(get_tree().create_timer(1.2), "timeout")
		next_level()
	else:
		pass
