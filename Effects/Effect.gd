extends AnimatedSprite


func _ready():
		connect("animation_finished", self , "_on_Animation_animation_finished")
		frame = 0
		play("Animate")
	


func _on_Animation_animation_finished() -> void:
	queue_free()
