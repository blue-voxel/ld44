extends "res://script/area2d/_Scan.gd"

#warning-ignore:unused_class_variable
export var accept_only = 0
var sum_value = 0

func _ready():
	get_total_value()

func get_total_value():
	sum_value = 0
	for body in get_overlapping_bodies():
		sum_value += _get_content_value(body)
	emit_signal("update")

func _get_content_value(body):
	var v = ._get_content_value(body)
	return v if not accept_only or v == accept_only else 0

func _on_body_entered(body):
	sum_value += _get_content_value(body)
	emit_signal("update")

func _on_body_exited(body):
	sum_value -= _get_content_value(body)
	emit_signal("update")

#I put my signals at the bottom because they ruin the color rules in vscode
signal update