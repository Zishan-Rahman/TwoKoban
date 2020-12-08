extends Control

func _ready():
	if GlobalStream.isplay:
		GlobalStream.stream = load("res://assets/tktitle.ogg")
		GlobalStream.play()
		GlobalStream.isplay = false
	for button in get_tree().get_nodes_in_group("level_select_button"):
		button.connect("pressed", self, "_button_is_pressed", [button])

func _button_is_pressed(button):
	MoveStream.clickaudio()
	get_tree().change_scene("res://levels/Level " + button.name + ".tscn")

func _unhandled_input(event):
	if event.is_action_pressed("quick_quit"):
		MoveStream.clickaudio()
		$ConfirmationDialog.popup()
