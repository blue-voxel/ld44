tool
extends Node2D

class_name Mouth


export (float) var width = 10 setget set_width
export (float) var height = 10 setget set_height
export (float, 0, 1) var anger = 0 setget set_anger

func set_width(f):
	width = f
	update()

func set_height(f):
	height = f
	update()
	
func set_anger(v):
	anger = v
	update()

var curve = Curve2D.new()

func _ready():
	_update()
	
func _update():
	curve = Curve2D.new()
	var half_width = width / 2
	var anger = Vector2(10, 10)
	var reverse_anger = Vector2(-10, -10)
	# So these anger and reverse_anger things are supposed to help
	# shape the mouth to be sad. More anger, more sadness.
	# The mouth is roughly a rectangle which is supposed to be warped upwards
	# at the center
	var nothing = Vector2(0, 0)
	curve.add_point(Vector2(-half_width, 0), nothing, anger)
	curve.add_point(Vector2(half_width, 0), reverse_anger, nothing)
	curve.add_point(Vector2(half_width, height), nothing, reverse_anger)
	curve.add_point(Vector2(-half_width, height), anger, nothing)
	curve.add_point(Vector2(-half_width, 0))
	
func _draw():
	draw_polyline(curve.get_baked_points(), Color("#aaa"), 2)
	