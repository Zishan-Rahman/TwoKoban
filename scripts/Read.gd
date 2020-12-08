extends Control

func _ready():
	GlobalStream.stream = load("res://assets/tkread.ogg")
	GlobalStream.play()
	GlobalStream.isplay = true

func _unhandled_input(event):
	if event.is_action_pressed("quick_quit"):
		MoveStream.clickaudio()
		$ConfirmationDialog.popup()
