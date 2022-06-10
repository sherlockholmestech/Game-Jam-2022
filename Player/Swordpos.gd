extends Position2D

var oldrotate
var newrotate

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("attack"):
		$Timer.start()
		$SwordArea/CollisionShape2D.disabled = false
	else:
		pass
	oldrotate = rotation_degrees
	if oldrotate >= 360:
		newrotate = oldrotate - 360
		rotation_degrees = newrotate
	if oldrotate <= -1:
		newrotate = oldrotate + 360
		rotation_degrees = newrotate
	else:
		pass
	if rotation_degrees >= 90 and rotation_degrees <= 270:
		$SwordArea/Sword.flip_v = true
	else:
		$SwordArea/Sword.flip_v = false

func _on_Timer_timeout() -> void:
	$SwordArea/CollisionShape2D.disabled = true
