extends Camera

var height = 0
var target
var vel = Vector3()
var offset
var distance = 5
const UP = Vector3(0, 1, 0) 

func _ready():
	set_physics_process(true)
	set_as_toplevel(true)
	target = get_parent()
	
func _physics_process(delta):
	var hor_dir = (int(Input.is_action_pressed("ui_left")) * -1) + int(Input.is_action_pressed("ui_right"))
	var ver_dir = (int(Input.is_action_pressed("ui_up")) * -1) + int(Input.is_action_pressed("ui_down"))
	if hor_dir != 0 || ver_dir != 0:
		height = clamp(height + ver_dir * .01, -.9, 1)
		pass
	var target_pos = target.get_global_transform().origin
	var self_pos = get_global_transform().origin
	offset = self_pos - target_pos
	offset.y = height
	offset = offset.normalized() * distance
	self_pos = target_pos + offset
	look_at_from_position(self_pos, target_pos, UP)