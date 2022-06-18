extends Control


onready var _transition_rect := $SceneTransitionRect

func _ready() -> void:
	PlayerData.timer_on = false

func _process(delta: float) -> void:
	PlayerData.loadfile()
	if not PlayerData.highscoredata == null:
		$HighScore.text = "Current High Score:\nUsername: " + str(PlayerData.highscoredata["Username"]) + "\nScore: " + str(PlayerData.highscoredata["Score"])


func _on_Button_pressed() -> void:
	_transition_rect.transition_to("res://MainScreen.tscn")
