extends KinematicBody2D

export var ACCELERATION = 500
export var MAX_SPEED = 80
export var ROLL_SPEED = 125
export var FRICTION = 500

var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	move_state(delta)

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		velocity = velocity.clamped(MAX_SPEED)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	if velocity.x < 0:
		$Sprite.flip_h = true
	if velocity.x > 0:
		$Sprite.flip_h = false
	else:
		pass
	move()
	
func move():
	velocity = move_and_slide(velocity)
