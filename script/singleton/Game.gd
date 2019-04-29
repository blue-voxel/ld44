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

func _ready():
	stop()

func stop():
	stage = STOP
	Game.emit_signal("progress", stage)
	#yield()
	progress_stage()

func next_stage():
	if stage == COMPLETE:
		return BEGIN
	return stage + 1

func progress_stage(target=null): #this is a safegaurd
	if target == null or target == next_stage(): #haven't decided whether this check should bedone by the caller or here
		stage = next_stage()
		print("progressed to stage ", stage)
		Game.emit_signal("progress", stage)
	else: #this should never happen
		print("progression denied:")
		print("desired target: ",stage + 1)
		print("supplied target: ",target)

signal progress(to)