extends Area2D

var sum_value

func set_width(w):
	$CollisionShape2D.shape.extents.x = w

func set_height(h):
	$CollisionShape2D.shape.extents.y = h 

func _physics_process(delta):
	for body in get_overlapping_bodies():
		body.
		
