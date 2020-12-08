extends KinematicBody2D

onready var ray = $RayCast2D
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
	elif self.is_in_group('yellow'):
		play_inputs = {
			'yellow_up' : Vector2.UP,
			'yellow_down' : Vector2.DOWN,
			'yellow_left' : Vector2.LEFT,
			'yellow_right' : Vector2.RIGHT
		}

func move(direction):
	var vpos = play_inputs[direction] * grid
	ray.cast_to = vpos
	ray.force_raycast_update()
	$Tween.interpolate_property(
		self, "position", 
		position, position + vpos, 0.3, 
		Tween.TRANS_SINE, 
		Tween.EASE_IN_OUT
	)
	if !ray.is_colliding():
		$Tween.start()
		return true
	return false

func _ready():
	check_colour()
