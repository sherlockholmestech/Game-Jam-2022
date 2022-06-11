extends KinematicBody2D

var run_speed = 60
var velocity = Vector2.ZERO
var player = null
onready var stats = $Stats
onready var progressbar = $TextureProgress


func _physics_process(delta):
	if player:
		velocity = position.direction_to(player.position) * run_speed
	velocity = move_and_slide(velocity)
	progressbar.value = stats.health

func _on_PlayerDetectionZone_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		player = body


func _on_PlayerDetectionZone_body_exited(body: Node) -> void:
	player = null


func _on_Stats_no_health() -> void:
	PlayerData.score = PlayerData.score + stats.max_health
	queue_free()


func _on_Hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("SwordHitbox"):
		stats.health -= area.damage
