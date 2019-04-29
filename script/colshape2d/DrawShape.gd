tool
extends CollisionShape2D

export (Color, RGBA) var color = Color("f00") setget set_color

enum {RECT, CIRCLE}
var draw_type = null

func set_color(col):
	color = col
	update()

func rectangle():
	draw_rect(Rect2(-shape.extents, shape.extents * 2), color)

func circle():
	draw_circle(position, shape.radius, color)

func _ready():
	draw_type = get_draw_type()

func get_draw_type():
	if draw_type == null:
		if shape.is_class("RectangleShape2D"):
			draw_type = RECT
		elif shape.is_class("CircleShape2D"):
			draw_type = CIRCLE
	return draw_type
		
func _draw():
	match get_draw_type():
		RECT:
			rectangle()
		CIRCLE:
			circle()



func update():
	pass # Replace with function body.
