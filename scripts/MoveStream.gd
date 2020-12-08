extends AudioStreamPlayer

export (Resource) var buttonaudio = load("res://assets/kenneyswitch1.ogg")

func clickaudio():
	self.stream = buttonaudio
	self.play()
