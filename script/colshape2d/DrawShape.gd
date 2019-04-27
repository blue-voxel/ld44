tool
extends CollisionShape2D

export (Color, RGBA) var col = Color(1,0,0,1) setget _set_color

enum {RECT, CIRCLE}
var draw_type = null

func rectangle():
	draw_rect(Rect2(-shape.extents, shape.extents * 2), col)

func circle():
	draw_circle(position, shape.radius, col)

func _ready():
	if shape.is_class("RectangleShape2D"):
		draw_type = RECT
	elif shape.is_class("CircleShape2D"):
		draw_type = CIRCLE

func _draw():
	match draw_type:
		RECT:
			rectangle()
		CIRCLE:
			circle()

func _set_color(color):
	col = color
	update()

func update():
	pass # Replace with function body.
