extends Control

var time
var finalscore

func _ready() -> void:
	PlayerData.showscore = false
	PlayerData.timer_on = false

func _process(delta: float) -> void:
	time = str(PlayerData.totaltime)
	$Score.text = "Initial Score: " + str(PlayerData.score)
	$Time.text = "Time Taken (seconds) : " + time
	finalscore = PlayerData.score * 100
	if not finalscore <= 0 or not PlayerData.totaltime <= 0:
		finalscore = finalscore / PlayerData.totaltime
	else:
		finalscore = 0
	$FinalScore.text = "Final Score: " + str(finalscore)
	if finalscore >= 550:
		$Success.text = "You Passed!"
	else:
		$Success.text = "You Failed!  A minimum score of 550 is needed to pass!"
