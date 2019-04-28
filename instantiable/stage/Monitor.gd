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

func stage_stop():
	stage = STOP
	coroutine = stage_begin()

func stage_begin():
	stage = BEGIN
	$AnimationPlayer.play("scan")
	while yield($AnimationPlayer, "animation_finished") != "yeet":
		$AnimationPlayer.play("scan")
	coroutine = stage_scan()
	
func stage_scan():
	stage = SCAN
	
	$AnimationPlayer.play("due")
	yield()
	coroutine = stage_cache()

func stage_cache():
	stage = CACHE
	coroutine = stage_change()

func stage_change():
	stage = CHANGE
	coroutine = stage_complete()

func stage_complete():
	stage = COMPLETE
	coroutine = stage_scan()


func _on_scan(value):
	print("item scanned, current stage: ",stage)
	if stage == SCAN - 1:
		progress_stage()
	due_value = value

func set_due_value(value):
	due_value = value
	$Screen.get_node("Due").set_amount(value)

func progress_stage():
	print("progressing stage...")
	coroutine.resume("yeet")

func _ready():
	coroutine = stage_stop()
