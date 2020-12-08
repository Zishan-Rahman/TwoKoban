extends Node2D

export (String, FILE, "*tscn") var next_level
export (String, FILE, "*ogg") var song
var finish = false
var moves = 0

func _process(_delta):
	$Labels/MoveLabel.text = "Moves: " + str(moves)
	$Labels/LevelLabel.text = get_tree().get_current_scene().get_name()

func if_finished():
	if !finish:
		var spaces = $Goals.get_child_count()
		for i in $Goals.get_children():
			if i.occupied:
				spaces -= 1
		if spaces == 0:
			$AcceptDialog.popup()
			MoveStream.stream = load("res://assets/kenneypickup1edited1.ogg")
			MoveStream.play()
			finish = true

func _unhandled_input(event):
	if event.is_action_pressed("replay"):
		MoveStream.clickaudio()
		get_tree().reload_current_scene()
	if event.is_action_pressed("pause"):
		MoveStream.clickaudio()
		$PauseDialog.popup()
		GlobalStream.stream_paused = true
	if event.is_action_pressed("quick_quit"):
		MoveStream.clickaudio()
		$ConfirmationDialog.popup()

func _on_AcceptDialog_confirmed():
	MoveStream.clickaudio()
	get_tree().change_scene(next_level)

func _ready():
	GlobalStream.stream_paused = false
	GlobalStream.stream = load(song)
	GlobalStream.play()
	GlobalStream.isplay = true

func _on_PauseDialog_confirmed():
	MoveStream.clickaudio()
	GlobalStream.stream_paused = false

func _on_PauseDialog_custom_action(action):
	if action == "restart":
		MoveStream.clickaudio()
		get_tree().reload_current_scene()
	elif action == "return_to_menu":
		MoveStream.clickaudio()
		GlobalStream.stream_paused = false
		get_tree().change_scene("res://tscn/Menu.tscn")
	elif action == "exit":
		MoveStream.clickaudio()
		$ConfirmationDialog.popup()
