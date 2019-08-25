extends KinematicBody

var GRAVITY_CONSTANT = -8.9

var gravity = Vector3.DOWN  * -GRAVITY_CONSTANT
var acceleration = Vector3()
export var velocity = Vector3()

var MAX_FALL_SPEED = Vector3.DOWN * 200

func _ready():
	pass

func _physics_process(delta):
	if is_on_floor() == false:
		velocity += gravity
		velocity.y = clamp(velocity.y, MAX_FALL_SPEED.y, 0)
		move_and_slide(velocity, Vector3.DOWN)
	else:
		velocity.y = 0

func _process(delta):
	pass
	# Get camera's facing direction and move relative to that

func _input(event):
	pass