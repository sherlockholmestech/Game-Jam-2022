extends Node

var pausemenu = false
var timer_on = true
var score = 0
var isonfire = false
var isfrozen = false
var time_elapsed = 0.0
var totaltime = 0
var formattedtime
var levelup = false
var level = 0 setget level_calc
var died = 0 setget die_calc
var showscore = true

func _ready() -> void:
	timer_on = true
	$CanvasLayer/Time.clear()
	
func _process(delta: float) -> void:
	print(died)
	if levelup == false:
		formattedtime = _format_seconds(time_elapsed, false)
	if timer_on:
		time_elapsed += delta
	else:
		pass
	if score > 0 and showscore:
		$CanvasLayer/Score.visible = true
		$CanvasLayer/Score.text = "Score: %s" % score
	else:
		$CanvasLayer/Score.visible = false
	if time_elapsed > 0 and levelup == false and timer_on:
		$CanvasLayer/Time.clear()
		$CanvasLayer/Time.visible = true
		$CanvasLayer/Time.add_text(formattedtime)
	else:
		$CanvasLayer/Time.clear()

func _format_seconds(time : float, use_milliseconds : bool) -> String:
	var minutes := time / 60
	var seconds := fmod(time, 60)
	if not use_milliseconds:
		return "%02d:%02d" % [minutes, seconds]
	var milliseconds := fmod(time, 1) * 100
	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]

func level_calc(level):
	timer_on = false
	totaltime += time_elapsed
	$CanvasLayer/Time.clear()
	$CanvasLayer/Time.visible = false
	print(totaltime)

func die_calc(level):
	timer_on = false
	totaltime += time_elapsed
	$CanvasLayer/Time.clear()
	$CanvasLayer/Time.visible = false
	print(totaltime)
