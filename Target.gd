extends Spatial

const MAX_LOOK_UP_DEG = -30
const MAX_LOOK_DOWN_DEG = 30

var look_speed = 0.02

func _ready():
	set_physics_process(true)
	set_as_toplevel(false)

func _physics_process(delta):
	var hor_dir = (int(Input.is_action_pressed("ui_right")) * -1) + int(Input.is_action_pressed("ui_left"))
	var ver_dir = (int(Input.is_action_pressed("ui_down")) * -1) + int(Input.is_action_pressed("ui_up"))
		
	if ver_dir != 0 || hor_dir != 0:
		rotate_object_local(Vector3(-1, 0, 0), look_speed * ver_dir * PI) # rotate in Y first
		rotate_object_local(Vector3(0, -1, 0), look_speed * hor_dir * PI) # then rotate in X
		
		rotation_degrees.x = clamp(rotation_degrees.x, MAX_LOOK_UP_DEG, MAX_LOOK_DOWN_DEG)
		rotation_degrees.y = rotation_degrees.y
		rotation_degrees.z = 0