extends "res://script/colshape2d/DrawShape.gd"

func _ready():
	draw_type = CIRCLE

var time_elapsed = 0
var offset = 0
var eye_radius = 0
func _process(delta):
	time_elapsed += delta * 3
	offset = sin(time_elapsed) * 0.6
	var max_offset = sin(0) * 0.6
	#print((abs(max_offset - offset)))
	eye_radius = (1 - abs(max_offset - offset)) * shape.radius * 0.5
	offset *= shape.radius
	print(eye_radius)
	_draw()
	
#func _draw(): I think the circle() function should be extended as it is more specific to this, this isn't too important however
func circle():
	
	draw_circle(position, shape.radius * 0.8, Color("#fff"))
	draw_circle(position + Vector2(offset, 0), 10, Color("#000"))