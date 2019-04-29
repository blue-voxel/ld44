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

func _ready():
	coroutine = begin()

func stop():
	stage = STOP
	Game.emit_signal("progress", stage)
	yield()

func begin():

	stage = BEGIN
	Game.emit_signal("progress", stage)
	yield()

	stage = SCAN
	Game.emit_signal("progress", stage)
	yield()

	stage = CACHE
	Game.emit_signal("progress", stage)
	yield()

	stage = CHANGE
	Game.emit_signal("progress", stage)
	yield()
	
	stage = COMPLETE
	Game.emit_signal("progress", stage)
	coroutine = begin()

func progress_stage(target=null): #this is a safegaurd
	if target == null or target == stage + 1: #haven't decided whether this check should bedone by the caller or here
		coroutine.resume()
	else: #this should never happen
		print("progression denied:")
		print("desired target: ",stage + 1)
		print("supplied target: ",target)

signal progress(to)