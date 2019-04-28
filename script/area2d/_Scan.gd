extends Area2D

func _ready():
	#attach built in signals to associated functions
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

func _get_content_value(body):
	var v = body.get_node_or_null("Value")
	if v:
		return v.amount
	return 0

func _on_body_entered(body): pass
func _on_body_exited(body): pass
