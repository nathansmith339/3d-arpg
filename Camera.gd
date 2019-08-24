extends Camera

var distance = 4
var fixed = false
var frozen = false
var target
var outter
var inner
const UP = Vector3(0, 1, 0) 

func _ready():
	target = get_parent().get_parent().get_parent()
	outter = get_parent().get_parent()
	inner = get_parent()
	
	outter.set_physics_process(true)
	outter.set_as_toplevel(true)
	
func _physics_process(delta):
	var hor_dir = (int(Input.is_action_pressed("ui_left")) * -1) + int(Input.is_action_pressed("ui_right"))
	var ver_dir = (int(Input.is_action_pressed("ui_up")) * -1) + int(Input.is_action_pressed("ui_down"))
	if hor_dir != 0 || ver_dir != 0:
		outter.set_as_toplevel(false)
		target.rotate_y(hor_dir * .01)
		inner.rotate_x(ver_dir * .01)
	else:
		outter.set_as_toplevel(true)
	
	var target_pos = target.get_global_transform().origin
	var outter_pos = outter.get_global_transform().origin
	var offset = outter_pos - target_pos
	
	offset = offset.normalized()
	outter_pos = target_pos + offset
	
	outter.look_at_from_position(outter_pos, target_pos, UP)
	