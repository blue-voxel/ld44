extends Area2D

func set_width(w):
	$CollisionShape2D.shape.extents.x = w

func set_height(h):
	$CollisionShape2D.shape.extents.y = h 

func _physics_process(delta):
	var overlaps = get_overlapping_bodies()
	