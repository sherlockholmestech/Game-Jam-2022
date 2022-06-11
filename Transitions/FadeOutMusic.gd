extends Tween
onready var tween_out = get_node("Tween")

export var transition_duration = 1.00
export var transition_type = 1 # TRANS_SINE

func fade_out(stream_player):
	# tween music volume down to 0
	tween_out.interpolate_property(stream_player, "volume_db", 0, -80, transition_duration, transition_type, Tween.EASE_IN, 0)
	tween_out.start()
	# when the tween ends, the music will be stopped
	
func _on_FadeOutMusic_tween_completed(object: Object, key: NodePath) -> void:
	# stop the music -- otherwise it continues to run at silent volume
	object.stop()
	object.volume_db = 0 # reset volume

