extends ColorRect

# Path to the next scene to transition to

# Reference to the _AnimationPlayer_ node
onready var _anim_player := $AnimationPlayer


func transition_to(next_scene) -> void:
	
	
	_anim_player.play("fade")
	yield(_anim_player, "animation_finished")
	get_tree().change_scene(next_scene)
	_anim_player.play_backwards("fade")
	yield(_anim_player, "animation_finished")

	
