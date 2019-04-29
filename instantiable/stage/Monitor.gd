extends Node

var due_value = 0

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

func on_game_progress(stage):
	print(stage)
	match stage:
		Game.BEGIN:
			$AnimationPlayer.play("scan")
		Game.SCAN:
			$AnimationPlayer.play("due")

func test(stage):
	print("test",stage)
