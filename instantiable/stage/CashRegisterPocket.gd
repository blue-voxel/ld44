extends "res://script/area2d/_Scan.gd"

export (int) var accept_only = 0
var sum_value

func set_width(w):
	$CollisionShape2D.shape.extents.x = w

func set_height(h):
	$CollisionShape2D.shape.extents.y = h 

func _ready():
	get_total_value()

func get_total_value():
	sum_value = 0
	for body in get_overlapping_bodies():
		sum_value += _get_content_value(body)

func _get_content_value(body):
	var v = ._get_content_value(body)
	return v if not accept_only or v == accept_only else 0

func _on_body_entered(body):
	._on_body_entered(body)
	sum_value += _get_content_value(body)
	print(sum_value)

func _on_body_exited(body):
	._on_body_exited(body)
	sum_value -= _get_content_value(body)
	print(sum_value)
		
