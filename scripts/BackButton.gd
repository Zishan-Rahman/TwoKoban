extends Button

func _on_BackButton_pressed():
	MoveStream.clickaudio()
	get_tree().change_scene("res://tscn/Menu.tscn")
