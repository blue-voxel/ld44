extends "res://script/colshape2d/DrawShape.gd"

#func rectangle():
#	draw_rect(Rect2(position - shape.extents, shape.extents * 2), col)
#since you're inherting, it's not neccesary to keep these

func circle():
	draw_circle(position, shape.radius, col)

func _ready():
	#_set_color(Color("#0074D9")) this should be set in the editor, that's what "export" is for
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
	update()
	
#func _draw(): I think the circle() function should be extended as it is more specific to this, this isn't too important however
func circle():
	.circle()
	#draw_circle(position, shape.radius * 0.8, Color("#fff")) this should go afterwards as it renders on top
	draw_circle(position + Vector2(offset, 0), eye_radius, Color("#000"))
	draw_circle(position, shape.radius * 0.8, Color("#fff"))