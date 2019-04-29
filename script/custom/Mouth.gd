tool
extends Node2D

class_name Mouth

export (Color, RGB) var color = Color("#c28787")
export (float) var width = 10 setget set_width
export (float) var radius = 10 setget set_radius
export (float) var mood = 0 setget set_mood
export (float, 0, 1) var crease = 0.2 setget set_crease

func set_width(f):
	width = f
	update_curve()
	update()

func set_radius(f):
	radius = f
	update()
	
func set_mood(v):
	mood = v
	update_curve()
	update()

func set_crease(f):
	crease = f
	update()

var curve

func _ready():
	update_curve()
	
func update_curve():
	curve = Curve2D.new()
	var adj_mood = mood * 10
	var half_width = width / 2
	var mood_point = Vector2(adj_mood, -adj_mood)
	var reverse_mood_point = Vector2(-adj_mood, -adj_mood)
	var nothing = Vector2(0, 0)
	curve.add_point(Vector2(-half_width, adj_mood), nothing, mood_point)
	curve.add_point(Vector2(half_width, adj_mood), reverse_mood_point, nothing)
	
func _draw():
	draw_curve(color, radius)
	draw_curve(color.darkened(0.6), radius * crease)

func draw_curve(color, line_width):
	draw_polyline(curve.get_baked_points(), color, line_width)
	draw_circle(curve.get_point_position(0), line_width / 2, color)
	draw_circle(curve.get_point_position(curve.get_point_count() - 1), line_width / 2, color)