extends Node

enum{
	STOP,
	BEGIN,
	SCAN,
	CACHE,
	CHANGE,
	COMPLETE,
}
var stage = 0
var coroutine = null

var due_value = 0

func stop():
	print("in stop: ",coroutine)
	stage = STOP
	yield()

func begin():

	stage = BEGIN
	$AnimationPlayer.play("scan")
	yield()

	stage = SCAN
	$AnimationPlayer.play("due")
	yield()

	stage = CACHE
	yield()

	stage = CHANGE
	yield()
	
	stage = COMPLETE
	coroutine = begin()

func _on_scan(value):
	if stage == SCAN - 1:
		progress_stage()
	set_due_value(value)

func set_due_value(value):
	due_value = value
	$Screen.get_node("Due").set_amount(value)

func progress_stage():
	coroutine.resume()

func _ready():
	coroutine = begin()
