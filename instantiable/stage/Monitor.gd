extends Node


var due_value = 0

var register_value = 0
var register_delta = 0

func _ready():
	Game.connect("progress", self, "on_game_progress")
	on_game_progress(Game.stage)

func _on_scan(value):
	if Game.stage == Game.SCAN - 1:
		Game.progress_stage()
	elif Game.stage == Game.SCAN: #hopefully this will prevent more headscratches than it causes
		set_due_value(value)

func set_due_value(value):
		due_value = value
		$Screen.get_node("Due").set_amount(value)

func on_register_update(value):
	if Game.stage == Game.CACHE:
		register_delta = value - register_value
		set_due_value(due_value - register_delta)
		if due_value <= 0:
			Game.progress_stage(Game.CHANGE)
	else:
		register_value = value

func on_game_progress(stage):
	print(stage)
	match stage:
		Game.BEGIN:
			$AnimationPlayer.play("scan")
		Game.SCAN:
			$AnimationPlayer.play("due")
		Game.CACHE:
			pass

func test(stage):
	print("test",stage)


func _on_register_update(value):
	pass # Replace with function body.
