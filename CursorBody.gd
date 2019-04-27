extends StaticBody2D

var physics_position = Vector2(0,0)

func _input(event):
   # Mouse in viewport coordinates
   if event is InputEventMouseButton:
       attach_body()
   elif event is InputEventMouseMotion:
       physics_position = event.position

func _physics_process(delta):
	position = physics_position


func attach_body():
	print($PinJoint2D.node_b)
	if $PinJoint2D.get_node_b():
		$PinJoint2D.set_node_b(null)
	else:
		var intersect = get_world_2d().direct_space_state.intersect_point(position, 1, [self], 4) #get 1 bodies at current position (except self) on layer 3 only (bit 4)
		if intersect:
			$PinJoint2D.set_node_b(intersect["collider"])
			#print($PinJoint2D.node_b)