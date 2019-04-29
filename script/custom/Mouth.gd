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

onready var curve = Curve2D.new()
onready var lips = Color("#c28787")

func _ready():
	_update()
	
func _update():
	var adj_anger = anger * height
	var half_width = width / 2
	var anger_point = Vector2(adj_anger, -adj_anger)
	var reverse_anger_point = Vector2(-adj_anger, -adj_anger)
	# So these anger and reverse_anger things are supposed to help
	# shape the mouth to be sad. More anger, more sadness.
	# The mouth is roughly a rectangle which is supposed to be warped upwards
	# at the center
	var nothing = Vector2(0, 0)
	curve.add_point(Vector2(-half_width, adj_anger), nothing, anger_point)
	curve.add_point(Vector2(half_width, adj_anger), reverse_anger_point, nothing)
	
func _draw():
	var adj_anger = anger * height
	var half_width = width / 2
	draw_circle(Vector2(-half_width, adj_anger), 4, lips)
	draw_circle(Vector2(half_width, adj_anger), 4, lips)
	draw_polyline(curve.get_baked_points(), lips, 10)
	draw_polyline(curve.get_baked_points(), Color("#000"), 4)
	