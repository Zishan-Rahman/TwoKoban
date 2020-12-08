extends Control

func _on_StartButton_pressed():
	MoveStream.clickaudio()
	get_tree().change_scene("res://tscn/Level Select.tscn")

func _on_HelpButton_pressed():
	MoveStream.clickaudio()
	get_tree().change_scene("res://tscn/Help Section.tscn")

func _on_CreditsButton_pressed():
	MoveStream.clickaudio()
	get_tree().change_scene("res://tscn/Credits.tscn")

func _on_QuitButton_pressed():
	MoveStream.clickaudio()
	$ConfirmationDialog.popup()

func _unhandled_input(event):
	if event.is_action_pressed("quick_quit"):
		MoveStream.clickaudio()
		$ConfirmationDialog.popup()

func _ready():
	if GlobalStream.isplay:
		GlobalStream.stream = load("res://assets/tktitle.ogg")
		GlobalStream.play()
		GlobalStream.isplay = false
