extends "res://script/colshape2d/DrawShape.gd"

func _ready():
	draw_type = CIRCLE
	set_color(color)

func set_color(col):
	.set_color(col)
	if has_node("Eye"):
		$Eye.set_color(color.darkened(0.3))

