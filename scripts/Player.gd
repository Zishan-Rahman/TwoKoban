extends KinematicBody2D

onready var ray = $RayCast2D
onready var movesound
var grid = 16
var play_inputs

func check_colour():
	if self.is_in_group('blue'):
		play_inputs = {
			'blue_up' : Vector2.UP,
			'blue_down' : Vector2.DOWN,
			'blue_left' : Vector2.LEFT,
			'blue_right' : Vector2.RIGHT
		}
		movesound = load("res://assets/kenneyjump1edited1.ogg")
	elif self.is_in_group('yellow'):
		play_inputs = {
			'yellow_up' : Vector2.UP,
			'yellow_down' : Vector2.DOWN,
			'yellow_left' : Vector2.LEFT,
			'yellow_right' : Vector2.RIGHT
		}
		movesound = load("res://assets/kenneyjump1edited2.ogg")

func move(direction):
	var gem = get_parent().get_parent()
	var vpos = play_inputs[direction] * grid
	ray.cast_to = vpos
	ray.force_raycast_update()
	$Tween.interpolate_property(
		self, "position",
		position, position + vpos, 0.3,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	if !ray.is_colliding() and !ray.is_in_group('player'):
		$Tween.start()
		MoveStream.stream = movesound
		MoveStream.play()
		gem.moves += 1
	else:
		var collider = ray.get_collider()
		if collider.is_in_group('box') && ((collider.is_in_group('blue') && self.is_in_group('blue')) || (collider.is_in_group('yellow') && self.is_in_group('yellow'))) && !collider.is_in_group('player'):
			if collider.move(direction):
				$Tween.start()
				MoveStream.stream = movesound
				MoveStream.play()
				gem.moves += 1

func _unhandled_input(event): 
	for direction in play_inputs.keys():
		if event.is_action_pressed(direction) and !$Tween.is_active():
			move(direction)

func _ready():
	check_colour()

func _on_Tween_tween_all_completed():
	get_parent().get_parent().if_finished()
