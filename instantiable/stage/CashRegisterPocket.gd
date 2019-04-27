extends Area2D

var sum_value

func set_width(w):
	$CollisionShape2D.shape.extents.x = w

func set_height(h):
	$CollisionShape2D.shape.extents.y = h 

func _ready():
	#attach built in signals to associated functions
	connect("body_entered", self, "on_body_entered")
	connect("body_exited", self, "on_body_exited")
	#init
	get_total_value()

func get_content_value(body):
	var v = body.get_node_or_null("Value")
	if v:
		return v.amount
	return 0

func get_total_value():
	sum_value = 0
	for body in get_overlapping_bodies():
		sum_value += get_content_value(body)

func on_body_entered(body):
	sum_value += get_content_value(body)
	print(sum_value)

func on_body_exited(body):
	sum_value -= get_content_value(body)
	print(sum_value)
		
