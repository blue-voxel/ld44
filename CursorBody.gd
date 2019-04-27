extends StaticBody2D

var physics_position = Vector2(0,0)
var pin_default

func _ready():
	pin_default = $PinJoint2D.get_node_b()
func _input(event):
	# Mouse in viewport coordinates
	if event is InputEventMouseButton:
		attach_body()
	elif event is InputEventMouseMotion:
		physics_position = event.position
		print($PinJoint2D.node_b)
		pass

func _physics_process(delta):
	position = physics_position

func attach_body():
	if $PinJoint2D.get_node_b():
		$PinJoint2D.set_node_b(pin_default)
	else:
		var intersect = get_world_2d().direct_space_state.intersect_point(position, 1, [self]) #get 1 bodies at current position (except self) on layer 3 only (bit 4)
		if intersect:
			print(intersect[0])
			$PinJoint2D.set_node_b(intersect[0].collider.get_path())