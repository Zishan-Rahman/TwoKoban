extends Area2D

var occupied = false

func _on_Goal_body_entered(body):
	if body.is_in_group('box') and  ((body.is_in_group('blue') and self.is_in_group('blue')) or (body.is_in_group('yellow') and self.is_in_group('yellow'))):
		occupied = true
		if body.is_in_group('blue'):
			MoveStream.stream = load("res://assets/kenneylose1edited1.ogg")
		elif body.is_in_group('yellow'):
			MoveStream.stream = load("res://assets/kenneylose1edited2.ogg")
		MoveStream.play()

func _on_Goal_body_exited(body):
	if body.is_in_group('box') and  ((body.is_in_group('blue') and self.is_in_group('blue')) or (body.is_in_group('yellow') and self.is_in_group('yellow'))):
		occupied = false
