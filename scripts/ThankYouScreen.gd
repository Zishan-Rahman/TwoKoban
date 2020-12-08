extends Control

func _on_MenuButton_pressed():
	MoveStream.clickaudio()
	get_tree().change_scene("res://tscn/Menu.tscn")

func _on_LSButton_pressed():
	MoveStream.clickaudio()
	get_tree().change_scene("res://tscn/Level Select.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("quick_quit"):
		MoveStream.clickaudio()
		$ConfirmationDialog.popup()

func _ready():
	GlobalStream.stream = load("res://assets/10finish.ogg")
	GlobalStream.play()
