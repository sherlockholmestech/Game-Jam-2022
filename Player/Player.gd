extends KinematicBody2D

export var ACCELERATION = 500
export var MAX_SPEED = 80
export var ROLL_SPEED = 125
export var FRICTION = 500
var currentarea
var currentdamage
var deductaccel
var freeze
onready var stats = $Stats
onready var regentimer = $RegenTimer
signal die_screen
signal died

const DeathEffect = preload("res://Effects/DeathEffect.tscn")

var velocity = Vector2.ZERO

func _ready() -> void:
	pause_mode = Node.PAUSE_MODE_INHERIT

func _physics_process(delta: float) -> void:
	$TextureProgress.value = stats.health
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

func die():
	PlayerData.died += 1
	queue_free()
	var deathEffect = DeathEffect.instance()
	get_parent().add_child(deathEffect)
	deathEffect.global_position = global_position
	emit_signal("died")
	emit_signal("die_screen")
	PlayerData.score = 0
	PlayerData.time_elapsed = 0


func _on_Timer_timeout() -> void:
	die()


func _on_Stats_no_health() -> void:
	die()



func _on_Hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("ZombieHitbox"):
		currentarea = area
		$Damage.play(0)
		stats.health -= area.damage
		currentdamage = area.damage
		$DamageTimer.start()
	if area.is_in_group("FlameHitbox"):
		PlayerData.isonfire = true
		if PlayerData.isonfire:
			fire_damage()
	else:
		currentarea = null




func _on_RegenTimer_timeout() -> void:
	if stats.health <= 16:
		stats.health = stats.health + 4
	if stats.health == 17:
		stats.health = stats.health + 3
	if stats.health == 18:
		stats.health = stats.health + 2
	if stats.health == 19:
		stats.health = stats.health + 1
	else:
		regentimer.start()


func _on_SpeedPotion_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		$EffectIco/Speed.visible = true
		ACCELERATION = ACCELERATION + 200
		MAX_SPEED = MAX_SPEED + 50
		$PotionLength.start()
		deductaccel = true


func _on_PotionLength_Speed_timeout() -> void:
	if deductaccel:
		$EffectIco/Speed.visible = false
		self.ACCELERATION = ACCELERATION - 200
		self.MAX_SPEED = MAX_SPEED - 50
		deductaccel = false




func _on_Hitbox_area_exited(area: Area2D) -> void:
	if area.is_in_group("FlameHitbox"):
		PlayerData.isonfire = false
	if area.is_in_group("ZombieHitbox"):
		yield(get_tree().create_timer(2), "timeout")
		$DamageTimer.stop()
		currentarea = null


func _on_DamageTimer_timeout() -> void:
	if not currentarea == null:
		$Damage.play(0)
		stats.health -= currentdamage

func fire_damage():
	$Damage.play()
	$AnimatedSprite.visible = true
	$AnimatedSprite.play("Animate")
	stats.health -= 1
	yield(get_tree().create_timer(2), "timeout")
	$Damage.play()
	$AnimatedSprite.play("Animate")
	stats.health -= 1
	yield(get_tree().create_timer(2), "timeout")
	$Damage.play()
	$AnimatedSprite.play("Animate")
	stats.health -= 1
	yield(get_tree().create_timer(2), "timeout")
	$AnimatedSprite.visible = false
	PlayerData.isonfire = false



func _on_FreezePotion_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		PlayerData.isfrozen = true
		freeze = true
		pause_mode = Node.PAUSE_MODE_PROCESS
		$EffectIco/Freeze.visible = true
		get_tree().paused = freeze
		$Freeze.start()


func _on_Freeze_timeout() -> void:
	PlayerData.isfrozen = false
	freeze = false
	pause_mode = Node.PAUSE_MODE_INHERIT
	$EffectIco/Freeze.visible = false
	get_tree().paused = freeze


func _on_PoisonPotion_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		var i = 0
		while i <= 10:
			$EffectIco/Poison.visible = true
			$Damage.play()
			stats.health -= 1
			i += 1
			yield(get_tree().create_timer(1), "timeout")
			$EffectIco/Poison.visible = false
