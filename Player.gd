extends KinematicBody

var GRAVITY_CONSTANT = -8.9

var gravity = Vector3.DOWN  * -GRAVITY_CONSTANT
var acceleration = Vector3()
export var velocity = Vector3()

func _ready():
	pass

func _physics_process(delta):
	if is_on_floor() == false:
		velocity += gravity
	move_and_slide(velocity, Vector3.DOWN)

func _process(delta):
	pass
	# movement/camera events:
	# left stick
	# move_forward
	# move_backward

	# right stick
	# look_left
	# look_right
	# look_up
	# look_down

func _input(event):
	pass