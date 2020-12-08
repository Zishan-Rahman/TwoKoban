extends ConfirmationDialog

func _on_ConfirmationDialog_confirmed():
	MoveStream.clickaudio()
	get_tree().quit()
