extends Button

func _on_GoBackButton_pressed():
	MoveStream.clickaudio()
	get_tree().change_scene("res://tscn/Menu.tscn")
