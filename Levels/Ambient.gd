extends AudioStreamPlayer



func _on_Portal_portal_entered() -> void:
	$AnimationPlayer.play("fade")
	yield(get_tree().create_timer(1), "timeout")
