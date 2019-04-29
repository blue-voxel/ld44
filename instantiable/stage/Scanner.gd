extends "res://script/area2d/_Scan.gd"

export (Color, RGB) var color = Color("#3d0606")

var exceptions = []
var active = true
var sum_value = 0

func reset():
	sum_value = 0
	active = true
	exceptions = []

func set_active(b=true):
	if b:
		active = true
		$Sprite.modulate = color
	else:
		active = false
		$Sprite.modulate = color * 2

func _ready():
	$Sprite.modulate = color

func _on_body_entered(body):
	if active and not body in exceptions:
		exceptions.push_back(body)
		sum_value += _get_content_value(body)
		body.get_node("Value").emit_signal("scanned")
		emit_signal("update", sum_value)
	set_active(false)

func _on_body_exited(body):
	var bodies = get_overlapping_bodies()
	if not len(bodies) or bodies[0] == body:
		set_active()
	else:
		print(get_overlapping_bodies(), body)

#I put my signals at the bottom because they ruin the color rules in vscode
signal update(value)