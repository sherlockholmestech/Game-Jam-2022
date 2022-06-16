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
	finalscore = PlayerData.score * 400
	if not finalscore <= 0 or not PlayerData.totaltime <= 0:
		finalscore = finalscore / PlayerData.totaltime
	else:
		finalscore = 0
	PlayerData.playergamedata = {
		"Username" : PlayerData.username,
		"Score" : finalscore
}
	var isfile = File.new()
	if not isfile.file_exists(PlayerData.scorepath):
		PlayerData.savefile()
	PlayerData.loadfile()
	if PlayerData.highscoredata["Score"] < finalscore:
		PlayerData.savefile()
		PlayerData.currenthighscore = PlayerData.playergamedata
	else:
		PlayerData.currenthighscore = PlayerData.highscoredata
	$FinalScore.text = "Final Score: " + str(finalscore)
	if finalscore >= 200:
		$Success.text = "You Passed!"
	else:
		$Success.text = "You Failed!  A minimum score of 200 is needed to pass!"
	$HighScore.text = "Current High Score:\nUsername: " + str(PlayerData.currenthighscore["Username"]) + "\nScore: " + str(PlayerData.currenthighscore["Score"])


func _on_Button_pressed() -> void:
	get_tree().quit()
